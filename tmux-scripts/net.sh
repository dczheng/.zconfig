#!/usr/bin/env bash

# 
# dczheng
# created 2021-01-08
#

NET_DIR="/sys/class/net"
c="💻"
for i in `ls $NET_DIR`
do
    if [ $i == 'lo' ]
    then
        continue
    fi
    a=`cat $NET_DIR/$i/operstate`
    if [ 'x'$a == 'xup' ]
    then
        c="🌐"
    fi
done
echo $c
