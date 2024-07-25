#!/bin/bash

PERSON1=$1
PERSON2=$2

# we have to give names in command ex:- sh 04.Variables.sh basha chesu
# output:- basha: Hello chesu, Good Morning
#          chesu: Hi basha, very Good Morning
#          basha: How are you chesu?
#          chesu: I am good basha, How are you


echo "$PERSON1: Hello $PERSON2, Good Morning"
echo "$PERSON2: Hi $PERSON1, very Good Morning"
echo "$PERSON1: How are you $PERSON2?"
echo "$PERSON2: I am good $PERSON1, How are you"