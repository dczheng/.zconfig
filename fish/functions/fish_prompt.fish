function fish_prompt
    #set prompt_dir (pwd)
    set prompt_dir (string split / (pwd))
    set_color green 
    echo -en "$prompt_dir[-1]"
    set_color red 
    echo -en " > "
    set color normal
end
