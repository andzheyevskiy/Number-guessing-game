#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
MAX=1000
MIN=1
RANDOM_NUMBER=$((RANDOM % (MAX - MIN + 1) + MIN))

