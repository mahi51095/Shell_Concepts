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


yum install mysql -y