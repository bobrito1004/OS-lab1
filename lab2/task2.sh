#!/bin/bash
ps -A -o pid,cmd | egrep ' /sbin/' | gawk '{print $1}' > ans2
