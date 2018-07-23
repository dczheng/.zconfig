
function change_to_work_dir

    if test -n "$MYWORK_DIR"

        echo
        echo -e "\033[32mchange to work directory $MYWORK_DIR \033[0m"
        alias cdw="cd $MYWORK_DIR"
        cd $MYWORK_DIR

    end

end
