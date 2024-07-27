#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo "ERROR:: Please run this script with root access"
exit 1 # you can give other than 0
else
echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysqlwq -y 

if [ $? -ne 0 ]
then
echo "Error:: Not installing can you recheck the code"
exit 1 
else
echo "Mysql installing Success"
fi

yum install git -y 

if [ $? -ne 0 ]
then
echo "Error:: Not git can you recheck the code"
exit 1 
else
echo "git installing Success"
fi
