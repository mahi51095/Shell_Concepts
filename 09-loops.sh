#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
if [ $USERID -ne 0 ]
then
    echo -e  "$R ERROR : Please run script with root access. $N"
    exit 1
fi



for i in $@
do
  yum install $i -y
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