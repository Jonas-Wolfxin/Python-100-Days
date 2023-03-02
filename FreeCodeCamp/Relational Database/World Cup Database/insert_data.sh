#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINGO OPPOGO
do
  if [[ $YEAR != "year" ]]
  then
    TEAM_ID1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    if [[ -z $TEAM_ID1 ]]
    then
      # insert the TEAM to teams Table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")
      echo $INSERT_TEAM_RESULT
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    fi

    TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPO';")
    if [[ -z $TEAM_ID2 ]]
    then
      # insert the TEAM to teams Table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPO');")
      echo $INSERT_TEAM_RESULT
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPO';")
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINGO OPPOGO
do
  if [[ $YEAR != "year" ]]
  then
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPO_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPO';")
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WIN_ID, $OPPO_ID, $WINGO, $OPPOGO);")
    echo $INSERT_GAME_RESULT
  fi
done