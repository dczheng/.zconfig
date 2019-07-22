#!/usr/bin/env bash

warning_icon="#[fg=red][\U26A0"
charging_icon="#[fg=green][\U26A1"
if [ $(hostname) == archlinux"" ]
then
    s=$( upower -i $(upower -e | grep -E 'battery|DisplayDevice') | awk '/state:/ {print $2}')
    p=$(upower -i $(upower -e | grep -E 'battery|DisplayDevice') | awk '/percentage:/ {print $2}')
    pp=$(echo $p | sed 's/%//')

    x="#[fg=green][$p]"
    if [ $pp -lt 10 ]
    then
        x="$warning_icon $p]"
    fi

    if [ $s == 'charging' ]
    then
        x="$charging_icon $p]"
    fi

else
    x=""
fi
echo -e $x
