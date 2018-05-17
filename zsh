ZCONFIG="/home/dczheng/.zconfig"

arch_debian_env() {
    alias vi="vim"
    alias sudo=" sudo "
    alias pdf="evince &> /dev/null"
    alias mendeley="mendeleydesktop &> /dev/null"
    alias df="df -lh"
    alias cdw="cd /home/dczheng/work"
    alias cdd="cd /home/dczheng/Downloads"
    alias fmg="thunar &> /dev/null"
    alias firefox="firefox &> /dev/null"
    alias gedit="gedit &> /dev/null"
    alias reboot="sudo reboot"
    alias sd="sudo shutdown -h now"
}

arch_env() {
    $ZCONFIG/cowsay.py "Welcome to dczheng's Arch Linux"
    arch_debian_env
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
    arch_debian_env
    export TIME_STYLE='+%Y/%m/%d %H:%M:%S'
    alias cdw="cd /home/dczheng/Work"
    alias cdp="/home/dczheng/Zdata/documents/physics"
    alias cdm="/home/dczheng/Zdata/documents/math"
    alias cdc="/home/dczheng/Zdata/documents/computer"
    alias cdpa="/home/dczheng/Zdata/documents/paper"
    alias cdz="/home/dczheng/Zdata"
    alias cdl="cd /home/dczheng/Work/lian"
    alias cdg="cd /home/dczheng/Work/gadget"
    alias cdt="cd /home/dczheng/Work/gadget/gadget-tools"
    alias cds="cd /home/dczheng/Work/gadget/analysis"

    export PATH=$PATH:/home/dczheng/Work/gadget/scripts

    export PATH=./:/home/dczheng/local/bin:$PATH:/home/dczheng/Zdata/software/paraview/bin
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/dczheng/local/pkgconfig

    export LIBRARY_PATH=$LIBRARY_PATH:/home/dczheng/local/lib:/home/dczheng/Zdata/software/vtk-8.1.0/lib
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dczheng/local/lib:/home/dczheng/Zdata/software/vtk-8.1.0/lib
    export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/dczheng/local/include

    export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/dczheng/Zdata/software/vtk-8.1.0/include/vtk-8.1/
    export CMAKE_MODULE_PATH=$CMAKE_MODULE_PATH:/home/dczheng/Zdata/software/vtk-8.1.0/lib/cmake/vtk-8.1/Modules
    export CMAKE_MODULE_PATH=$CMAKE_MODULE_PATH:/home/dczheng/Zdata/software/vtk-8.1.0/lib/cmake/vtk-8.1
    export VTK_DIR=/home/dczheng/Zdata/software/vtk-8.1.0
    export VTK_SOURCE_DIR=/home/dczheng/Zdata/packages/VTK-8.1.0

    export BXSHARE=/home/dczheng/Zdata/software/bochs-2.6.9/share/bochs

    #source /home/dczheng/Zdata/software/Intel/icc-2016-u3/bin/iccvars.sh intel64
    #source /home/dczheng/Zdata/software/Intel/ifort-2016-u3/mkl/bin/mklvars.sh intel64
    #source /home/dczheng/Zdata/software/Intel/ifort-2016-u3/bin/ifortvars.sh intel64
    #source /home/dczheng/Zdata/software/idl-7.1/Setup/idl/bin/idl_setup.bash
    export PYTHONPATH=$PYTHONPATH:/home/dczheng/Zdata/software/commander2
    #export XPA_METHOD=local
    #xset m 20 1
    screenfetch
    #cowsay "Welcome to dczheng's Debian Linux"
    $ZCONFIG/cowsay.py "Welcome to dczheng's Debian Linux"
}

start_shadowsocks_arch() {
    ipaddr=`ip addr | grep inet | grep wlp3s0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    if [ 'x'$ipaddr = 'x' ]
    then
        echo -e "\033[31mSTART SHADOWSOCKS FILED: network doesn't work!\033[0m"
        return
    fi
    echo "update arch-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*arch-wlan/'"$ipaddr"' arch-wlan/' /etc/hosts
    echo "start shadowsocks on archlinux ... "
    sudo systemctl start shadowsocks-libev@dczheng.service
}

start_shadowsocks_debian() {
    ipaddr=`ip addr | grep inet | grep wlan0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    if [ 'x'$ipaddr = 'x' ]
    then
        echo -e "\033[31mSTART SHADOWSOCKS FILED: network doesn't work!\033[0m"
        return
    fi
    echo "update debian-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*debian-wlan/'"$ipaddr"' debian-wlan/' /etc/hosts
    echo "start shadowsocks on debian ... "
    sudo systemctl start shadowsocks-libev-local@dczheng.service
}

start_shadowsocks() {
    flag=`ps aux | grep shadowsocks | wc -l`
    if [ $flag != '1' ]
    then
        return
    fi
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

start_synergy() {
    HOST=`hostname`
    flag=`ps aux | grep synergy | grep -v "grep"`
    if [ $HOST = 'archlinux' ]
    then
        if [ 'x'$flag = 'x' ]
        then
            echo "start synergy client ..."
            synergy-core --client 172.168.1.1
        else
            echo "synergy already start!"
        fi
    elif [ $HOST = 'debian' ]
        if [ 'x'$flag = 'x' ]
        then
            echo "start synergy server ..."
            synergy-core --server -a 172.168.1.1 -c ~/.zconfig/synergy.conf
        else
            echo "synergy already start!"
        fi
    then
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

set_env() {
    clear
    echo "set environment ..."
    date

    HOST=`hostname`
    case $HOST in
        archlinux)
            arch_env
            ;;
        debian)
            debian_env
            ;;
    esac
    start_shadowsocks
}

set_env

