#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
MAX=1000
MIN=1
RANDOM_NUMBER=$((RANDOM % (MAX - MIN + 1) + MIN))
ATTEMPTS=0

GUESS_GAME (){
  echo -e "$1"
  read GUESS

  if [[  $GUESS =~ ^[0-9]+$  ]]; then
    if [[  $GUESS > $RANDOM_NUMBER  ]]; then
    GUESS_GAME "It's lower than that, guess again:"
    let COUNT=COUNT+1
    elif [[ $GUESS < $RANDOM_NUMBER  ]]; then
    GUESS_GAME "It's higher than that, guess again:"
    let COUNT=COUNT+1
    elif [[  $GUESS ==  $RANDOM_NUMBER  ]]; then
    You guessed it in $ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!
    fi
  else
    GUESS_GAME "That is not an integer, guess again:"
  fi

}

echo -e "Enter your username:\n"
read USERNAME

USER_DATA=$($PSQL "SELECT id, name, games_played, best_game FROM username WHERE name='$USERNAME'")

if [[  -z $USER_DATA  ]]; then
  INSERT_NEW_USER=$($PSQL "INSERT INTO username(name) VALUES('$USERNAME')")
  USER_DATA=$($PSQL "SELECT id, name, games_played, best_game FROM username WHERE name='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  echo $USER_DATA | while read ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
    do
    echo -e "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
fi
