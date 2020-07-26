#!/bin/bash

dir="/home/ernani/Dropbox/linux/conky"

powered=`bluetoothctl show | awk '/Powered/ {print $2}'`

if [ "$powered" == "yes" ]; then
  devices=`bluetoothctl devices | gawk '{print $2}'`
  # conta quantos macs existem em $devices
  num_macs=`echo $devices | awk '{print NF}'`

  # CRIA O ARQUIVO devices.txt COM UM MAC POR LINHA:
  echo "" > "$dir"/devices.txt
  for i in $(seq 1 $num_macs)
  do
    echo $devices | cut -d" " -f"$i" >> "$dir"/devices.txt
  done
  cat "$dir"/devices.txt | while read mac
  do   
    if [ "$mac" == "" ]; then continue
    fi
    conn=`bluetoothctl info "$mac" | awk '/Connected:/ {print $2}'`
    if [ "$conn" == "yes" ]; then
      alias=`bluetoothctl info $mac | awk '/Alias/ {print $2}'`
      echo "$alias"
    fi
  done
  if [ "$conn" == "no" ]; then
    echo "-"
  fi
else echo "Bluetoothctl desativado."
fi
