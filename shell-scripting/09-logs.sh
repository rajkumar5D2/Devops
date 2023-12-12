#!/bin/bash
USERID=$(id -u)
DATE=$(date +%F)
LOGPATH=/tmp/$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
  if [ $1 -ne 0 ]
    then 
      echo -e "installation   $R failure.. $N $2"
      # exit 1
    else
      echo -e "installation  $G success.. $N $2"
  fi
}

if [ $USERID -ne 0 ]
  then 
    echo "need root access"
    exit 1
fi

#validate $? "no root access"

yum install mysql -y &>>$LOGPATH
  validate $? "mysql"

yum install postix -y &>>$LOGPATH
  validate $? "postfix"
