#!/bin/bash

sudo mdadm --misc -Q --detail /dev/md127 | grep "/dev/"| awk '{print "	                                   ",  $5, $6, $7}' | egrep -v "active|sync"
