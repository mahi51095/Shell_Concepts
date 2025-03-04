#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/Shell_Concepts/Script-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e  "$R ERROR : Please run script with root access. $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]
    then
        echo -e "Installing $2 .... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 .... $G SUCCESS $N"
    fi
}


for i in $@
do
  yum list installed $i &>>$LOGFILE
  if [ $? -ne 0 ]
    then 
         echo "$i not insatlled,Please install it."
         yum install $i -y &>>$LOGFILE
         VALIDATE $? "$i"
    else
         echo -e "$Y $i is already installed $N"
   fi
  #yum install $i -y
done

#improvements
#Logfiles,colors,validation,functions
#script should check if pkg already instaled or not,if installed print yellow color.

#Algorithm
#Task : Install multiple pkgs
#Pass pkgs through cmd line.
#Should have root acces, Store logs while installing.
#check whether installed or not
#user experience