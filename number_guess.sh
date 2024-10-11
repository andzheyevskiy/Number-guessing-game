#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
MAX=1000
MIN=1
RANDOM_NUMBER=$((RANDOM % (MAX - MIN + 1) + MIN))
ATTEMPTS=0

SAVE_DATA (){
  if [[  $# -eq 0  ]]; then
    echo "Error saving data"
  else
  IFS="|" read -r ID NAME GAMES_PLAYED BEST_GAME <<< "$1"
    # Update best game value if needed 
    BEST=$BEST_GAME
    BEST=$BEST_GAME
    if [[ -z $BEST_GAME || $ATTEMPTS -lt $BEST_GAME ]]; then
      BEST=$ATTEMPTS
    fi
    #update number of games played
    ((GAMES_PLAYED++))
    UPDATE=$($PSQL "UPDATE username SET games_played = $GAMES_PLAYED, best_game = $BEST WHERE id = $ID")
  fi
}

GUESS_GAME (){
  echo -e "$1"
  ((ATTEMPTS++))
  read GUESS

  if [[  $GUESS =~ ^[0-9]+$  ]]; then
    if [[  $GUESS > $RANDOM_NUMBER  ]]; then
    GUESS_GAME "It's lower than that, guess again:" "$2"
    elif [[ $GUESS < $RANDOM_NUMBER  ]]; then
    GUESS_GAME "It's higher than that, guess again:" "$2"
    elif [[  $GUESS ==  $RANDOM_NUMBER  ]]; then
    echo "You guessed it in $ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"
    SAVE_DATA "$2"
    fi
  else
    echo "$GUESS"
    GUESS_GAME "That is not an integer, guess again:"
  fi

}

echo -e "Enter your username:\n"
read USERNAME

USER_DATA=$($PSQL "SELECT id, name, games_played, best_game FROM username WHERE name='$USERNAME'")

if [[  -z $USER_DATA  ]]; then
  INSERT_NEW_USER=$($PSQL "INSERT INTO username(name,games_played) VALUES('$USERNAME',0)")
  USER_DATA=$($PSQL "SELECT id, name, games_played, best_game FROM username WHERE name='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GUESS_GAME "Guess the secret number between 1 and 1000:" "$USER_DATA"
else
  IFS="|" read -r ID NAME GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
    echo -e "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GUESS_GAME "Guess the secret number between 1 and 1000:" "$USER_DATA"
fi
