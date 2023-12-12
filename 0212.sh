#!/usr/bin/bash

filename='input.txt'
rock=1
paper=2
scissor=3
lost=0
draw=3
win=6



#első feladat
#A - rock
#B - papaer
#C - scissor
#X - rock
#Y - paper
#Z - Scissor

#masodik feladat
#X - lost
#Y - draw
#Z - win

sum=0


while read line; do
case ${line:0:1} in
	A )
		printf "rock" 
		case ${line:2:1} in
			Y)
				printf " - rock\n"; sum=$((sum+$rock+$draw)) ;;
			Z)
				printf " - paper\n"; sum=$((sum+$paper+$win)) ;;
			X)
				printf " - scissor\n"; sum=$((sum+$scissor+$lost)) ;;
		esac
		;;
	B )
		printf "paper" 
		case ${line:2:1} in
			X)
				printf " - rock\n"; sum=$((sum+$rock+$lost)) ;;
			Y)
				printf " -paper\n"; sum=$((sum+$paper+$draw)) ;;
			Z)
				printf " - scissor\n"; sum=$((sum+$scissor+$win)) ;;
		esac		
		;;
	C )
		printf "scissor" 
		case ${line:2:1} in
			Z)
				printf " - rock\n"; sum=$((sum+$rock+$win)) ;;
			X)
				printf " - paper\n"; sum=$((sum+$paper+$lost)) ;;
			Y)
				printf " - scissor\n"; sum=$((sum+$scissor+$draw)) ;;
		esac
		;;
esac


done < $filename

echo "összes pont: $sum"
