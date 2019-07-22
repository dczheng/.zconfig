function battary_info
    upower -i ( upower -e | grep -E 'battery|DisplayDevice' ) | grep -E "state|percentage"
end
