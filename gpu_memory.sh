#!/bin/bash

total_mem=`glxinfo -B | grep "Video memory" | cut -d":" -f2 | cut -d"M" -f1`
#echo "total_mem = $total_mem"
availa_mem=`glxinfo -B | grep "Currently available dedicated video memory" | cut -d":" -f2`
avail_mem=`echo $availa_mem | cut -d" " -f1`
#echo "avail_mem = $avail_mem"
used_mem=`echo $total_mem $avail_mem | awk '{print $1 - $2}'`
echo "$used_mem MB"
