
#!/bin/bash
s=""
for pid in $(ps -A -o pid)
do
	ppid=$(grep -E -h -s -i "ppid:\s(.+)" /proc/$pid/status | grep -o "[0-9]\+")
	ser=$(grep -E -h -s -i "se.sum_exec_runtime" /proc/$pid/sched | grep -o " [0-9.]\+")
	ns=$(grep -E -h -s -i "nr_switches" /proc/$pid/sched | grep -o " [0-9.]\+")
	ART=$(bc <<< "scale=10;$ser/$ns")
	if [ $ART != "0" ] 2>/dev/null
		 then ART=$"0${ART}"
	fi
	if ([ $ART  != "" ] && [ $PPID != "" ]) 2>/dev/null
		then s=$"${s}ProsessID : $pid, Parent_ProcessID : $ppid, Average_Running_Time : $ART\n"
	fi
done
echo -e "$s" | sort -k6 > ans4
