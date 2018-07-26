function battary_info
    upower -i ( upower -e | grep 'BAT' ) | grep -E "state|percentage"
end
