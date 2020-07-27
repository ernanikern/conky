#!/bin/bash

cmd=`sudo mdadm --misc -Q --detail /dev/md127 | grep "/dev/" | cut -d" " -f30-`

echo $cmd
echo "---"
dev=0

for item in $cmd 
do 
word=`$item | cut -d":" -f2-`
echo "word = $word"
echo "$dev: $item" 
((dev++))
done
