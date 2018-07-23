
function start_shadowsocks_arch

    sudo systemctl stop shadowsocks-libev@dczheng.service

    set ipaddr (ip addr | grep inet | grep wlp3s0 | awk '{print $2}' | awk -F '/' '{print $1}')

    #echo $ipaddr

    if test -n "$ipaddr"

        echo "update arch-wlan ($ipaddr) in /etc/hosts ..."
        sudo sed -i 's/.*arch-wlan/'"$ipaddr"' arch-wlan/' /etc/hosts

        echo "start shadowsocks on arch linux ... "
        sudo systemctl start shadowsocks-libev@dczheng.service

    else

        echo -e "\033[31mSTART SHADOWSOCKS FILED: network doesn't work!\033[0m"
        return 0

    end

end
