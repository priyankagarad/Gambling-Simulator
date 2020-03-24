#!/bin/bash -x
echo "Welcome Gamling Simulator"

#CONSTANT
BET=10
TOTAL_DAYS=20

#VARIABLE
day=1
total=0
win_day=0
loss_day=0
declare -A array1
declare -A array2

#calculated win amount and loss amount after 20 day playing
while [[ $day -le $TOTAL_DAYS ]]
do
	stake=100;
	win_amount=0
	loss_amount=0
	while [[ $stake -gt 50 && $stake -lt 150 ]]
	do
		random=$((RANDOM%2))
		if [ $random -eq 1 ]
		then
			stake=$(($stake+$BET))
			win_amount=$(($win_amount+$BET))
		else
			stake=$(($stake-$BET))
			loss_amount=$(($loss_amount+$BET))
		fi
	done

#calculated total win amount ,loss amount and day win or loss
total_win_amount=$(($total_win_amount+$win_amount))
total_loss_amount=$(($total_loss_amount+$loss_amount))

if [ $total_win_amount -gt $total_loss_amount ]
then
	 result1=$(($total_win_amount-$total_loss_amount))
	 ((win_day++))
else
	result1=$(($total_loss_amount-$total_win_amount))
	((loss_day++))
fi
array1[$day]=$win_amount
array2[$day]=$loss_amount
((day++))
done

#calculated luckiest day
echo " ${array1[@]}"
max_value=${array1[1]}
for (( i=1;i<=20;i++ ))
do
	if [[ ${array1[$i]} -gt $max_value ]]
	then
			max_value=${array1[$i]}
			luckiest_day=$i
	fi
done

#calculated unluckiest day
echo "${array2[@]}"
max_value=${array2[1]}
for (( j=1;j<=20;j++ ))
do
	if [[ ${array2[$j]} -gt $max_value ]]
	then
		max_value=${array1[$j]}
		unluckiest_day=$j
	fi
done

#check playing next month or not
if [[ $total_win_amount -gt $total_loss_amount ]]
then
	echo "player continue playing next month:"
else
	echo "player not countinue playing next month"
fi
