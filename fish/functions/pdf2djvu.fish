function pdf2djvu
    ddjvu -format=pdf -verbose "$argv[1]" "$argv[1].pdf"
end
