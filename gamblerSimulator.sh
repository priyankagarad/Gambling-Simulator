#!/bin/bash -x
echo "Welcome Gamling Simulator"

#CONSTANT
stake=100
bet=1

#add 50% if gambler win otherwise minus 50%
bet=$((RANDOM%2))
if [ $bet -eq 1 ]
then
	stake=$(($stake+50))
else
	stake=$(($stake-50))
fi
