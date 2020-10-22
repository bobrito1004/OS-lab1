#!/bin/bash
if [[ $2 == "" ]]; then
	if [[ $1 == "" ]]; then
		echo Enter a directory.
		read Dir
	else
		Dir="$1"
	fi
	while [[ ! -d "$Dir" ]]; do
		echo No such directory. Pls try again.
		read Dir
	done
	echo Enter RE
	read RE
else
	Dir="$1"
	RE="$2"
fi
while [[ ! -d "$Dir" ]]; do
	echo No such directory. Pls try again.
	read Dir
done
echo ls -a /$Dir | grep -r "$RE"
