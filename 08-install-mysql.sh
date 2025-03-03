#!/bin/bash

#Check root user or not
#if not root user ,exit the programm and inform user to run with sudo access.
#if root user , install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

#This function should validate the previous command and inform user , Success or failure.
VALIDATE(){
   #$1 -> receive the argument 1 
if [ $1 -ne 0 ]
then 
    echo -e "$2.. $R is FAILURE $N"
    exit 1
else
    echo -e "$2.. $G is SUCCESS $N"
fi

}

#This will check user id
USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root access."
    exit 1
fi

#Need to check installation success or not
yum install mysqlll -y &>>$LOGFILE

VALIDATE $? "Installing MySQL."

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing Postfix."

