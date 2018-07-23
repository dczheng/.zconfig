function my_load_module
    module load $argv[1]
    echo -e "\033[37mmodule load $argv[1] ... \033[0m"
end
