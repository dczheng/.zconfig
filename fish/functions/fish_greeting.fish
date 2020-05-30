# Defined in fish_greeting.fish @ line 1
function fish_greeting
    if status is-login
        clear 
        set sys (hostnamectl | grep "Operating" | cut -d":" -f2 )
        cowsay.py "$USER (*.*) Welcome to $USER's $sys (*.*)"
        echo ">>>>>>>>>>>>>>>>>>>"
        hostnamectl | egrep -v "(ID|Chassis)"
        echo ">>>>>>>>>>>>>>>>>>>"
        echo "Last Login:"
        lastlog | sed -n '3,$p' | egrep -v "(Never| tty)" | awk '{print $1" from "$3}'
        echo ">>>>>>>>>>>>>>>>>>>"
        date
    end
end
