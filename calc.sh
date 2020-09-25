#!/bin/bash
case $1 in
"")
	echo Calc is on. What do you want to do?
	read a
	while [ $a != sum ] && [ $a != sub ] && [ $a != mul ] && [ $a != div ];
	do
		echo Wrong operation. Try again.
		read a
	done
	echo Type first number:
	read first
	echo Type second number:
	read second
	./calc.sh $a $first $second
	;;
sum)
	if [[ $3 == "" ]]; then
		if [[ $2 == "" ]]; then
			echo Type first number
			read first
			echo Type second number
			read second
		else
			echo Type second number
			read second
			let  "first = $2"
		fi
	else
		let "first = $2"
		let "second = $3"
	fi
	let "sum = $first + $second"
	echo sum of $first and $second = $sum
	;;
sub)
	if [[ $3 == "" ]]; then
		if [[ $2 == "" ]]; then
			echo Type first number
			read first
			echo Type second number
			read second
		else
			echo Type second number
			read second
			let "first = $2"
		fi
	else
		let "first = $2"
		let "second = $3"
	fi
	let "sub = $first - $second"
	echo sub of $first and $second = $sub
	;;
mul)
	if [[ $3 == "" ]]; then
		if [[ $2 == ""  ]]; then
			echo Type first number
			read first
			echo Type second number
			read second
		else
			echo Type second number
			read second
			let "first = $2"
		fi
	else
		let "first = $2"
		let "second = $3"
	fi
	let "mul = $first * $second"
	echo mul of $first and $second = $mul
	;;
div)
	if [[ $3 == "" ]]; then
		if [[ $2 == "" ]] ; then
			echo Type first number
			read first
			echo Type second number
			read second
		else
			echo Type second number
			read second
			let "first = $2"
		fi
	else
		let "first = $2"
		let "second = $3"
	fi
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
