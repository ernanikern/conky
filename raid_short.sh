#!/bin/bash

sudo mdadm --misc -Q --detail /dev/md127 | gawk '/State :/ {print $3}' | cut -d"," -f1
