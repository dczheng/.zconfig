function bl 

    if test -z $argv[1]
        set X "300"
    else
        set X $argv[1]
    end
    set XX ( cat /sys/class/backlight/intel_backlight/brightness )
    set Y ( cat /sys/class/backlight/intel_backlight/max_brightness )
    echo $X | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
end
