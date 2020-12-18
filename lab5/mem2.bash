#!/bin/bash
echo '' > report2.log
step=0
arr=()
while (true);
do
	let "step=$step+1"
	arr2=(1 2 3 4 5 6 7 8 9 10)
	arr=(${arr[@]} ${arr2[@]})
	let "z=$step%100"
	if [[ $z == 0 ]]
	then
		echo "${#arr[@]}" >> report2.log
	fi
done
