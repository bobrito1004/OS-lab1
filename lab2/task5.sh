#!/bin/bash
let "count=0"
let "prevpar=0"
let "AVGART=0"
while read a; do
	if [[ -n $a ]]; then
		ppid=$(echo $a | grep -o "Parent_ProcessID: [0-9]\+" | grep -o "[0-9]\+")
		if [[ $ppid != $prevpar ]]; then
			M=$(bc <<< "scale=10;$AVGART/$count")
			echo Average_Runnong_Children_of_ParentID=$prevpar is $M >> tmp
			let "count=0"
			prevpar=$ppid
			let "AVGART=0"
		fi
		let "count+=1"
		art=$(echo $a | grep -o "Average_Running_Time: [0-9.]\+" | grep -o "[0-9.]\+")
		AVGART=$(bc <<< "$AVGART + $art")
		echo $a >> tmp
	fi
done < ans4
cat tmp > "ans4"
rm tmp
