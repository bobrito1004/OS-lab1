#!/bin/bash
result=1
operator='+'
tail -f ans5 | while true
do
	read line
	case $line in
	'+')
		operator='+'
		echo "add"
		;;
	'*')
		operator='*'
		echo "multiplying"
		;;
	[0-9]*)
		res=$result
		if [[ $operator == '+' ]] 
			then
				((result=$result+$line))
			else
				((result=$result\*$line))
		fi
		echo "$res $operator $line = $result"
		;;
	*)
		break
		;;
	esac
done
