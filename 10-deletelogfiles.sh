#!/bin/bash


APP_LOGS_DIR=/home/centos/Shell_Concepts/app-logs

DATE=$(date +%F)
LOGSDIR=/home/centos/Shell_Concepts
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE"

echo "$FILES_TO_DELETE"

while read line
do
   echo "Deleting $line" $>>$LOGFILE
   rm -rf $line

done <<< "$FILES_TO_DELETE"