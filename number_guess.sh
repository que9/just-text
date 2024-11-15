#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
LOWER_GUESS="It's lower than that, guess again:"
HIGHER_GUESS="It's higher than that, guess again:"
NOT_INTEGER="That is not an integer, guess again:"
REGX='^[0-9]+$'
TOTAL_GUESSES=0
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
USER_BEST=0
GUESS=-1
PLAYED=0

WELCOME_USER() {
  USER_EXISTS=$($PSQL "SELECT * FROM users WHERE username = '$1'")
  if [[ -z $USER_EXISTS ]]; then
    echo "Welcome, $1! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$1')")
  else
    USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$1'")
    echo "$USER_INFO" | while IFS='|' read USERNAME TIMES_PLAYED BEST; do
        USER_BEST=$BEST
        PLAYED=$TIMES_PLAYED
        echo "Welcome back, $1! You have played $TIMES_PLAYED games, and your best game took $BEST guesses."
      done
  fi
}

PLAY_GAME() {
  echo "Guess the secret number between 1 and 1000:"
  until [ $SECRET_NUMBER == "$GUESS" ] 
  do
    read GUESS
    if [[ ! $GUESS =~ $REGX ]]; then
      echo $NOT_INTEGER
    else 
        (( TOTAL_GUESSES++ ))
        if [[ $GUESS -lt $SECRET_NUMBER ]]; then
          echo $HIGHER_GUESS
        elif [[ $GUESS -gt $SECRET_NUMBER ]] ; then
          echo $LOWER_GUESS
        fi
    fi
  done

  if [[ $USER_BEST -lt $TOTAL_GUESSES ]]; then
    (( PLAYED++ ))
    UPDATE_BEST=$($PSQL "UPDATE users SET best=$TOTAL_GUESSES, times_played=$PLAYED")
  fi
  echo -e "\nYou guessed it in $TOTAL_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
}


echo "Enter your username:"
read USERNAME

WELCOME_USER "$USERNAME"
PLAY_GAME "$USERNAME"
