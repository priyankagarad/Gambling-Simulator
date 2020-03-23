#!/bin/bash -x
echo "Welcome Gamling Simulator"

#CONSTANT
STAKE=100
BET=1
TOTAL_DAYS=20

#VARIABLE
amount=$STAKE

LOW=$(($STAKE-$((STAKE*50/100)) ))
HIGH=$(($STAKE+$((STAKE*50/100)) ))

#calculated daily betting 
while [ $amount -gt $LOW ] && [ $amount -lt $HIGH ] 
do
	random=$((RANDOM%2))
	if [ $random -eq 1 ]
	then
		amount=$(($amount+$BET))
	else
		amount=$(($amount-$BET))
	fi
done
gainAmount=$(($amount-$STAKE))


