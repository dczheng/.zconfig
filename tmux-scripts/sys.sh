#!/usr/bin/env bash

# 
# dczheng
# created 2021-01-08
#

if [ `hostname` = "void" ]
then
    net=`$ZCONFIG/tmux-scripts/net.sh`
    bat=`$ZCONFIG/tmux-scripts/bat.sh`
    s="#[fg=green][$net$bat#[fg=green]]"
fi
echo -en $s
