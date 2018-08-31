function pdf2djvu
    ddjvu -format=pdf -verbose -scale=100 "$argv[1]" "$argv[1].pdf"
end
