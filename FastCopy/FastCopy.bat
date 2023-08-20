:: Incremental Backup Job with FastCopy
:: Download and Install FastCopy in C:\ProgramFiles\FastCopy from the official website. https://fastcopy.jp/
:: Download and Install mailsend-go in same to FastCopy installed directory.
::
setlocal
set LogPath=C:\Program Files\FastCopy\Log\
set LogFileExt=.log
set LogFileName=Backup%LogFileExt%
::use set MyLogFile=%date:~4% instead to remove the day of the week
set MyLogFile=%date%
set MyLogFile=%MyLogFile:/=-%
set MyLogFile=%LogPath%%MyLogFile%_%LogFileName%

::Note that the quotes are REQUIRED around %MyLogFile% in case it contains a space
If NOT Exist "%MyLogFile%" goto:noseparator
Echo.>>"%MyLogFile%" 2>&1
Echo.===================>>"%MyLogFile%"

:noseparator

::echo.======== Starting Delete ======== >>"%MyLogFile%"
::echo.%Date% >>"%MyLogFile%"
::echo.%Time% >>"%MyLogFile%"

:startbatch

Echo.======== Backup to Destination from Source ========>>"%MyLogFile%"

set SourcePath="Set the Source_Path here.."
set DestPath="Set the Destination_Path here.."

C:\Progra~1\FastCopy\FastCopy.exe /cmd=diff /filelog="%MyLogFile%" /speed=full /error_stop=FALSE /force_close /acl /verify=TRUE /balloon(=FALSE) /exclude="\#recycle\" %SourcePath% /to=%DestPath%

Echo.======== Backup Completed ========>>"%MyLogFile%"
echo.%Date% >>"%MyLogFile%"
echo.%Time% >>"%MyLogFile%"

:: Send E-Mail notifications
set mailsenderdir=C:\Progra~1\FastCopy\mailsend-go
set mailsender=mailsend-go.exe
set smtpsender=sender@gmail.com
set smtpsenderfullname=Backup Notification
set smtpserver=smtp.gmail.com
set smtpport=465
set smtpuser=sender@gmail.com
set smtppwd=your gmail id password
set mailto=yourmailid@gmail.com
set Date=%Date%
set Subject=%Date%_Backup Notification | FastCopy Job

"%mailsenderdir%\%mailsender%" -sub "%Subject%" -smtp %smtpserver% -port %smtpport% -ssl auth -user %smtpuser% -pass %smtppwd% -from "%smtpsender%" -fname %smtpsenderfullname% -to "%mailto%" attach -file "%MyLogFile%" body -file "%MyLogFile%"

endlocal