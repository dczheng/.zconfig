function zopen
    set pdf_opener  zathura
    set txt_opener  gedit
    set img_opener  eog 

    set filetype (string split "." -- $argv[1])[2]
    switch $filetype

        case "pdf" "djvu"
            printf "Open `%s` with %s\n" $argv[1] $pdf_opener
            $pdf_opener  $argv[1] &

        case "txt"
            printf "Open `%s` with %s\n" $argv[1] $txt_opener
            $txt_opener  $argv[1] &

        case "png" "jpg" "jpeg" "bmp"
            printf "Open `%s` with %s\n" $argv[1] $img_opener
            $img_opener  $argv[1] &

        case '*'
            printf "Can't open `%s`\n" $argv[1]
    end
end

