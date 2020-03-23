#!/bin/bash -x
echo "Welcome Gamling Simulator"

#CONSTANT
stake=100
bet=1

#check gambler win or loss
bet=$((RANDOM%2))
if [ $bet -eq 1 ]
then
	printf "win"
else
	printf "loose"
fi
