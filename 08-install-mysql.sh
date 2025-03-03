#!/bin/bash

#Check root user or not
#if not root user ,exit the programm and inform user to run with sudo access.
#if root user , install mysql

USERID=$(id -u)
#This function should validate the previous command and inform user , Success or failure.
VALIDATE(){
   #$1 -> receive the argument 1 
if [ $1 -ne 0 ]
then 
    echo "$2.. is FAILURE."
    exit 1
else
    echo "$2.. is SUCCESS"
fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root access."
    exit 1
fi

#Need to check installation success or not
yum install mysql -y

VALIDATE $? "Installing MySQL."

yum install postfix -y

VALIDATE $? "Installing Postfix."

