#!/bin/bash
if [[ $2 == "" ]]; then
	if [[ $1 == "" ]]; then
		echo Enter the name of the file you want to reverse
		read Old
	else
		Old="$1"
	fi
	while [[ ! -e "$Old" ]]; do
		echo No such file. Try again.
		read Old
	done
	echo Enter a name for a new file
	read New
else
	Old="$1"
	New="$2"
fi
while [[ ! -e "$Old" ]]; do
	echo No such file. Try again.
	read Old
done
echo > "$New" 
tac $Old > tmp
rev tmp > $New
rm tmp
