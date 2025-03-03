#!/bin/bash

#Check root user or not
#if not root user ,exit the programm and inform user to run with sudo access.
#if root user , install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run this script with root access."
fi

yum install git -y