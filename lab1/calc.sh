#!/bin/bash
first=$2
second=$3
num_check() {
	if [[ $second == "" ]]; then
		if [[ $first == "" ]]; then
			echo Type first number
			read first
			while ! [[ $first =~ [0-9] ]];
			do
				echo Nums only, try again
				read first
			done
			echo Type second number
			read second
			while ! [[ $second =~ [0-9] ]];
			do
				echo Nums only, try again
				read second
			done
		elif ! [[ $first =~ [0-9] ]]; then
			while ! [[ $first =~ [0-9] ]];
			do
				echo First arg is not a num. Try again.
				read first
			done
			echo Type second number
			read second
			while ! [[ $second =~ [0-9] ]];
			do
				echo Nums only, try again
				read second
			done
		else
			echo Type second number
			read second
			while ! [[ $second =~ [0-9] ]];
			do
				echo Nums only, try again
				read second
			done
		fi
	elif ! [[ $second =~ [0-9] ]]; then
		if ! [[ $first =~ [0-9] ]]; then
			echo First arg is not a num. Try again
			read first
			while ! [[ $first =~ [0-9] ]];
			do
				echo Nums only, try again
				read first
			done
		fi
		echo Second arg is not a num. try again
		read second
		while ! [[ $second =~ [0-9] ]];
		do
			echo Nums only, try again.
			read second
		done
	else
		if ! [[ $first =~ [0-9] ]]; then
			echo First arg is not a num. Try again
			read first
			while ! [[ $first =~ [0-9] ]];
			do
				echo Nums only, try again
				read first
			done
		fi
	fi
}

case $1 in
"")
	echo Calc is on. What do you want to do?
	read a
	while [ $a != sum ] && [ $a != sub ] && [ $a != mul ] && [ $a != div ];
	do
		echo Wrong operation. Try again.
		read a
	done
	num_check
	./calc.sh $a $first $second
	;;
sum)
	num_check
	let "sum = $first + $second"
	echo sum of $first and $second = $sum
	;;
sub)
	num_check
	let "sub = $first - $second"
	echo sub of $first and $second = $sub
	;;
mul)
	num_check
	let "mul = $first * $second"
	echo mul of $first and $second = $mul
	;;
div)
	num_check
	while [ $second == 0 ];
	do
		echo Dividing by zero is not allowed. Type another number
		read second
	done
	let "div = $first / $second"
	echo div of $first and $second = $div
	;;
*)
	echo Wrong operation. Try again
	read a
	while [ $a != sum ] && [ $a != sub ] && [ $a != div ] && [ $a != mul];
	do
		echo Wrong operation. Try again
		read a
	done
	./calc.sh $a $2 $3
	;; 
esac
