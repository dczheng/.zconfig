
arch_env() {
    cowsay "Welcome to dczheng's Arch Linux"
    alias vi="vim"
    alias sudo=" sudo "
    alias cdw="cd /home/dczheng/work"
    alias cdp="cd /home/dczheng/data/documents/physics"
    alias cdm="cd /home/dczheng/data/documents/math"
    alias cdc="cd /home/dczheng/data/documents/computer"
    alias cdpa="cd /home/dczheng/data/documents/paper"
    alias cdd="cd /home/dczheng/Downloads"
    alias df="df -h"
    alias pdf="evince 2>&1 >> /dev/null"
    alias sd="shutdown -h now"
    alias cdl="cd /home/dczheng/local"
    alias cdg="cd /home/dczheng/work/gadget"
    alias cda="cd /home/dczheng/work/gadget/analysis"
    alias cdz="cd /home/dczheng/data"
    export PATH=$PATH:/home/dczheng/local/bin:/home/dczheng/local/bin/public
    export PATH=/home/dczheng/local/bin:$PATH
    export LD_LIBRARY_PATH=/home/dczheng/local/lib:$LD_LIBRARY_PATH
    export LIBRARY_PATH=$LD_LIBRARY_PATH
    export C_INCLUDE_PATH=/home/dczheng/local/include:$C_INCLUDE_PATH
    export PKG_CONFIG_PATH=/home/dczheng/local/pkgconfig:$PKG_CONFIG_PATH
    export LC_CTYPE=en_US.UTF-8
}

debian_env() {
    export TIME_STYLE='+%Y/%m/%d %H:%M:%S'
    xrandr --output VGA-1 --mode  1920x1080  
    xrandr --output DVI-D-1 --mode 1280x1024 --right-of VGA-1
    alias vi="vim"
    alias pdf="evince &> /dev/null"
    alias fmg="thunar &> /dev/null"
    alias firefox="firefox &> /dev/null"
    alias gedit="gedit &> /dev/null"
    alias cdd="cd /home/dczheng/Downloads"
    alias cdw="cd /home/dczheng/Work"
    alias cdp="/home/dczheng/Zdata/documents/physics"
    alias cdm="/home/dczheng/Zdata/documents/math"
    alias cdc="/home/dczheng/Zdata/documents/computer"
    alias cdpa="/home/dczheng/Zdata/documents/paper"
    alias cdz="/home/dczheng/Zdata"
    alias sudo="sudo  "
    alias reboot="sudo reboot"
    alias df="df -lh"
    alias top="htop"
    alias cdl="cd /home/dczheng/Work/lian"
    alias cdg="cd /home/dczheng/Work/gadget"
    alias cda="cd /home/dczheng/Work/gadget/analysis"

    export PATH=$PATH:/home/dczheng/Work/gadget/scripts

    export PATH=./:/home/dczheng/local/bin:$PATH
    export LIBRARY_PATH=$LIBRARY_PATH:/home/dczheng/local/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dczheng/local/lib
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/dczheng/local/include
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/dczheng/local/pkgconfig

    #source /home/dczheng/Zdata/software/Intel/icc-2016-u3/bin/iccvars.sh intel64
    #source /home/dczheng/Zdata/software/Intel/ifort-2016-u3/mkl/bin/mklvars.sh intel64
    #source /home/dczheng/Zdata/software/Intel/ifort-2016-u3/bin/ifortvars.sh intel64
    #source /home/dczheng/Zdata/software/idl-7.1/Setup/idl/bin/idl_setup.bash
    export PYTHONPATH=$PYTHONPATH:/home/dczheng/Zdata/software/commander2
    #export XPA_METHOD=local
    #xset m 20 1
    screenfetch
    cowsay "Welcome to dczheng's Debian Linux"
}

start_shadowsocks() {
    ipaddr=`ip addr | grep inet | grep wlp3s0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    echo "update arch-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*arch-wlan/'"$ipaddr"' arch-wlan/' /etc/hosts
    echo "start shadowsocks ... "
    sudo systemctl start shadowsocks-libev@dczheng.service
}

touchpad_on() {
    xinput set-prop 'Synaptics TM3075-002' 'Device Enabled' 1
}

touchpad_off() {
    xinput set-prop 'Synaptics TM3075-002' 'Device Enabled' 0
}

battary_info() {
    upower -i $(upower -e | grep 'BAT') | grep -E "state|percentage"
}

HOST=`hostname`

if [ $HOST = 'archlinux' ]
then
     arch_env
elif [ $HOST = 'debian' ]
then
     debian_env
else
     echo "Unsupported host"
fi
