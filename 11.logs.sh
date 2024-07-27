#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

Time_Stamp=$(date +%F-%H-%M-%S) #TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$Time_Stamp.log"

echo -e "Script started execution at $R $Time_Stamp" $N &>> $LOGFILE

if [ $ID -ne 0 ]
then
    echo -e "$R You are not a root user 'please run into root user'"
    exit 1
else 
    echo -e "you are $G root user"
fi

Method_Calling (){
    if [ $1 -ne 0 ]
    then
        echo -e "Error::$2....$R Failed"
        exit 1
    else
        echo -e "$2......$G Success"
    fi
}

yum install mysql &>> $LOGFILE

Method_Calling $? "$G Mysql  $N installed" # here calling main method, if incase failed install mysql

yum install git &>> $LOGFILE

Method_Calling $? "$y git $N installed"
