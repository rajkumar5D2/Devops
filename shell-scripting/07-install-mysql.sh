#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "ERROR:: you are not the root user, making you the root user now"
exit 1
yum install mysql
fi