#!/bin/bash -x
echo "Welcome Gamling Simulator"

#CONSTANT
STAKE=100
BET=1
TOTAL_DAYS=20

#VARIABLE
amount=$STAKE
day=0
win_amount=0
loss_amount=0

#calculated amount  after 20 day playing
while [[ $day -lt $TOTAL_DAYS ]]
do
	while [[ $amount -gt 50 && $amount -lt 150 ]]
	do
		random=$((RANDOM%2))
		if [ $random -eq 1 ]
		then
			amount=$(($amount+$BET))
			win_amount=$(($win_amount+$BET))
		else
			amount=$(($amount-$BET))
			loss_amount=$(($loss_amount+$BET))
		fi
	done
	((day++))
done
echo "win amount $win_amount"
echo "loss amount $loss_amount"
