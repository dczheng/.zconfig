function fish_prompt
    #set_color yellow 
    #set prompt_dir (pwd)
    #set prompt_dir (string split / (pwd))
    #echo -e " $prompt_dir"
    set_color red 
    echo -en " > "
    set color normal
end
