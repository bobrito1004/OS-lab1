#!/bin/bash
./help6.sh&
while true
do
	read line
	case $line in
	"TERM")
		kill -SIGTERM $(cat pid)
		break
		;;
	"+")
		kill -USR1 $(cat pid)
		;;
	"*")
		kill -USR2 $(cat pid)
		;;
	esac
done
