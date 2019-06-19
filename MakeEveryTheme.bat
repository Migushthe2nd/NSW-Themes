rem By Migush and Stackoverflow ~ not the best code
@echo off
Setlocal EnableDelayedExpansion
rem Set important variables
	rem Set release folder
		Set /p ThemeName=Enter the name of the theme (eg. Careful Layout ENX v1): 
		Set "ReleaseFolder=Finished\%ThemeName%"
	rem Set the SwitchThemeInjector directory
		Set "StiEXE=K:\NSW\Themes\Very nice theme\tools\SwitchThemeInjector\Release4.0\SwitchThemes.exe"
	rem Set the folder with dds backgrounds
		Set "DDSFolder=K:\NSW\Themes\Very nice theme\NSW-Themes\backgrounds"
	rem Set folder with menu overlay for preview images
		Set "OverlayPreview=Overlays\%ThemeName%"
		Set Sevenz="C:\Program Files\7-Zip\7z.exe"
:MENU0.5
clear
ECHO.
ECHO ........................................................................
ECHO     Now Drag and drop the layout json on this window and press enter
ECHO ........................................................................
ECHO.
SET /P jsonfile=
IF NOT EXIST %jsonfile% GOTO NotExist1
CALL :dequote jsonfile
:DeQuote
for /f "delims=" %%A in ('echo %%%1%%') do set %1=%%~A
clear
GOTO MENU1

:NotExist1
clear
ECHO.
ECHO That file doesn't exist
Echo Try again...
ECHO.
pause
GOTO MENU0.5

:MENU1
if EXIST "%OverlayPreview%" GOTO MENU2
	ECHO.
	ECHO .....................................................................
	ECHO     You don't seem to have a folder with overlays for this theme. 
	ECHO     Would you like to create the folder now?
	ECHO .....................................................................
	ECHO.
	ECHO 1 - Yes
	ECHO 2 - No (will still create the NXThemes)
	ECHO.
	
	SET /P S1=Select a number, then press ENTER: 
	clear
	IF %S1%==1 (
		mkdir "%OverlayPreview%"
		GOTO MENU2
	)
	IF %S1%==2 GOTO MENU2
	clear
	ECHO That was an error.
	pause
	clear
	GOTO MENU1

		rem Set overlay names
			rem Set variantlist= rounded squared
	rem Set szs names
		rem qlaunch
			rem set qlaunchlist=
		rem overlayDisp
			rem set overlayDisplist= common MiniSet OverlayNotification
		rem playerSelect
			rem set playerSelectlist= common Psl
		rem which files from qlaunch to patch with a background
			rem set patchwithbackgroundlist= Entrance Flaunch ResidentMenu
		rem Set qlaunch variants
			rem set qlaunchvariantlist= rounded squared
		rem Set playerSelect variants
			rem set DefaultFilesvariantlist= rounded squared transparant

:MENU2

ECHO.
ECHO ....................................
ECHO     What would You like to do?
ECHO ....................................
ECHO.
ECHO 1 - Create Homemenu theme
ECHO 2 - Create lockscreen theme
ECHO 3 - Create all apps screen theme
ECHO 4 - Create settings theme
ECHO 5 - Create user page theme
ECHO 6 - Create news theme
ECHO.

SET /P S2=Select a number, then press ENTER: 
clear
IF %S2%==1 (
	set menu=home
	GOTO MENU2.5
)
IF %S1%==2 (
	set menu=lock
	GOTO MENU3
)
IF %S1%==3 (
	set menu=apps
	GOTO MENU3
)
IF %S1%==4 (
	set menu=set
	GOTO MENU3
)
IF %S1%==5 (
	set menu=user
	GOTO MENU3
)
IF %S1%==6 (
	set menu=news
	GOTO MENU3
)
clear
ECHO That was an error.
pause
clear
GOTO MENU2

:MENU2.5
clear
ECHO.
ECHO .........................................................................................
ECHO     If you have a custom common json drop it here as well, otherwise leave this empty
ECHO .........................................................................................
ECHO.
SET /P jsoncommonfile=
IF [%jsoncommonfile%] == [] GOTO MENU3
IF NOT EXIST %jsoncommonfile% GOTO NotExist2
CALL :dequote jsoncommonfile
:DeQuote
for /f "delims=" %%A in ('echo %%%1%%') do set %1=%%~A
SET commonlyt="commonlyt=%jsoncommonfile%"
clear
GOTO MENU3

:NotExist2
clear
ECHO.
ECHO That file doesn't exist
Echo Try again...
ECHO.
pause
GOTO MENU2.5

:MENU3
clear
ECHO.
ECHO ....................................
ECHO     What would You like to do?
ECHO ....................................
ECHO.
ECHO 1 - Create NXTheme for all backgrounds with preview
ECHO 2 - Create NXTheme for a single background with preview
ECHO.

SET /P S3=Select a number, then press ENTER: 
clear
IF %S3%==1 GOTO All
IF %S3%==2 GOTO Single
ECHO That was an error.
pause
clear
GOTO MENU3

pause

:All

ECHO.
ECHO .........................................
ECHO     Delete old NXThemes and previews?
ECHO .........................................
ECHO.
ECHO 1 - Yes
ECHO 2 - No
ECHO.

SET /P S4=Select a number, then press ENTER: 
clear
IF %S4%==1 (
	rm -rfd "%ReleaseFolder%"
	GOTO Create
)
IF %S4%==2 GOTO Create
ECHO That was an error.
pause
clear
GOTO All

:Create
ECHO Creating themes with:
ECHO %jsonfile% 
for %%a in ("%DDSFolder%\*.dds") do (
	ECHO -------------------------------------------
	ECHO Creating NXTheme for '%menu%' with '%%~nxa'
	IF NOT EXIST "%ReleaseFolder%" MKDIR "%ReleaseFolder%"
	"%StiEXE%" buildNX %menu% "%%a" "%jsonfile%" "name=%%~na" "author=Migush" %commonlyt% "out=%ReleaseFolder%\%ThemeName% - %%~na.nxtheme"
)
ECHO -------------------------------------------

:PreviewImages
	rem Create preview images
		for %%d in ("%OverlayPreview%\*.png") do (
			IF [%%d] == [] GOTO EOF
			for %%a in ("%DDSFolder%\*.dds") do (
				ECHO -------------------------------------------
				ECHO Creating preview for '%ThemeName%' with '%%~nxa'
				if NOT EXIST "%ReleaseFolder%\PreviewImages\%%~nd" mkdir "%ReleaseFolder%\PreviewImages\%%~nd"
				rem SKIP MAGENTA PREVIEW GENERATION
					rem if NOT "%%a"=="%%a:MAGENTA=" GOTO SkipPreview
				magick composite -gravity center "%%d" "%%a" "%ReleaseFolder%\PreviewImages\%%~nd\%%~na.png"
				set "montageimages=!montageimages! "%ReleaseFolder%\PreviewImages\%%~nd\%%~na.png""
			)
			ECHO.
			ECHO Making montage of all images...
			magick montage -geometry +0+0 -label %%t -pointsize 40 -quality 80%% !montageimages! "%ReleaseFolder%\PreviewImages\%%~nd-combined.jpg"
			ECHO.
			ECHO Creating zip with all NXThemes and '%ThemeName%-combined.jpg'...
			cd "%ReleaseFolder%"
			%Sevenz% a -tzip "%ThemeName% - NXThemes" "*.nxtheme" "PreviewImages\*.jpg"
		)
		ECHO -------------------------------------------
		ECHO.
		ECHO.
		ECHO Done.
pause
clear
:EOF
exit