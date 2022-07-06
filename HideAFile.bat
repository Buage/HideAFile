@echo off
title HideAFile
echo Ready!
echo Put This File In The Path Where Is Your File To Hide
echo .
echo .
echo If You Want To Hide A Folder , You Need To Zip It!
echo .
echo .
echo WARNING : WE RECOMMEND THAT YOU PUT THE FILES THAT WILL BE HIDDEN IN A COMPRESSED FOLDER
:start

echo .
echo .
echo What is the name of the file that contains the hidden file?

set /p File=
echo .
echo .
echo What is the name of the file that you want to hide?
set /p File To Hide=
echo The %File% file will hide the %File Tp Hide% file!
timeout 1
echo Hidding
copy /b %File% + %File To Hide%
echo File Hidden !
del %File To Hide%
echo .
echo .
echo To Recover The File , Open A Command Prompt And Type That :
echo .
echo .
echo cd C:\Access path of the file that contains the cache file
echo .
echo .
echo ren %File% %File To Hide%
echo .
echo .
echo Thanks For Using My Tool !
cd C:\
pause


