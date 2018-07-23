function start_shadowsocks

    set HOST ( hostname )

    #echo $HOST

    switch $HOST

        case 'debian'
            start_shadowsocks_debian

        case 'archlinux'
            start_shadowsocks_arch

        case '*'
            echo "Unsupported host!"

    end

end
