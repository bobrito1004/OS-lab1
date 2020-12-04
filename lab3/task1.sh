#!/bin/bash
name=$(date +%F_%T)
mkdir -p ~/test && echo "catalog test was created successfully" >> ~/report & touch ~/test/"$name"
ping -c 1 www.net_nikogo.ru || echo "$name: Error" >> ~/report
