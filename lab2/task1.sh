#!/bin/bash
ps -U "user" --no-headers | wc -l > ans1
ps -U "user" --format pid,cmd --no-headers >> ans1
