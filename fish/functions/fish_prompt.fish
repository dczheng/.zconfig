function fish_prompt
    #set prompt_dir (pwd)
    set prompt_dir (string split / (pwd))
    set_color green 
    set h (hostname)
    echo -en "$h.$USER.$prompt_dir[-1]"
    set_color yellow
    echo -en " <💯> "
    set color normal
end
