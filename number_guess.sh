#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
MAX=1000
MIN=1
RANDOM_NUMBER=$((RANDOM % (MAX - MIN + 1) + MIN))

echo -e "Enter your username:\n"
read USERNAME

USER_DATA=$($PSQL "SELECT id, name, games_played, best_game FROM username WHERE name='$USERNAME'")

if [[  -z $USER_DATA  ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  echo $USER_DATA | while read ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
    do
    echo -e "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
fi