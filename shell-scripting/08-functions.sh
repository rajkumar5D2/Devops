#!/bin/bash
USERID=$(id -u)

validate(){
  if [ $1 -ne 0 ]
    then 
      echo "installation failure $2"
      exit 1
    else
      echo "installation success $2"
  fi
}

if [ $USERID -ne 0 ]
  then 
    echo "need root access"
    exit 1
fi

#validate $? "no root access"

yum install mysql -y
  validate $? "mysql"

yum install postfix -y
  validate $? "postfix"