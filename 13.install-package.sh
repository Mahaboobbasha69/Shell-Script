#!/bin/bash

ID=$(id -u)


if [$ID -ne 0]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

Method_Calling (){

    if [ $1 -ne 0 ]
    then
        echo "Error:: $2.....Failed"
        exit 1
    else
        echo "$2.....Success"
    fi
}

for $Package in $@
do
  yum installed $Package
  if [ $? -ne 0 ]
  then
      yum install $Package -y
      Method_Calling $? "Installing of $Package"
  else
      echo "Already installed $Package"
  fi
done  