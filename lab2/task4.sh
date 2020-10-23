#!/bin/bash
s=""
for pid in $(ps -A -o pid)
do
	ppid=$(grep -E -h -s -i "PPid:\s(.+)" /proc/$pid/status | grep -o "[0-9]\+")
	ser=$(grep -E -h -s -i "se.sum_exec_runtime" /proc/$pid/sched | grep -o " [0-9.]\+")
	ns=$(grep -E -h -s -i "nr_switches" /proc/$pid/sched | grep -o " [0-9.]\+")
	if [[ $ser == "" && $ns == "" ]]; then
		continue
	fi
	ART=$(bc <<< "scale=10;$ser/$ns")
	if ([ $ART  != "" ] && [ $PPID != "" ])
		then s=$"${s}ProsessID: $pid, Parent_ProcessID: $ppid, Average_Running_Time: $ART\n"
	fi
done
echo -e "$s" | sort -nk4 > ans4
