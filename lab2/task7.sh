#!/bin/bash
s=""
for pid in $(ps -A -o pid)
do
	if [[ -d /proc/$pid ]]; then
		rchar=$(cat /proc/$pid/io | grep "rchar" | grep -o "[0-9]\+")
		echo $pid: $rchar >> tmp
		s=$"${s}$pid: $rchar\n"
	fi
done
sleep 60s
s1=""
for pid in $(echo -e "$s" | grep -o "[0-9]\+:" | grep -o "[0-9]\+")
do
	if [[ -d /proc/$pid ]]; then
		rchar=$(cat /proc/$pid/io | grep "rchar" | grep -o "[0-9]\+")
		oldchar=$(echo -e "$s" | grep -E "^$pid:" | grep -o ": [0-9]\+" | grep -o "[0-9]\+")
		dif=$((rchar - oldchar))
		path=$(ps -o args $pid | tail -n 1)
		s1=$"${s1}$pid : $path : $dif\n"
	fi
done
echo -e "$s1" | sort -nk5 -r | head -3
