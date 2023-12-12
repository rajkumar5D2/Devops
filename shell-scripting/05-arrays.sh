#!/bin/bash
PERSONS=("ramesh" "suresh" "kamesh") #there are no ,'s in array
echo "firsi person is: ${PERSONS[1]}"
echo "all people in the list are: ${PERSONS[@]}"