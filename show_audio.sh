#!/bin/bash

run=`pactl list short sinks | grep RUNNING | awk '{print $2}'`

audio=`echo "$run" |cut -d"." -f4`

if [ "$audio" == "" ]; then
	audio2=`echo "$run" | cut -d"_" -f1`
	echo "$audio2"
	exit
fi
echo "$audio"
