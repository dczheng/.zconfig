#!/bin/bash
cd 
echo "---------------------------------------------------"
apt update
apt -y install vim zsh curl wget tmux gcc make git libpcre3-dev asciidoc libmbedtls-dev  libsodium-dev libc-ares-dev libev-dev

if [ $? != '0' ]
then
    exit
fi

echo "---------------------------------------------------"
if [ $SHELL != "/bin/zsh" ] 
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    if [ $? != '0' ]
    then
        exit
    fi
    chsh -s /bin/zsh
fi

echo "---------------------------------------------------"

if [ ! -n "$1" ]
then    
SS_VERSION=3.3.4
else
SS_VERSION=$1
fi

echo "shadowsocks version:" $SS_VERSION

ssname="shadowsocks-libev-${SS_VERSION}"
if [ ! -f "$ssname.tar.gz" ]
then
wget https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_VERSION/$ssname.tar.gz
if [ $? != '0' ]
then
    exit
fi
fi

if [ ! -d "$ssname" ]
then
tar xvf $ssname.tar.gz
if [ $? != '0' ]
then
    exit
fi
fi


cd $ssname
./configure

if [ $? != '0' ]
then
    exit
    cd -
fi

make 
if [ $? != '0' ]
then
    exit
    cd -
fi

make install

cd -

echo -n "ip address: "
read ADDR

echo -n "password: "
read PASSWORD 

echo "{" > config.json
echo "\"server\":\"$ADDR\"," >> config.json
echo "\"server_port\":8321," >> config.json
echo "\"method\":\"aes-256-cfb\"," >> config.json
echo "\"timeout\":600," >> config.json
echo "\"password\":\"$PASSWORD\"" >> config.json
echo "}" >> config.json

wget "https://raw.githubusercontent.com/dczheng/.zconfig/master/tmux.conf" -O .tmux.conf
