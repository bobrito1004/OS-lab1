#!/bin/bash
case $1 in
"calc")
	./calc.sh $2 $3 $4
;;
"search")
	./search.sh $2 $3
;;
"reverse")
	./reverse.sh $2 $3
;;
"strlen")
	./strlen.sh $2
;;
"log")
	./log.sh $2
;;
"exit")
	case $2 in
	*[0-9]*)
		exit $2
		;;
	*)
		exit 0
		;;
	esac
	;;
"help")
	echo
	echo calc:
	echo 1. sum/sub/mul/div. 2 and 3 options are for numbers.
	echo search:
	echo 1. directory. 2. RE for search.
	echo reverse:
	echo 1. Old file name 2. New file name
	echo strlen:
	echo 1. Enter a string to get its length
	echo log:
	echo No keys here.
	echo exit:
	echo 1. Exit code. 0 by default
	echo help:
	echo No explanations needed
	;;
"interactive")
	echo
	echo This script can do different things:
	echo calc, search, revesrse, strlen, log, exit and help.
	echo Choose what you want to do:
	select act in "calc" "search" "reverse" "strlen" "log" "exit" "help"
	do
		clear
		case $act in
		"exit")
			exit 0
			;;
		"help")
			./lab1.sh help
			./lab1.sh interactive
			break
			;;
		*)
			./$act.sh
			./lab1.sh interactive
			break
			;;
		esac
	done
	;;
*)
	echo Wrong key.
	exit 0
	;;
esac
