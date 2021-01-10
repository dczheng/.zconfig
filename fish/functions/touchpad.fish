function touchpad
    if test -z $argv[1]
        echo "SYNTAX ERROR!"
        return
    end
    
    if [ $argv[1] = "on" ]
        #xinput set-prop 'Synaptics TM3075-002' 'Device Enabled' 1
        xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Enabled' 1
    else
        #xinput set-prop 'Synaptics TM3075-002' 'Device Enabled' 0
        xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Enabled' 0
    end
end
