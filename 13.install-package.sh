#!/bin/bash

ID=$(id -u)

Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Normal="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE


if [$ID -ne 0]
then
    echo -e "$Red ERROR:: Please run this script with root access $Normal"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

Method_Calling (){

    if [ $1 -ne 0 ]
    then
        echo "$Red Error:: $2.....Failed"
        exit 1
    else
        echo "$Green $2.....Success"
    fi
}

for Package in $@
do
  yum installed $Package &>> $LOGFILE
  if [ $? -ne 0 ]
  then
      yum install $Package -y &>> $LOGFILE
      Method_Calling $? "Installing of $Package"
  else
      echo "$Green Already installed $Package"
  fi
done 