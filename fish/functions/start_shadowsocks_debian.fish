
function start_shadowsocks_debian

    sudo systemctl stop shadowsocks-libev-local@dczheng.service
    set ipaddr (ip addr | grep inet | grep wlan0 | awk '{print $2}' | awk -F '/' '{print $1}')

    #echo $ipaddr

    if test -n "$ipaddr"

        echo "update debian-wlan ($ipaddr) in /etc/hosts ..."
        sudo sed -i 's/.*debian-wlan/'"$ipaddr"' debian-wlan/' /etc/hosts

        echo "start shadowsocks on debian linux ... "
        sudo systemctl start shadowsocks-libev-local@dczheng.service

    else

        echo -e "\033[31mSTART SHADOWSOCKS FILED: network doesn't work!\033[0m"
        return 0

    end

end
