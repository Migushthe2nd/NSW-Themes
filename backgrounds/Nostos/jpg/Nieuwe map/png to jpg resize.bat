mkdir "jpg"
for %%a in ("*.png") do (
    magick convert "%%a" -resize 1280x720^^ -gravity center -extent 1280x720 "jpg\%%~na.jpg"
)