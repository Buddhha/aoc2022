#!/usr/bin/bash

input="0312input.txt"
#input="tmpinput.txt"
sum=0
ar=()
val=0
index=-1
zsak=()

for a in {{a..z},{A..Z}}; do
	ar+=($a)
done
#echo $ar
#echo ${#ar}
#echo ${ar[1]}
#echo ${ar[27]}
#echo -e "first item \t second item \t common item"
while read line; do
len=${#line}
common=''
first=${line:0:len/2}
second=${line:len/2:len/2}
for (( i=0; i<${#first}; i++)); do
	for (( j=0; j<${#second}; j++)); do
		if [[ "${first:$i:1}" == "${second:$j:1}" ]]; then
			common=${second:$j:1}
		fi
		
	done
done

for ((k=0; k<${#ar[@]}; k++ )); do
#	echo ${ar[$k]}
	if [[ "${ar[$k]}" == "${common}" ]]; then
		val=$(($k+1))
	fi	
done

#echo -e "${line:0:len/2} ${line:len/2:len/2} \t $common \t $val"
sum=$(($sum+$val))

done < $input
echo "Sum of priorities= $sum"

while read line; do
	zsak+=($line)	
done < $input
sum=0
for ((l=0; l<${#zsak[@]}; l+=3));do
	first=${zsak[$l]}
	second=${zsak[$l+1]}
	third=${zsak[$l+2]}

for (( i=0; i<${#first}; i++)); do
	for (( j=0; j<${#second}; j++)); do
		for (( k=0; k<${#third}; k++ )) do
			if [[ "${first:$i:1}" == "${second:$j:1}" ]]; then
				if [[ "${third:$k:1}" == "${second:$j:1}" ]]; then
					common=${third:$k:1}
				fi
			fi
		done

	done
done
#echo -e "$first \t $second \t $third"
#echo $common "a közös betü"

for ((k=0; k<${#ar[@]}; k++ )); do
        if [[ "${ar[$k]}" == "${common}" ]]; then
		val=$(($k+1))
	fi
done
sum=$(($sum+$val))
done
echo "Sum of badges= $sum"
