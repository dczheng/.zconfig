#!/usr/bin/env bash

# 
# dczheng
# created 2021-01-08
#

if [ `hostname` = "void" ]
then
    s="["
    s=$s`$ZCONFIG/tmux-scripts/net.sh`
    s=$s`$ZCONFIG/tmux-scripts/bat.sh`
    s=$s"]"
fi
echo -en $s
