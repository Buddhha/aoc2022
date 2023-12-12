#!/usr/bin/bash

input="0512input.txt"
#nput="tmpinput.txt"
cmd="0512command.txt"
index=0

while read line; do
	tmp=($line)
	echo -e "tmp= $tmp \t hossza= ${#tmp}"
	for i in ${tmp[@]}; do
		tower$index+=$i
		index=$(($index+1))
	
		for j in ${#tmp}; do
			echo tower$j
		done
	done
	
done < $input

for (( j=1; j<=$index; j++))  do
	echo tower$j
done



