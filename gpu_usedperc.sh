#!/bin/bash

totalmem=`glxinfo -B | grep "Video memory" | cut -d":" -f2 | cut -d"M" -f1`
availmem=`glxinfo -B | grep "Currently available dedicated video memory" | cut -d":" -f2 | cut -d"M" -f1`

#echo "totalmem = _ $totalmem _"
#echo "availmem =_ $availmem _"

usedperc=`echo $availmem $totalmem | awk '{print 100 - ($1 / $2 * 100)}'`

#echo "$usedperc%"

usedpercint=`echo $usedperc | cut -d"." -f1`
#echo "usedperc = $usedpercint%"

#echo "$usedpercint% of$totalmem"

echo "$usedpercint %"
