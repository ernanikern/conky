#!/bin/bash

n=10  # número de TOP 'n' PROCESSES

topTotal=`top | tail -n +8 | head -n 10`

echo "topTotal = $topTotal"
