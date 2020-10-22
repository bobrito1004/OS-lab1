#!/bin/bash
ps -A -f | tail -n 7 | head -1 | tr -s " " | cut -d " " -f 2
