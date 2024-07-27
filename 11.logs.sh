#!/bin/bash

ID=$(id -u)

Time_Stamp=$(date +%F-%H-%M-%s)

LOGFILE="/tmp/$0-Time_Stamp.log"

echo "Script started execution at $Time_Stamp" &>> $LOGFILE

if [ $ID -ne 0 ]
then
    echo "You are not a root user 'please run into root user'"
    exit 1
else 
    echo "you are root user"
fi

Method_Calling (){
    if [ $1 -ne 0 ]
    then
        echo "$2.... Failed"
        exit 1
    else
        echo "$2 Success"
    fi
}

yum install mysql -y &>> $LOGFILE

Method_Calling $? "Mysql installed" # here calling main method, if incase failed install mysql

yum install git -y &>> $LOGFILE

Method_Calling $? "git installed"
