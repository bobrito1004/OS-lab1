#!/bin/bash
if [[ $1 == "" ]]; then
	echo Enter your text
	read txt
else
	txt=$1
fi
echo ${#txt}
