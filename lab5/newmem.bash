#!/bin/bash
arr=()
while (true);
do
	arr2=(1 2 3 4 5 6 7 8 9 10)
	arr=(${arr[@]} ${arr2[@]})
	if [[ ${#arr[@]} > $1 ]]
	then
		exit 0
	fi
done
