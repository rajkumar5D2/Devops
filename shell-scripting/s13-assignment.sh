#!/bin/bash
USERID=$(id -u)
DATE=$(date +%F)
LOGPATH=/tmp/$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

checking(){
  if [ $1 -ne 0 ]
    then 
      yum install $2 -y &>>$LOGPATH
      validate $? "$2"
  else
    echo -e "\e[33m$2 already installed"
    # exit 1
  fi
}


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

# yum install mysql -y &>>$LOGPATH
#   validate $? "mysql"

# yum install postix -y &>>$LOGPATH
#   validate $? "postfix"

for i in $@ # getting all the arguments 
do
  yum list installed $i &>> $LOGPATH
  checking $? $i
done


# output------------[ centos@workstation ~/Devops/shell-scripting ]$ sudo  sh s13-assignment.sh myql postfix mailx
# installation    failure..  myql
# installation   success..  postfix
#  mailx already installed
