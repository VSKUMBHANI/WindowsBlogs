# Commands

Run it in Command Prompt as Administrator

CloseOutlookIMAP is used to Close the Outlook application which is run in the background after closing it.<br>
+==========================+<br>
|Disable Drive Redirection:| reg add "HKLM\SOFTWARE\Microsoft\Terminal Server Client" /v DisableDriveRedirection /t REG_DWORD /d 1 /f<br>
+==========================+<br>
Disable Printer Redirection: reg add "HKLM\SOFTWARE\Microsoft\Terminal Server Client" /v DisablePrinterRedirection /t REG_DWORD /d 1 /f<br>
============================<br>
Enable Admin Share: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f<br>
===================<br>
Query to check if reg entry is there: reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"<br>
=====================================<br>
Delete the reg key: reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy /f<br>
======================================<br>
Hide application from Program and Features: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\(application name)" /v SystemComponent /t REG_DWORD /d 1 /f<br>
=======================================================================================================================================================================<br>
==========================================================================================================================================<br>
"Access Denied" on saving Office documents while not have delete permission<br>
https://support.microsoft.com/en-us/topic/-access-denied-error-message-when-you-save-a-workbook-to-a-unc-share-in-excel-2010-or-excel-2013-4df84394-0cca-a756-436b-9494331218e7<br>
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\General" /v EnableSimpleCopyForSaveToUNC /t REG_DWORD /d 1 /f<br>
===========================================================================================================================================
Add secound in taskbar clock<br>
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f<br>
============================================================================================================================================<br>
Clear Run history...<br>
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f<br>
============================================================================================================================================<br>
Ref Link: https://stackoverflow.com/questions/25736268/how-to-register-a-windows-service-but-avoid-it-being-listed-in-the-services-cons<br>
--------------------------------------------------------------------------------------------------------------------------------------------<br>
Hide the service from Services.msc<br>
sc sdset (name of service) D:(D;;DCLCWPDTSD;;;IU)(D;;DCLCWPDTSD;;;SU)(D;;DCLCWPDTSD;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)<br>
--------------------------------------------------------------------------------------------------------------------------------------------<br>
Restore the service from Services.msc<br>
sc sdset (name of service) D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)<br>
=========================================================================================<br>
