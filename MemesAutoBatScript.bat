@echo off
color 0A
:Begin
cls
echo Starting...
echo Note: If any of the paths are left blank the examples will be used!
echo Warning!: Put the bat script in the same folder with the switchthemes.exe file!
echo.
set /p name=What's the name of the theme pack? Keep it short:
set /p auth=Who's the creator of this theme pack? Keep it short:
set /p sav=Where do the final theme files need to be saved (enter a folder name) (example: FinalTheme):
set exeloc=SwitchThemes.exe
if /I "%name%"=="" set name=UserTheme
if /I "%auth%"=="" set auth=User
if /I "%sav%"=="" set sav=UserTheme
cls
set /p homeimgdir=Enter the full path to the folder with images you'd like to convert into an nxtheme for the [HOME] applet (Keep blank if you don't want to inject the home menu) (example: Images\home.jpg):
set /p lockimgdir=Enter the full path to the image you'd like to convert into an nxtheme for the [LOCK] applet (Keep blank if you don't want to inject the lock screen) (example: Images\lock.jpg):
set /p setimgdir=Enter the full path to the image you'd like to convert into an nxtheme for the [SETTINGS] applet (Keep blank if you don't want to inject the settings menu) (example: Images\settings.jpg):
set /p flaunchimgdir=Enter the full path to the image you'd like to convert into an nxtheme for the [ALL APPS] applet (Keep blank if you don't want to inject the all apps menu) (example: Images\allapps.jpg):
cls
set /p layloc=Enter the path to the layout folder (example: Layouts): 
if /I "%layloc%"=="" set layloc=Layouts
dir %layloc%\*.json
echo. 
echo Make sure you use the correct json for the applet you are theming.
echo If you use the wrong one, your switch may not boot.
set /p layhome=Enter the .json file you'd like to use for the [HOME] applet (example: SuchHm.json): 
set /p laylock=Enter the .json file you'd like to use for the [LOCK] applet (example: SuchLk.json): 
set /p layapps=Enter the .json file you'd like to use for the [FLAUNCH] applet (example: DogeFl.json): 
if /I "%layhome%"=="" set layhome=SuchHm.json
if /I "%laylock%"=="" set laylock=SuchLk.json
if /I "%layapps%"=="" set layapps=DogeFl.json
cls

echo Layout HOME location = %layloc%\%layhome%
echo Layout LOCK location = %layloc%\%laylock%
echo Layout FLAUNCH location = %layloc%\%layapps%
echo. 
echo HOME image location = %home%
echo LOCK image location = %lock%
echo SETTINGS image location = %set%
echo ALL APPS image location = %flaunch%
echo.
echo Theme Name = %name%
echo Theme Creator = %auth%
echo Save location = %sav%
echo.
echo CHECK IF THESE PATHS LINE UP!
echo Enter "Y" to continue and build the theme, enter "N" to go back and edit parts.
set /p check=If you don't want to change a part, leave it blank when editing... 
if /I "%check%"=="n" goto Begin

cls
echo Building theme, if the switchthemes app opens, you've put in something incorrect!
mkdir "%sav%"
if /I "%home%"=="" goto emhome
echo.
echo Building HOME
%exeloc% buildNX home "%home%" "%layloc%\%layhome%" "name=%name% [Home]" "author=%auth%" "out=%sav%\%name% [Home].nxtheme"
echo Done Building Home!
:emhome


if /I "%lock%"=="" goto emlock
echo.
echo Building LockScreen
%exeloc% buildNX lock "%lock%" "%layloc%\%laylock%" "name=%name% [Lock]" "author=%auth%" "out=%sav%\%name% [Lock].nxtheme"
echo Done Building Lock!
:emlock

if /I "%flaunch%"=="" goto emapps
echo.
echo Building ALL APPS
%exeloc% buildNX apps "%flaunch%" "%layloc%\%layapps%" "name=%name% [Apps]" "author=%auth%" "out=%sav%\%name% [Apps].nxtheme"
echo Done Building Flaunch!
:emapps

if /I "%set%"=="" goto emset
echo.
echo Building SETTINGS
%exeloc% buildNX set "%set%" "name=%name% [Set]" "author=%auth%" "out=%sav%\%name% [Set].nxtheme"
echo Done Building Set!
:emset
echo.

if /I "%layhome%"=="SuchHm.json" goto check1
goto end
:check1
if /I "%laylock%"=="SuchLk.json" goto check2
goto end
:check2
echo Building Preview Images:
cd "%sav%"
mkdir "Preview"
cd ..
magick composite -gravity center Overlay\HomeDogeOverlay.png "%home%" "%sav%\Preview\Home.png"
magick composite -gravity center Overlay\LockDogeOverlay.png "%lock%" "%sav%\Preview\Lock.png"
magick composite -gravity center Overlay\SetOverlay.png "%set%" "%sav%\Preview\Set.png"
magick montage "%sav%\Preview\Lock.png" "%sav%\Preview\Home.png" "%sav%\Preview\Set.png" -tile 3x1 -geometry +0+0 "%sav%\Preview\Combined.png"
:end

set /p yn=Done! Want to make another theme? (Y/N)
if /I "%yn%"=="Y" goto begin
if /I "%yn%"=="Yes" goto begin