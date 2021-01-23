function set-mouse
    if test -z $argv[1]
        echo "SYNTAX ERROR!"
       return
    end

    set opt "libinput Accel Speed"
    echo $opt
    xinput set-prop $argv[1] $opt 1

    set opt "libinput Middle Emulation Enabled"
    echo $opt
    xinput set-prop $argv[1] $opt 1

    set opt "libinput Scroll Method Enabled"
    echo $opt
    xinput set-prop $argv[1] $opt 0 0 1

    set opt "libinput Button Scrolling Button"
    echo $opt
    xinput set-prop $argv[1] $opt 3

    xinput set-button-map $argv[1] 1 2 3
    xinput get-button-map $argv[1]
end
