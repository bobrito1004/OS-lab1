#!/bin/bash
echo $$ > pid
result=1
mode="+"
sigterm(){
	echo "STOP"
	rm pid
	exit
}

usr1(){
	mode="+"
}

usr2(){
	mode="*"
}

trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2
while true
do
	case $mode in
	"+")
		let result=$result+2
		;;
	"*")
		let result=$result*2
		;;
	esac
	echo $result
	sleep 5
done
