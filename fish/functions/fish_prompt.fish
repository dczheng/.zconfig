function fish_prompt
    set_color yellow
    set prompt_dir (string split / (pwd))
    echo -e "💩$prompt_dir[-1] > "
    set color normal
end
