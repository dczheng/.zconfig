#!/usr/bin/env bash

# 
# dczheng
# created 2019-07-27
#
if [ `hostname` = "void" ]
then
    p=`cat /sys/class/power_supply/BAT1/capacity`
    s=`cat /sys/class/power_supply/AC/online`

    if [ $p -lt 10 ]
    then
        c="red"
    else
        c="green"
    fi

    if [ $s == '1' ]
    then
        i="⚡"
    else
        i="🔋"
    fi

    x="#[fg=$c][$i$p%]"

else
    x=""
fi
echo -en $x
