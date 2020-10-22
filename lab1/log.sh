#!/bin/bash
while read s
do
	if [[ $s = *"(WW)"* && $s != "(WW) warning"* ]]; then
		echo -e ${s//"(WW)"/"\033[1;33m Warning \033[0m"}
	fi
done < "/var/log/anaconda/X.log"
while read s
do
	if [[ $s = *"(II)"* ]]; then
		echo -e ${s//"(II)"/"\033[34m Information \033[0m"}
	fi
done < "/var/log/anaconda/X.log"
