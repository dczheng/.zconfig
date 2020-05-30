function my_welcome
    if status is-login
        clear 
        set sys (hostnamectl | grep "Operating" | cut -d":" -f2 )
        cowsay.py "$USER (*.*) Welcome to $USER's $sys (*.*)"
        echo ">>>>>>>>>>>>>>>>>>>"
        hostnamectl | egrep -v "(ID|Chassis)"
        echo ">>>>>>>>>>>>>>>>>>>"
        date
    end
end
