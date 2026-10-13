#!/bin/bash
 PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Random number
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
TRY=0

#Create Username
echo Enter your username:
read USERNAME

#SELECT info FROM users
VAR=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

#know if username was used before
if [[  -z "$VAR"  ]]; then

echo Welcome, "$USERNAME"! It looks like this is your first time here.
#New Username
INSERT_USERNAME=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")

else

echo Welcome back, "$USERNAME"! You have played "$GAMES_PLAYED" games, and your best game took "$BEST_GAME" guesses.

fi

echo Guess the secret number between 1 and 1000:
read GUESS


# While loop to guess number
while ! [[ $GUESS -eq $RANDOM_NUMBER ]]; do
  if ! [[ $GUESS =~ ^-?[0-9]+$ ]]; then
  echo That is not an integer, guess again:

  elif [[ $GUESS -gt $RANDOM_NUMBER ]]; then
  TRY=$(( TRY + 1 ))
  echo "It's lower than that, guess again:"

  elif [[ $GUESS -lt $RANDOM_NUMBER ]]; then
  TRY=$(( TRY + 1 ))
  echo "It's higher than that, guess again:"
  fi

read GUESS
done

#you guessed the number
TRY=$(( TRY + 1 ))
echo You guessed it in "$TRY" tries. The secret number was "$RANDOM_NUMBER". Nice job!
#Update games played
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")
#Update best game
UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = LEAST(best_game, '$TRY')WHERE username='$USERNAME'")
