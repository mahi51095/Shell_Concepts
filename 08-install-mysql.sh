#!/bin/bash

#Check root user or not
#if not root user ,exit the programm and inform user to run with sudo access.
#if root user , install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root access."
    exit 1
fi

#Need to check installation success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo " Installation of mysql is ERROR."
    exit 1
else
    echo " Installation of mysql is SUCCESS."
fi

yum install pstfix -y

if [ $? -ne 0 ]
then 
    echo " Installation of pstfix is ERROR."
    exit 1
else
    echo " Installation of pstfix is SUCCESS."
fi