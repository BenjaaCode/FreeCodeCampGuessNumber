#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

RANDOM_NUMBER=$(( 1 + RANDOM % 1000 ))
echo $RANDOM_NUMBER

echo 'Enter your username: '
read USERNAME

CHECK_USER=$($PSQL "SELECT username, games_played, best_game FROM user_guess WHERE username = '$USERNAME'")
NUMBER_OF_GUESSES=0 

if [[ -z $CHECK_USER ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO user_guess(username, games_played, best_game) VALUES('$USERNAME', 0, null)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  IFS="|" read DB_USERNAME GAMES_PLAYED BEST_GAME <<< "$CHECK_USER"
  echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if (( GUESS < RANDOM_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  elif (( GUESS > RANDOM_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    USER_ID=$($PSQL "SELECT user_id FROM user_guess WHERE username='$DB_USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_guess WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM user_guess WHERE username='$USERNAME'")

    ((GAMES_PLAYED++))

    if [[ -z $BEST_GAME ]] || (( NUMBER_OF_GUESSES < BEST_GAME ))
    then
      UPDATE_RESULT=$($PSQL "UPDATE user_guess SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
    else
      UPDATE_RESULT=$($PSQL "UPDATE user_guess SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
    fi

    break
  fi
done
