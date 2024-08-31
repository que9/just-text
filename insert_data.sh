#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


echo $($PSQL "TRUNCATE teams, games;")

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
      TEAM_EXISTS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
      # Team not found
      if [[ -z $TEAM_EXISTS ]]
      then
          TEAM_INSERTED=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          if [[  $TEAM_INSERTED == 'INSERT 0 1' ]] 
          then
            echo "Inserted a team : $WINNER"
          fi
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      TEAM_EXISTS=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
      # Team not found
      if [[ -z $TEAM_EXISTS ]]
      then
          TEAM_INSERTED=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[  $TEAM_INSERTED == 'INSERT 0 1' ]] 
          then
            echo "Inserted a team : $OPPONENT"
          fi
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      # Games table 
      GAME_INSERTED=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      echo "$GAME_INSERTED"
  fi
done
