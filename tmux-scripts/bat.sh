#!/usr/bin/env bash

# 
# dczheng
# created 2019-07-27
#

p=`cat /sys/class/power_supply/BAT1/capacity`
s=`cat /sys/class/power_supply/AC/online`
p=9

if [ $p -lt 10 ]
then
    c="red"
else
    c="green"
fi

if [ $s == '1' ]
then
    i="🔌"
else
    i="🔋"
fi

x="#[fg=$c]$i$p%"

echo $x
