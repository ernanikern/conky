#!/bin/bash

total=`df -h | awk '/sda1/ {print $2}' | cut -d"G" -f1`
echo "total = $total"

usedp=`df -h | awk '/sda1/ {print $5}' | cut -d"%" -f1`
echo "usedp = $usedp"
