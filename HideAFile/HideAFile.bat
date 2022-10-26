@echo off
title HideAFile
echo Ready!
echo .
echo .
echo Please put the file that will contains the hidden file and the file that will be hidden in the HideAFile folder.

IF EXIST textcolorgreen Color 2
IF EXIST textcolorblue Color 1
IF EXIST textcolorred Color 4
IF EXIST textcolorpurple Color 5
IF NOT EXIST configs.txt goto :createconfigs

:createconfigs

type nul > config.txt

pause

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
:choice2
set /P c2=What Do You Want To Do ? [ 1 = Exit / 2 = Recover A File ]
if /I "%c2%" EQU "1" exit
if /I "%c2%" EQU "2" goto :recover
goto :choice2


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

:settings

set /P set1=What Do You Want To Do ? [ 1 = Change text color / ]
if /I "%set1%" EQU "1" goto :colorchange

goto :settings

:colorchange

set /P c10=Wich Color ? [ 1 = Green / 2 = Blue / 3 = Red / 4 = Purple / 5 = White ]
if /I "%c10%" EQU "1" goto :greencolor
if /I "%c10%" EQU "2" goto :bluecolor
if /I "%c10%" EQU "3" goto :redcolor
if /I "%c10%" EQU "4" goto :purplecolor
if /I "%c10%" EQU "5" goto :whitecolor

:greencolor

Color 2
rem echo {[textcolor = Green]}> config.txt
IF EXIST textcolorblue del /F textcolorblue
IF EXIST textcolorred del /F textcolorred
IF EXIST textcolorpurple del /F textcolorpurple
type nul > textcolorgreen
goto :choice

:bluecolor

Color 1
IF EXIST textcolorgreen del /F textcolorgreen
IF EXIST textcolorred del /F textcolorred
IF EXIST textcolorprple del /F textcolorpurple
type nul > textcolorblue
goto :choice

:redcolor

Color 4
IF EXIST textcolorgreen del /F textcolorgreen
IF EXIST textcolorblue del /F textcolorblue
IF EXIST textcolorpurple del /F textcolorpurple
type nul > textcolorred
goto :choice

:purplecolor

Color 5
IF EXIST textcolorgreen del /F textcolorgreen
IF EXIST textcolorblue del /F textcolorblue
IF EXIST textcolorred del /F textcolorred
type nul > textcolorpurple
goto :choice

:whitecolor

Color 7
IF EXIST textcolorgreen del /F textcolorgreen
IF EXIST textcolorblue del /F textcolorblue
IF EXIST textcolorred del /F textcolorred
IF EXIST textcolorpurple del /F textcolorpurple
goto :choice



:choice3
set /P c3=What Do You Want To Do ? [ 1 = Exit / 2 = Hide A File ]
if /I "%c3%" EQU "1" exit
if /I "%c3%" EQU "2" goto :start
goto :choice3
pause

