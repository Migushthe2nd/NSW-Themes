for %%a in ("*.jpg") do (
    magick convert "%%a" -resize "%%a" 1280x720^^ -gravity center -extent 1280x720 -blur 0x6 "blurred\%%~na.jpg"
)