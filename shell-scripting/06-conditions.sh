#1/bin/bash
NUMBER=$1
if [ $NUMBER -gt 10 ] #use -gt for graterthan, -ge for graterthan equalto, -lt for lessthan, -le for lessthan equalto
then 
echo "$NUMBER is greater than 10 "
else
 echo "$NUMBER is less than 10"
 fi #to end the if loop