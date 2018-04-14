ZCONFIG="/home/dczheng/.zconfig"

arch_debian_env() {
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

caa_env() {
    USER=`whoami`

    export PATH=/mnt/ddnfs/data_users/dczheng/local/bin:$PATH:$ZCONFIG
    export LD_LIBRARY_PATH=/mnt/ddnfs/data_users/dczheng/local/lib:$LD_LIBRARY_PATH
    export LIBRARY_PATH=/mnt/ddnfs/data_users/dczheng/local/lib:$LIBRARY_PATH
    export C_INCLUDE_PATH=/mnt/ddnfs/data_users/dczheng/local/include:$C_INCLUDE_PATH
    export PKG_CONFIG_PATH=/mnt/ddnfs/data_users/dczheng/local/pkgconfig:$PKG_CONFIG_PATH
    source /usr/share/Modules/3.2.10/init/sh
    export MODULEPATH=/mnt/ddnfs/data_users/dczheng/local/modules:$MODULEPATH
    echo
    $ZCONFIG/job_info -ns -ncow -ncls
    echo
    $ZCONFIG/cowsay.py " $USER  (*.*) Welcome to CAA's Suse Linux (*.*)"

    if [ $USER != 'dczheng' ]
    then
        return
    fi

    alias cdw="cd /mnt/ddnfs/data_users/dczheng"
    alias cds="cd /mnt/ddnfs/data_users/dczheng/simulation"
    alias cdg="cd /mnt/ddnfs/data_users/dczheng/p-gadget3"
    alias cdt="cd /mnt/ddnfs/data_users/dczheng/gadget-tools"
    alias cdr="cd /mnt/ddnfs/data_users/dczheng/read_gadget_code"
    alias w="w -h | sort"
    export WORK="/mnt/ddnfs/data_users/dczheng/"
    module purge
    #module load openmpi-3.0.0 fftw-2.1.5 hdf5-1.8.19 gsl-2.4
    module load mpich-3.2.1 fftw-2.1.5_mpich hdf5-1.8.19 gsl-2.4
}

cluster_env() {
    export PATH=/home/dczheng/local/bin:$PATH
    export LD_LIBRARY_PATH=/home/dczheng/local/lib:$LD_LIBRARY_PATH
    export LIBRARY_PATH=/home/dczheng/local/lib:$LIBRARY_PATH
    export C_INCLUDE_PATH=/home/dczheng/local/include:$C_INCLUDE_PATH
    export MANPATH=/home/dczheng/local/man:$MANPATH
    export PKG_CONFIG_PATH=/home/dczhen/local/pkgconfig:$$PKG_CONFIG_PATH
    alias cds=/home/dczheng/simulation
    alias cdt=/home/dczheng/gadget-tools
    export MODULEPATH=/home/dczheng/local/modules:$MODULEPATH
    module load mpich/mpich-3.2.1
    module load mpich/fftw-2.1.5
    echo
    $ZCONFIG/job_info -ns -ncow -ncls
    echo
    $ZCONFIG/cowsay.py " $USER  (*.*) Welcome to CenOS (*.*)"
}

start_shadowsocks_arch() {
    ipaddr=`ip addr | grep inet | grep wlp3s0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    echo "update arch-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*arch-wlan/'"$ipaddr"' arch-wlan/' /etc/hosts
    echo "start shadowsocks on archlinux... "
    sudo systemctl start shadowsocks-libev@dczheng.service
}

start_shadowsocks_debian() {
    ipaddr=`ip addr | grep inet | grep wlan0 | awk '{print $2}' | awk -F '/' '{print $1}'`
    echo "update debian-wlan ($ipaddr) in /etc/hosts ..."
    sudo sed -i 's/.*debian-wlan/'"$ipaddr"' debian-wlan/' /etc/hosts
    echo "start shadowsocks on debian... "
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

intel_env() {
    echo "change intel environment ..."
    module purge
    module load intel-2016
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
        master)
            ssh node1
            ;;
        scnode*)
            cluster_env
            ;;
        uv00000773-p000)
            caa_env
            ;;
    esac
}

set_env

