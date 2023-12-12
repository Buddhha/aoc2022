#!/usr/bin/bash

input="0412input.txt"
#input="tmpinput.txt"
indexes=()
contain=0
first=false
second=true

while read line; do
	indexes+=($line)
done < $input

if $first; then
echo -e "i1 \t i2 \t i3 \t i4"
for i in ${indexes[*]}; do
	IFS=',-' read -r -a tmp <<< $i

	echo -e "${tmp[0]} \t ${tmp[1]} \t ${tmp[2]} \t ${tmp[3]}"
	if (( "${tmp[0]}" <= "${tmp[2]}" )) && (( "${tmp[1]}" >= "${tmp[3]}" )); then
		contain=$(($contain+1))
		echo "egyezes"
	else
	if (( "${tmp[2]}" <= "${tmp[0]}" )) && (( "${tmp[3]}" >= "${tmp[1]}" )); then
		 contain=$(($contain+1))
		 echo "egyezes"
	fi
	fi
done
echo -e "összes egyezes: $contain"
fi

if $second; then
echo -e "i0 \t i1 \t i2 \t i3"
for i in ${indexes[*]}; do
	IFS=',-' read -r -a tmp <<< $i
	echo -e "${tmp[0]} \t ${tmp[1]} \t ${tmp[2]} \t ${tmp[3]}"

	if (( "${tmp[0]}" >= "${tmp[3]}" )) && (( "${tmp[0]}" <= "${tmp[3]}" )); then
		contain=$(($contain+1))
		echo "atfedes"
	else

		if (( "${tmp[1]}" >= "${tmp[2]}" )) && (( "${tmp[1]}" <= "${tmp[3]}" ));then
			contain=$(($contain+1))
			echo "átfedés"
		else
			if (( "${tmp[2]}" >= "${tmp[0]}" )) && (( "${tmp[2]}" <= "${tmp[1]}" ));then
				contain=$(($contain+1))
				echo "átfedés"
			else
				if (( "${tmp[3]}" >= "${tmp[0]}" )) && (( "${tmp[3]}" <= "${tmp[1]}" )); then
					contain=$(($contain+1))
				fi
			fi
		fi
	fi

done
echo -e "összes atfedes: $contain"

fi
