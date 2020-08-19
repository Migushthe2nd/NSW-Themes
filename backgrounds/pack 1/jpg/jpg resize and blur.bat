for %%a in ("*.jpg") do (
    magick convert -resize 1280x720 -blur 0x6 "%%a" "blurred\%%~na.jpg"
)