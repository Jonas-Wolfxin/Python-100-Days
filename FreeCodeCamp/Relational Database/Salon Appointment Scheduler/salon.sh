#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples -c "

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # get Services list
  SERVICES_LIST=$($PSQL "SELECT * FROM services ORDER BY service_id;")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED == "EXIT" ]]
  then
    EXIT
  else
    SERVICE_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';")
    if [[ -z $SERVICE_RESULT ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
        SET_APPOIN
      else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
        SET_APPOIN
      fi
    fi
  fi
}

SET_APPOIN() {
    echo -e "\nWhat time would you like your $SERVICE_RESULT, $CUSTOMER_NAME?"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    INSERT_APPOIN_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    if [[ $INSERT_APPOIN_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $SERVICE_RESULT at $SERVICE_TIME, $CUSTOMER_NAME." | sed 's/  / /g'
    fi
  }
EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU
