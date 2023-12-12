#!/bin/bash
LOGPATH=./logs/$(date +%F)-$0.log
validate(){
  if [ $1 -gt 0 ]
    then 
    echo "mysql install failure"
  else 
    echo "mysql install success"
  fi
}
install(){

yum install mysql -y &>>$LOGPATH
validate $?
}
 
  ROOT_ID=$(id -u)
  if [ $ROOT_ID -ne 0 ]
    then 
    echo "need root access to perform this task"
    exit 1
  else install
  fi
