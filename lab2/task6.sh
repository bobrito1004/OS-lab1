#!/bin/bash
msize=0
ans=none
for pid in $(ps -A -o pid)
do

	if [[ -d /proc/$pid ]]; then
		size=$(pmap $pid | grep "total" | grep -o -E '[0-9]+' | head -1) 2>/dev/null
		if [[ $size -gt $msize ]]; then
			msize=$size
			ans=$pid
		fi
	fi
done
echo $ans: $msize kB
echo $(top -o VIRT | head -8 | tail -n 1)
exit 0
