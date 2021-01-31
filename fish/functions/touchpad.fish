function touchpad
    if test -z $argv[1]
        echo "SYNTAX ERROR!"
       return
    end
    
    set h (cat /etc/hostname)
    set a $argv[1]

    if [ $h = "void" ]
        f $a "Synaptics TM3075-002"
    end

    if [ $h = "LFS" ]
        f $a "SynPS/2 Synaptics TouchPad"
    end
end

function f
    if [ $argv[1] = "on" ]
       xinput set-prop $argv[2] 'Device Enabled' 1
    else
       xinput set-prop $argv[2] 'Device Enabled' 0
    end
end
