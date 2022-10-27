@echo off
title HideAFile
echo Ready!
echo .
echo .
echo Please put the file that will contains the hidden file and the file that will be hidden in the HideAFile folder.
echo .
echo .
echo You can move it after using HideAFile.
echo .
echo .

IF EXIST configs\textcolorgreen Color 2
IF EXIST configs\textcolorblue Color 1
IF EXIST configs\textcolorred Color 4
IF EXIST configs\textcolorpurple Color 5
IF EXIST configs\redtheme Color 4B
IF EXIST configs\greentheme goto :greenthemestart
IF NOT EXIST configs goto :createconfigs
IF NOT EXIST others MKDIR others
IF NOT EXIST configs\configs.txt goto :createconfigs
IF NOT EXIST configs\msgboxes.vbs goto :createconfigs

:boot

for /f "tokens=1,2 delims==" %%a in (configs\config.json) do (
    if %%a==welcomemsg set %%a=%%b
)

echo %welcomemsg%

:choice
set /P c=What Do You Want To Do ? [ 1 = Hide A File / 2 = Recover A File / 3 = Settings ]
if /I "%c%" EQU "1" goto :start
if /I "%c%" EQU "2" goto :recover
if /I "%c%" EQU "3" goto :settings
goto :choice

:start
echo .
echo .
echo Put This File In The Path Where Is Your File To Hide
echo .
echo .
echo If You Want To Hide A Folder , You Need To Zip It!
echo .
echo .
echo WARNING : WE RECOMMEND THAT YOU PUT THE FILES THAT WILL BE HIDDEN IN A COMPRESSED FOLDER
echo .
echo .
echo HideAFile Cannot Hide The File That Contain Spaces.

echo .
echo .
echo What is the name of the file that contains the hidden file?

set /p File=
echo .
echo .
echo What is the name of the file that you want to hide?
set /p File To Hide=
echo The %File% file will hide the %File To Hide% file!
timeout 1
echo Hidding
copy /b %File% + %File To Hide%
echo File Hidden !
del %File To Hide%
echo .
echo .
cd C:\
echo Please restart HideAFile.
timeout 5
taskkill /F /IM cmd.exe
goto :choice

pause
:end
echo Closing This Windows In Five Seconds!
timeout 5
exit

:recover
echo .
echo .
echo What is the name of the file that contains the hidden file?
set /p HFile=
echo .
echo .
echo What Is The Name Of The Hidden File?
set /p HDFile=
echo .
echo .
ren %HFile% %HDFile%
echo Done!
cd C:\
goto :choice

:settings

set /P set1=What Do You Want To Do ? [ 1 = Change text color / 2 = Open HideAFile on Github / 3 = Change Theme / 4 = Customize]
if /I "%set1%" EQU "1" goto :colorchange
if /I "%set1%" EQU "2" goto :openweb
if /I "%set1%" EQU "3" goto :changetheme
if /I "%set1%" EQU "4" goto :customize

goto :settings

:openweb

echo Opening Your Web Browser.
echo x=msgbox("HideAFile Is Opening Your Web Browser .",0,"HideAFile") > configs\msgboxes.vbs
start configs\msgboxes.vbs
start https://github.com/zShadowSkilled1/HideAFile
goto :choice

:customize

set /P set12=What Do You Want To Do ? [ 1 = Change Welcome Message /]
if /I "%set12%" EQU "1" goto :changewelcommsg

:colorchange

set /P c10=Wich Color ? [ 1 = Green / 2 = Blue / 3 = Red / 4 = Purple / 5 = White ]
if /I "%c10%" EQU "1" goto :greencolor
if /I "%c10%" EQU "2" goto :bluecolor
if /I "%c10%" EQU "3" goto :redcolor
if /I "%c10%" EQU "4" goto :purplecolor
if /I "%c10%" EQU "5" goto :whitecolor

goto :colorchange

:changetheme

set /P c11=Wich Color ? [ 1 = Green Theme / 2 = Red Theme]
if /I "%c11%" EQU "1" goto :greentheme
if /I "%c11%" EQU "2" goto :redtheme

:greencolor

Color 2
rem echo {[textcolor = Green]}> configs\config.json
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorgreen
goto :choice

:bluecolor

Color 1
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorprple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorblue
goto :choice

:redcolor

Color 4
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorred
goto :choice

:purplecolor

Color 5
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\redtheme del /F configs\redtheme
IF EXIST configs\greentheme del /F configs\greentheme
type nul > configs\textcolorpurple
goto :choice

:whitecolor

Color 7
IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple

goto :choice

:greentheme

IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\redtheme del /F configs\redtheme
Color 2B
Color 2F
type nul > configs\greentheme
goto :choice

:greenthemestart
Color 2B
Color 2F
IF EXIST configs\msgboxes.vbs echo x=msgbox("HideAFile Is Ready To Be Used .",0,"HideAFile") > configs\msgboxes.vbs

start configs\msgboxes.vbs
goto :choice

:redtheme

IF EXIST configs\textcolorgreen del /F configs\textcolorgreen
IF EXIST configs\textcolorblue del /F configs\textcolorblue
IF EXIST configs\textcolorred del /F configs\textcolorred
IF EXIST configs\textcolorpurple del /F configs\textcolorpurple
IF EXIST configs\greentheme del /F configs\greentheme
Color 4B
type nul > configs\redtheme
goto :choice

:changewelcommsg

echo Please enter your custom message.

IF EXIST configs\config.json set /P WMSG=
IF EXIST configs\config.json echo welcomemsg=%WMSG% > configs\config.json
IF EXIST configs\config.json type nul > configs\custommsg


:choice3
set /P c3=What Do You Want To Do ? [ 1 = Exit / 2 = Hide A File ]
if /I "%c3%" EQU "1" exit
if /I "%c3%" EQU "2" goto :start
goto :choice3

:createconfigs

IF NOT EXIST configs MKDIR configs
IF NOT EXIST others MKDIR others
IF NOT EXIST configs\config.json echo .
IF NOT EXIST configs\config.json echo .
IF NOT EXIST configs\config.json echo Downloading The HideAFile Components.
echo .
echo .
IF NOT EXIST configs\config.json type nul > configs\config.json 
IF NOT EXIST configs\msgboxes.vbs type nul > configs\msgboxes.vbs
IF EXIST configs\msgboxes.vbs echo x=msgbox("HideAFile Is Ready To Be Used .",0,"HideAFile") > configs\msgboxes.vbs

start configs\msgboxes.vbs
echo HideAFile Is Ready To Be Used.
IF NOT EXIST configs\custommsg echo welcomemsg=Welcome To HideAFile. > configs\config.json

echo .
echo .
IF NOT EXIST configs\config.json echo HideAFile Cannot Download Components (Error 1).
IF NOT EXIST configs\msgboxes.vbs echo HideAFile Cannot Download Components (Error 2).

goto :boot

