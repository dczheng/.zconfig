function start_shadowsocks

    sudo systemctl stop shadowsocks-libev@dczheng.service

    echo "hostname: " $hostname

    if test "$hostname" = "caa"
        set ipaddr (ip addr | grep enp3s0 | grep inet | awk '{print $2}' | awk -F '/' '{print $1}')
    else
        set ipaddr (ip addr | grep wlp | grep inet | awk '{print $2}' | awk -F '/' '{print $1}')
    end

    echo "IP: " $ipaddr

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
