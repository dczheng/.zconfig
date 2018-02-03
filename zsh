cowsay "Welcome to dczheng's Arch Linux"

arch_env() {
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

shadowsocks_start() {
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
