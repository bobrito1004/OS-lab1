#!/bin/bash
echo '' > report.log
step=0
arr=()
while (true);
do
	let "step=$step+1"
	for i in {1..10}
	do
		arr+=($i)
	done
	let "z=$step%100"
	if [[ $z == 0 ]]
	then
		echo "${#arr[@]}" >> report.log
	fi
done
