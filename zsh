arch_env() {
    cowsay "Welcome to dczheng's Arch Linux"
    alias cdp="cd /home/dczheng/data/documents/physics"
    alias cdm="cd /home/dczheng/data/documents/math"
    alias cdc="cd /home/dczheng/data/documents/computer"
    alias cdpa="cd /home/dczheng/data/documents/paper"
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
    alias cdw="cd /home/dczheng/Work"
    alias cdp="/home/dczheng/Zdata/documents/physics"
    alias cdm="/home/dczheng/Zdata/documents/math"
    alias cdc="/home/dczheng/Zdata/documents/computer"
    alias cdpa="/home/dczheng/Zdata/documents/paper"
    alias cdz="/home/dczheng/Zdata"
    alias cdl="cd /home/dczheng/Work/lian"
    alias cdg="cd /home/dczheng/Work/gadget"
    alias cda="cd /home/dczheng/Work/gadget/analysis"

    export PATH=$PATH:/home/dczheng/Work/gadget/scripts

    export PATH=./:/home/dczheng/local/bin:$PATH
    export LIBRARY_PATH=$LIBRARY_PATH:/home/dczheng/local/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dczheng/local/lib
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/dczheng/local/include
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/dczheng/local/pkgconfig

    export BXSHARE=/home/dczheng/Zdata/software/bochs-2.6.9/share/bochs

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

start_shadowsocks_arch() {
    ipaddr=`ip addr | grep inet | grep wlp3s0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    echo "update arch-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*arch-wlan/'"$ipaddr"' arch-wlan/' /etc/hosts
    echo "start shadowsocks ... "
    sudo systemctl start shadowsocks-libev@dczheng.service
}

start_shadowsocks_debian() {
    ipaddr=`ip addr | grep inet | grep wlan0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    echo "update debian-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*debian-wlan/'"$ipaddr"' debian-wlan/' /etc/hosts
    echo "start shadowsocks ... "
    sudo systemctl start shadowsocks-libev-local@dczheng.service
}

start_shadowsocks() {
    HOST=`hostname`
    if [ $HOST = 'archlinux' ]
    then
        start_shadowsocks_arch
    elif [ $HOST = 'debian' ]
    then
        start_shadowsocks_debian
    else
        echo "Unsupported host"
    fi
}

start_shadowsocks() {
    ipaddr=`ip addr | grep inet | grep wlan0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    HOST=`hostname`
    if [ $HOST = 'archlinux' ]
        synergy-core --client $1
    then
    elif [ $HOST = 'debian' ]
    then
        synergy-core --server -d $ipaddr -c ~/.zconfig/synergy.conf
    else
        echo "Unsupported host"
    fi
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

scp_caa() {
    echo "send $1 to caa ..."
    scp $1 dczheng@caa:~
}

scp_astro() {
    echo "send $1 to astro ..."
    scp -P 6600 $1 astro@astro:~
}

scp_s1() {
    echo "send $1 to sao1 ..."
    scp $1 dczheng@sao:~
}

scp_s2() {
    echo "send $1 to sao2 ..."
    scp -P 6666 $1 dczheng@guotsuan.asuscomm.com:~
}

set_env() {
    clear
    echo "set environment ..."
    date
    alias vi="vim"
    alias sudo=" sudo "
    alias pdf="evince &> /dev/null"
    alias df="df -lh"
    alias cdw="cd /home/dczheng/work"
    alias cdd="cd /home/dczheng/Downloads"
    alias fmg="thunar &> /dev/null"
    alias firefox="firefox &> /dev/null"
    alias gedit="gedit &> /dev/null"
    alias reboot="sudo reboot"
    alias sd="sudo shutdown -h now"

    alias ssh_caa="ssh dczheng@caa"
    alias ssh_astro="ssh -p 6600 astro@astro"
    alias ssh_wang="ssh -p 8080 wang@wang"
    alias ssh_s1="ssh dczheng@sao"
    alias ssh_s2="ssh -p 6666 dczheng@guotsuan.asuscomm.com"

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
}

djvu2pdf() {
    if [ $1'x' != 'x' ] 
    then
        ddjvu -format=tiff $1 "tmp.tiff"
        tiff2pdf -j -o $1".pdf" "tmp.tiff"
        rm tmp.tiff
    else
        echo "Please input pdf file"
    fi
}

set_env
