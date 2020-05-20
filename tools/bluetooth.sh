#!/bin/bash
#bluetoothctl
#[bluetooth]# power on
#[bluetooth]# agent on
#[bluetooth]# default-agent
#[bluetooth]# scan on
#[bluetooth]# pair XX:XX:XX:XX:XX
#[bluetooth]# trust XX:XX:XX:XX:XX
#[bluetooth]# connect XX:XX:XX:XX:XX
#[bluetooth]# exit

bluetoothctl power on
bluetoothctl connect 90:7F:61:00:03:65
