#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
number_of_guesses=0

function GAME_GUE() {
  if [[ -z $1 ]]
  then 
    echo "Guess the secret number between 1 and 1000:"
  else
    echo "$1"
  fi    

  read USERNUM

  if [[ ! $USERNUM =~ ^[0-9]+$ ]]
  then
    let number_of_guesses++
    GAME_GUE "That is not an integer, guess again:"
  else
    if [[ $USERNUM -gt $random_num ]]
    then
      let number_of_guesses++
      GAME_GUE "It's higher than that, guess again:"
    elif [[ $USERNUM -lt $random_num ]]
    then
      let number_of_guesses++
      GAME_GUE "It's lower than that, guess again:"
    else
      let number_of_guesses++
      echo "You guessed it in $number_of_guesses tries. The secret number was $random_num. Nice job!"
      
      GUE_GUE=$($PSQL "SELECT guesses FROM users WHERE username = '$USER_de_NAME';")

      if [[ $GUE_GUE != 0 ]]
      then
        if [[ $number_of_guesses -gt $GUE_GUE ]]
        then
          number_of_guesses=$GUE_GUE
        fi
      fi

      UPDATE_GUE=$($PSQL "UPDATE users SET guesses = $number_of_guesses WHERE username = '$USER_de_NAME';")
      # if [[ $UPDATE_GUE == 'UPDATE 1' ]]
      # then
      #   echo "recorded successfully!"
      # else 
      #   echo "recorded FAIL!"
      # fi     
    fi
  fi
}

echo "Enter your username:"
read USER_de_NAME

USER_EXIST=$($PSQL "SELECT times, guesses FROM users WHERE username = '$USER_de_NAME';")

TIME_GUE=0
random_num=$((1 + RANDOM % 1000))

if [[ -z $USER_EXIST ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USER_de_NAME');")
  if [[ $INSERT_USER == 'INSERT 0 1' ]]
  then
    echo "Welcome, $USER_de_NAME! It looks like this is your first time here."
    let TIME_GUE++
    UPDATE_TIMES=$($PSQL "UPDATE users SET times = $TIME_GUE WHERE username = '$USER_de_NAME';")
  fi
else
  echo "$USER_EXIST" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    TIME_GUE=$TIMES

    echo "Welcome back, $USER_de_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    let TIME_GUE++
    INSERT_TIMES=$($PSQL "UPDATE users SET times = $TIME_GUE WHERE username = '$USER_de_NAME';")
  done
fi

GAME_GUE
