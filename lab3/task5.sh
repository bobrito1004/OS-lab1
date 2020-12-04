#!/bin/bash
./help5.sh& > ans5
while true
do
	read line
	echo "$line" >> ans5
	if [[ $line == "QUIT" ]]
		then
			echo "exit"
			rm ans5
			exit 0
	fi
	if [[ $line != "+" && $line != "*" && ! $line =~ [0-9]+ ]]
		then
			echo "error"
			rm ans5
			exit 1
	fi
done
