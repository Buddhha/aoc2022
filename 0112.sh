#!/bin/bash
filename='input.txt'
calories=0
gyujtott=()
while read line; do
if [ -z "$line" ]
then
	gyujtott[${#gyujtott[@]}]=$calories
	calories=0
else
	temp=$((line))
	calories=$((calories+$temp))
fi
done < $filename

#echo "${gyujtott[@]}" >> result2.txt

len=${#gyujtott[@]} 
echo $len

for ((i = 0; i<$len; i++))
do
	for (( j = 0; j<$len-i-1; j++))
		do
			if [ ${gyujtott[j]} -gt ${gyujtott[j+1]} ]
			then
				temp=${gyujtott[j]}
				gyujtott[$j]=${gyujtott[$((j+1))]}
				gyujtott[$((j+1))]=$temp
			fi
		done
done

echo
echo "rendezett tömb"
echo 

#readarray -t gyujtott < <(printf '%s\n' "${gyujtott[@]}" | sort)
#echo "rendezett:"
echo "${gyujtott[@]}"

echo "legtöbb 3"
echo "${gyujtott[$len]}"
echo "${gyujtott[$((len-1))]}"
echo "${gyujtott[$((len-2))]}"

println;

sum=0
for (( k = 0; k<=3; k++))
do
	temp=${gyujtott[$len-$k]}
	echo "$temp"
	sum=$((sum+$((temp))))
done
echo $sum
