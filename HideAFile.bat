@echo off
title HideAFile
echo Ready!
echo .
echo .

:choice
set /P c=What Do You Want To Do ? [ 1 = Hide A File / 2 = Recover A File ]
if /I "%c%" EQU "1" goto :start
if /I "%c%" EQU "2" goto :recover
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
:choice3
set /P c3=What Do You Want To Do ? [ 1 = Exit / 2 = Hide A File ]
if /I "%c3%" EQU "1" exit
if /I "%c3%" EQU "2" goto :start
goto :choice3
pause

