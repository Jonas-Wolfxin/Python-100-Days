#!/bin/bash

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  if [[ $1 =~ [0-9]+ ]]
  then
    RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1 ;")
  else
    RESULT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1' OR name = '$1';")
  fi

  # To see if the result exists
  if [[ -z $RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$RESULT" | while IFS="|" read ATOMIC_NUM SYMBOL NAME
    # get the info and do the while loop
    do
      RESULT_TYPE=$($PSQL "SELECT type FROM types RIGHT JOIN properties USING (type_id) WHERE atomic_number = $ATOMIC_NUM")
      RESULT_PRO=$($PSQL "SELECT  atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties Where atomic_number = $ATOMIC_NUM")
      echo "$RESULT_PRO" | while IFS="|" read AM MPC BPC
      do
        echo -e "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $RESULT_TYPE, with a mass of $AM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
    done
  fi
fi
# Test result : successfully
