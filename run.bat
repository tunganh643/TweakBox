@echo off
title TweakBox
mode 120,39
color 0f
setlocal enabledelayedexpansion
setlocal enableextensions
chcp 65001 >nul
systeminfo | findstr /i "Virtualization Enabled In Firmware: Yes" >nul
if %errorlevel% == 0 (set vt=Enabled) else (set vt=Disabled)
%userprofile%\TweakBox\wifi.vbs
for /f "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalmem (set availablemem=%%a) else (set totalmem=%%a)
set totalmem=%totalmem:,=%
set availablemem=%availablemem:,=%
set /a usedmem=totalmem-availablemem
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "del=%%a")
for /f "tokens=2 delims==" %%a in ('wmic path Win32_OperatingSystem get Caption /format:list') do (set os=%%a)
for /f "tokens=2 delims==" %%a in ('wmic path Win32_OperatingSystem get OSArchitecture /format:list') do (set bit=%%a)
for /f "tokens=2 delims==" %%a in ('wmic path softwareLicensingService get Version /format:list') do (set build=%%a)
for /f "tokens=2 delims==" %%a in ('wmic path Win32_OperatingSystem get CSName /format:list') do (set pcname=%%a)
for /f "tokens=2 delims==" %%a in ('wmic csproduct get vendor /format:list') do (set manufacturer=%%a)
for /f "tokens=2 delims==" %%a in ('wmic csproduct get name /format:list') do (set model=%%a)
for /f "tokens=2 delims==" %%a in ('wmic cpu get name /format:list') do (set cpu=%%a)
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfCores /format:list') do (set core=%%a)
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfLogicalProcessors /format:list') do (set processor=%%a)
for /f "tokens=2 delims==" %%a in ('wmic path win32_VideoController get name /format:list') do (set gpu=%%a)
dir %userprofile%\TweakBox\data
if %errorlevel% == 0 (dir %userprofile%\TweakBox\logo.txt) else (md %userprofile%\TweakBox\data & dir %userprofile%\TweakBox\logo.txt)
if %errorlevel% == 0 (goto 0) else (echo                                           ___     __  _        _   __> %userprofile%\TweakBox\logo.txt & echo                                            ^| ^|  ^|^|__ ^|_^|^|_/   ^|_^| /  \\_/>> %userprofile%\TweakBox\logo.txt & echo                                            ^| ^|/\^|^|__ ^| ^|^| \   ^|__^|\__// \>> %userprofile%\TweakBox\logo.txt & goto 0)

:0
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 06 "                          [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Bloatware" & call :color 06 "           [" & call :color 0f " 2" & call :color 06 " ]" & call :color 0f " Network" & call :color 06 "           [" & call :color 0f " 3" & call :color 06 " ]" & echo  Drive
echo.
echo.
call :color 06 "                                     [" & call :color 0f " 4" & call :color 06 " ]" & call :color 0f " Optimize" & call :color 06 "               [" & call :color 0f " 5" & call :color 06 " ]" & echo  Tweak-Fix
echo.
echo.
call :color 06 "                             [" & call :color 0f " 6" & call :color 06 " ]" & call :color 0f " Active" & call :color 06 "            [" & call :color 0f " 7" & call :color 06 " ]" & call :color 0f " Backup" & call :color 06 "            [" & call :color 0f " 8" & call :color 06 " ]" & echo  More
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 04 "                                                      [ X ] Exit"
echo.
echo.
echo Copyright © 2022 by BlazerMC
choice /c 12345678x /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 1
if %o% == 2 goto 2
if %o% == 3 goto 3
if %o% == 4 goto 4
if %o% == 5 goto 5
if %o% == 6 goto 6
if %o% == 7 set p=1 & goto 7
if %o% == 8 goto 8
if %o% == 9 goto exit

:1
cls
echo [0] Back
echo [Z] Restore
echo BASIC                                              ADVANCED
call :color 0f [1]
dir C:\Users\PC\AppData\Local\Packages\Microsoft.3DBuilder_8wekyb3d8bbwe >nul 2>&1
if %errorlevel% == 0 (call :color 0f " 3D Builder" & echo. & call :color 0f [2]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Print3D_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " 3D Print" & echo. & call :color 0f [3]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Microsoft3DViewer_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " 3D Viewer" & echo. & call :color 0f [4]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Paint_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " 3D Paint" & echo. & call :color 0f [5]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsAlarms_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Alarms (Clock)" & echo. & call :color 0f [6]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.BingWeather_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Weather (Bing Weather)" & echo. & call :color 0f [7]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.BingNews_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Microsoft News (Bing News)" & echo. & call :color 0f [8]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsCalculator_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Calculator" & echo. & call :color 0f [9]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsCamera_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Camera (Windows Camera)" & echo. & call :color 0f [10])
if %errorlevel% == 0 (call :color 0f " Cortana" & echo. & call :color 0f [11]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Windows.Photos_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Photos" & echo. & call :color 0f [12]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Feedback Hub" & echo. & call :color 0f [13]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.GetHelp_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Get Help" & echo. & call :color 0f [14]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Getstarted_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Tips and Get Started" & echo. & call :color 0f [15]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsMaps_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Maps (Windows Maps)" & echo. & call :color 0f [16]) else (dir C:\Users\PC\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Mail and Calendar" & echo. & call :color 0f [17]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsNotepad_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Notepad" & echo. & call :color 0f [18]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Paint_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Paint" & echo. & call :color 0f [19]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.YourPhone_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Your Phone (Phone Link)" & echo. & call :color 0f [20]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Sound Recorder (Windows Sound Recorder)" & echo. & call :color 0f [20]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.ZuneMusic_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Groove Music (Media Player)" & echo. & call :color 0f [21]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.ZuneVideo_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Movies TV" & echo. & call :color 0f [22]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.ScreenSketch_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Snip Sketch (Snipping Tools)" & echo. & call :color 0f [23]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Sticky Note (Microsoft Sticky Note)" & echo. & call :color 0f [24]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.MixedReality.Portal_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Mixed Reality Portal" & echo. & call :color 0f [25]) else (dir C:\Users\PC\AppData\Local\Packages\Microsoft.Todos_8wekyb3d8bbwe >nul 2>&1)
if %errorlevel% == 0 (call :color 0f " Microsoft To Do" & echo. & call :color 0f [26]) else (dir C:\Users\PC\AppData\Local\Packages\ >nul 2>&1)
echo                                       [A] All Startup Entries
echo        [29] Microsoft Team            [B] All AppX Packages
echo        [30] Microsoft Store           [C] OEM AppX Packages
echo                                       [D] Widgets (Win 11)
echo                                       [E] Onedrive
echo        [33] Remote Desktop
echo        [34] Xbox App-Extras
echo        [35] Advertising Client
echo        [36] Flipboard
echo        [37] Office
echo        [38] Solitare Collection
echo        [39] Adobe Photoshop Express
echo        [40] Candy Crush
echo        [41] Duolingo
echo        [42] Facebook
echo        [43] Messenger
echo [17] Messaging      [44] Intel Graphics Control Panel
echo        [45] Linkedin
echo [19] MS Edge Stable [46] Mirkat
echo        [47] Speedtest
echo        [48] Spotify
echo        [49] Realtek Audio Control
echo [23] Wallet         [50] Skype
echo [24] People         [51] Twitter
echo [25] Onenote
echo [26] Sway           [53] Lively Wallpaper
echo.
set /p o=^>^> 
if %o% == 0 goto 0
if %o% == 1 powershell "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" & goto 1
if %o% == 2 powershell "Get-AppxPackage *print3d* | Remove-AppxPackage" & goto 1
if %o% == 3 powershell "Get-AppxPackage *3dviewer* | Remove-AppxPackage" & goto 1
if %o% == 4 powershell "Get-AppxPackage *alarms* | Remove-AppxPackage" & goto 1
if %o% == 5 powershell "Get-AppxPackage *bingnews* | Remove-Appxpackage" & goto 1
if %o% == 6 powershell "Get-AppxPackage *bingweather* | Remove-Appxpackage" & goto 1
if %o% == 7 powershell "Get-AppxPackage *calculator* | Remove-AppxPackage" & goto 1
if %o% == 8 powershell "Get-AppxPackage *camera* | Remove-AppxPackage" & goto 1
if %o% == 9 powershell "Get-AppxPackage *photos* | Remove-AppxPackage" & goto 1
if %o% == 10 powershell "Get-AppxPackage *microsoft.549981C3F5F10* | Remove-AppxPackage" & goto 1
if %o% == 11 powershell "Get-AppxPackage *feedbackhub* | Remove-AppxPackage" & goto 1
if %o% == 12 powershell "Get-AppxPackage *gethelp* | Remove-AppxPackage" & goto 1
if %o% == 13 powershell "Get-AppxPackage *getstarted* | Remove-AppxPackage" & goto 1
if %o% == 14 powershell "Get-AppxPackage *maps* | Remove-AppxPackage" & goto 1
if %o% == 15 powershell "Get-AppxPackage *notepad* | Remove-AppxPackage" & goto 1
if %o% == 16 powershell "Get-AppxPackage *mspaint* | Remove-AppxPackage" & goto 1
if %o% == 17 powershell "Get-AppxPackage *messaging* | Remove-AppxPackage" & goto 1
if %o% == 18 powershell "Get-AppxPackage *yourphone* | Remove-AppxPackage" & goto 1
if %o% == 19 powershell "Get-AppxPackage *microsoftedge.stable* | Remove-AppxPackage" & cd %programfiles(x86)%\Microsoft\Edge\Application\8*\Installer & setup --uninstall --force-uninstall --system-level & goto 1
if %o% == 20 powershell "Get-AppxPackage *communicationsapps* | Remove-AppxPackage" & goto 1
if %o% == 21 powershell "Get-AppxPackage *soundrecorder* | Remove-AppxPackage" & goto 1
if %o% == 22 powershell "Get-AppxPackage *stickynotes* | Remove-AppxPackage" & goto 1
if %o% == 23 powershell "Get-AppxPackage *wallet* | Remove-AppxPackage" & goto 1
if %o% == 24 powershell "Get-AppxPackage *people* | Remove-AppxPackage" & goto 1
if %o% == 25 powershell "Get-AppxPackage *onenote* | Remove-AppxPackage" & goto 1
if %o% == 26 powershell "Get-AppxPackage *sway* | Remove-AppxPackage" & goto 1
if %o% == 27 powershell "Get-AppxPackage *screensketch* | Remove-AppxPackage" & goto 1
if %o% == 28 powershell "Get-AppxPackage *mixedreality* | Remove-AppxPackage" & goto 1
if %o% == 29 powershell "Get-AppxPackage *microsoft.teams* | Remove-AppxPackage" & goto 1
if %o% == 30 powershell "Get-AppxPackage *windowsstore* | Remove-AppxPackage" & powershell "Get-AppxPackage *microsoft.storepurchaseapp* | Remove-AppxPackage" & goto 1
if %o% == 31 powershell "Get-AppxPackage *zunemusic* | Remove-AppxPackage" & goto 1
if %o% == 32 powershell "Get-AppxPackage *zunevideo* | Remove-AppxPackage" & goto 1
if %o% == 33 powershell "Get-AppxPackage *remotedesktop* | Remove-AppxPackage" & goto 1
if %o% == 34 powershell "Get-AppxPackage *xboxapp* | Remove-AppxPackage" & powershell "Get-AppxPackage *xboxidentityprovider* | Remove-AppxPackage" & powershell "Get-AppxPackage *xboxgamingoverlay* | Remove-AppxPackage" & powershell "Get-AppxPackage *xbox.tcui* | Remove-AppxPackage" & powershell "Get-AppxPackage *xboxgameoverlay* | Remove-AppxPackage" &  powershell "Get-AppxPackage *xboxspeechtotextoverlay* | Remove-AppxPackage" & goto 1
if %o% == 35 powershell "Get-AppxPackage *advertising.xaml* | Remove-AppxPackage" & powershell "Get-AppxPackage *advertising.xaml_10.1712.5.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage" & powershell "Get-AppxPackage *advertising.xaml_10.1712.5.0_x86__8wekyb3d8bbwe* | Remove-AppxPackage" & goto 1
if %o% == 36 powershell "Get-AppxPackage *flipboard* | Remove-AppxPackage" & goto 1
if %o% == 37 powershell "Get-AppxPackage *officehub* | Remove-AppxPackage" & powershell "Get-AppxPackage *office.desktop* | Remove-AppxPackage" & goto 1
if %o% == 38 powershell "Get-AppxPackage *adobephotoshopexpress* | Remove-AppxPackage" & goto 1
if %o% == 39 powershell "Get-AppxPackage *solitaire* | Remove-AppxPackage" & goto 1
if %o% == 40 powershell "Get-AppxPackage *candycrush* | Remove-AppxPackage" & goto 1
if %o% == 41 powershell "Get-AppxPackage *duolingo* | Remove-AppxPackage" & goto 1
if %o% == 42 powershell "Get-AppxPackage *facebook.facebook* | Remove-AppxPackage" & goto 1
if %o% == 43 powershell "Get-AppxPackage *facebook* | Remove-AppxPackage" & goto 1
if %o% == 44 powershell "Get-AppxPackage *intelgraphicscontrolpanel* | Remove-AppxPackage" & goto 1
if %o% == 45 powershell "Get-AppxPackage *linkedin* | Remove-AppxPackage" & goto 1
if %o% == 46 powershell "Get-AppxPackage *mirkat* | Remove-AppxPackage" & goto 1
if %o% == 47 powershell "Get-AppxPackage *speedtest* | Remove-AppxPackage" & goto 1
if %o% == 48 powershell "Get-AppxPackage *spotify* | Remove-AppxPackage" & goto 1
if %o% == 49 powershell "Get-AppxPackage *realtekaudiocontrol* | Remove-AppxPackage" & goto 1
if %o% == 50 powershell "Get-AppxPackage *skypeapp* | Remove-AppxPackage" & goto 1
if %o% == 51 powershell "Get-AppxPackage *twitter* | Remove-AppxPackage" & goto 1
if %o% == 52 powershell "Get-AppxPackage *microsoft.todo* | Remove-AppxPackage" & goto 1
if %o% == 53 powershell "Get-AppxPackage *livelywallpaper* | Remove-AppxPackage" & goto 1
if %o% == A reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f & reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Run" /va /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /va /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /va /f & goto 1
if %o% == B" takeown /f %programfiles%\WindowsApps\*.* /r /d y /a & rd /s /q "%programfiles%\WindowsApps" & goto 1
if %o% == C" takeown /f %programdata%\Packages\*.* /r /d y /a" & rd /s /q "%programdata%\Packages" & goto 1
if %o% == D" winget uninstall "windows web experience pack" & goto 1
if %o% == E" %windir%\SysWOW64\OneDriveSetup.exe /uninstall & %windir%\System32\OneDriveSetup.exe /uninstall & goto 1
if %o% == Z powershell start-process powershell -verb runas & %userprofile%\TweakBox\default.txt & goto 1
echo Error please try again!! & timeout 2 >nul & goto 1

:2
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Optimize TCP                          ^|
echo  ^|                                            ^|
echo  ^|  [2] Reset Ip                              ^|
echo  ^|                                            ^|
echo  ^|  [3] Wifi Password                         ^|
echo  ^|                                            ^|
echo  ^|  [4] Optimize Ping                         ^|
echo  ^|                                            ^|
echo  ^|  [5] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto tcp
if %o% == 2 cls & ipconfig /all & ipconfig /release & ipconfig /renew & ipconfig /flushdns & ipconfig /registerdns & arp -d * & nbtstat -R & nbtstat -RR & netsh winsock reset & netsh winsock reset proxy & netsh winsock reset catalog & netsh winsock reset %systemdrive%\winsocklog.txt & netsh int ip delete arpcachenetsh int ip reset resettcpip.txt & netsh int ip reset %systemdrive%\tcplog.txt & netsh int ip reset %systemdrive%\resetlog.txt & netsh int ip reset & netsh int ip set dns & netsh int ipv4 reset  & netsh int ipv6 reset & goto 2
if %o% == 3 goto wifipass
if %o% == 4 goto ping
if %o% == 5 goto 0
echo Error please try again!! & timeout 2 >nul & goto 2

:wifipass
cls
echo [0] Back
type %userprofile%\TweakBox\wifi.txt
echo.
set /p o=^>^> 
if %o% == 0 goto 2
echo Error please try again!! & timeout 2 >nul & goto wifipass

:ping
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Pinger                                ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 cls & reg add "hkcr\NetworkProxy" /v V2CSPNodePath /t reg_sz /d "./Vendor/MSFT/NetworkProxy" /f & reg add "hkcr\NetworkProxy" /v WAPNodeProcessor /t reg_sz /d "{FB11047A-4051-4d1d-9DCA-C80C5DF98D70}" /f & reg add "hkcc" /v Mystring /t reg_dword /d 2502173250 /f & reg add "hkcc\System" /v Freemen /t reg_dword /d 20 /f & reg add "hkcc\System" /v MaxLOMChannels /t reg_dword /d 340787200 /f & reg add "hkcu\Network" /v Network_Bandwidth /t reg_dword /d 512 /f & goto ping
if %o% == 2 cls & reg delete "hkcr\NetworkProxy" /v V2CSPNodePath /f & reg delete "hkcr\NetworkProxy" /v WAPNodeProcessor /f & reg delete "hkcc" /v Mystring /f & reg delete "hkcc\System" /v Freemen /f & reg delete "hkcc\System" /v MaxLOMChannels /f & reg delete "hkcu\Network" /v Network_Bandwidth /f & goto ping
if %o% == 3 goto pinger
if %o% == 4 goto 2
echo Error please try again!! & timeout 2 >nul & goto ping

:pinger
cls
echo [0] Back
echo Example: 1.1.1.1, 1.0.0.1,...
echo.
set /p ip=Enter IP: 
if %o% == 0 goto ping
echo.
echo Pinging 10 times...
echo.
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip% | find "TTL="
ping -n 1 %ip%
echo.
pause
goto pinger

:tcp
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Pinger                                ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto etcp
if %o% == 1 goto dtcp
if %o% == 3 goto 2
echo Error please try again!! & timeout 2 >nul & goto tcp

:etcp
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpAckFrequency /t reg_dword /d 1 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpDelAckTicks /t reg_dword /d 0 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TCPNoDelay /t reg_dword /d 1 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v EnableDHCP /t reg_dword /d 1 /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg add "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v MTU /t reg_dword /d 5376 /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ" /v TCPNoDelay /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Parameters" /v IgnoreOSNameValidation /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Parameters\OCMsetup" /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Parameters\setup" /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Setup" /f
reg add "hklm\SOFTWARE\Microsoft\MSMQ\Parameters\Security" /v SecureDSCommunication /t reg_dword /d 0 /f
reg add "hku\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /t reg_dword /d 10 /f
reg add "hku\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /t reg_dword /d 10 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /t reg_dword /d 10 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /t reg_dword /d 10 /f
netsh int tcp set heuristics disabled
netsh int tcp set global chim=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global ec=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global fastopen=enable
netsh int tcp set global fastopenf=enable
netsh int tcp set global hy=enable
netsh int tcp set global no=disabled
netsh int tcp set global ne=disable
netsh int tcp set global ti=disabled
netsh int tcp set supplemental internet con=ctcp
netsh int tcp set supplemental tem=custom icw=10
cls
echo [1] Wifi
echo [2] Ethernet
set /p o=^>^> 
if %o% == 1" netsh int tcp set global au=normal & goto tcp
if %o% == 2" netsh int tcp set global au=restricted & goto tcp
echo Error please try again!! & timeout 2 >nul & goto etcp

:dtcp
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg delete "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpAckFrequency /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg delete "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TcpDelAckTicks /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg delete "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v TCPNoDelay /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg delete "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v EnableDHCP /f
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do reg delete "hklm\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v MTU /f
reg delete "hklm\SOFTWARE\Microsoft\MSMQ" /f
reg delete "hku\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /f
reg delete "hku\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /f
reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /f
reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /f
goto tcp

:3
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                       Drive"
echo.
echo.
call :color 06 "                              [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Optimize Trim" & call :color 06 "                   [" & call :color 0f " 2" & call :color 06 " ]" & echo  Defrag
echo.
echo.
call :color 06 "                                              [" & call :color 0f " 3" & call :color 06 " ]" & echo  Open Disk Management
echo.
echo.
call :color 06 "                                    [" & call :color 0f " 4" & call :color 06 " ]" & call :color 0f " Open Cleaner" & call :color 06 "       [" & call :color 0f " 5" & call :color 06 " ]" & echo  Device Cleanup
call :color 08 "                                                                    v1.2.1"
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 12345bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 fsutil behavior set disabledeletenotify 0 & fsutil behavior set disabledeletenotify NTFS 0 & fsutil behavior set disabledeletenotify ReFS 0 & fsutil behavior set disablelastaccess 1 & fsutil behavior set disable8dot3 1 & fsutil behavior set memoryusage 2 & fsutil behavior set mftzone 2 & goto 3
if %o% == 2 goto defrag
if %o% == 3 diskmgmt & goto 3
if %o% == 4 goto cleaner
if %o% == 5 goto device
if %o% == 6 goto 0
if %o% == 7 goto 0
if %o% == 8 goto exit

:defrag
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                        Defrag"
echo.
echo.
call :color 06 "                              [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Manual Defrag" & call :color 06 "                   [" & call :color 0f " 2" & call :color 06 " ]" & echo  Defrag all drive
echo.
echo.
echo.
call :color 06 "                                                [" & call :color 0f " 3" & call :color 06 " ]" & echo  Open Defragment
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 123bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto manualdefrag
if %o% == 2 cls & defrag a: /o >nul & defrag b: /o >nul & defrag c: /o >nul & defrag d: /o >nul & defrag e: /o >nul & defrag f: /o >nul & defrag g: /o >nul & defrag h: /o >nul & defrag i: /o >nul & defrag j: /o >nul & defrag k: /o >nul & defrag l: /o >nul & defrag m: /o >nul & defrag n: /o >nul & defrag o: /o >nul & defrag p: /o >nul & defrag q: /o >nul & defrag r: /o >nul & defrag s: /o >nul & defrag t: /o >nul & defrag u: /o >nul & defrag v: /o >nul & defrag w: /o >nul & defrag x: /o >nul & defrag y: /o >nul & defrag z: /o >nul & powershell "Get-PhysicalDisk | Format-Table -AutoSize" |findstr "SSD" >nul & if %errorlevel% == 0 (schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable >nul & echo Defrag Drives Successfully!! & timeout 3 >nul & goto defrag) else (schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /enable >nul & echo Defrag Drives Successfully!! & timeout 3 >nul & goto defrag)
if %o% == 3 dfrgui & goto defrag
if %o% == 4 goto 3
if %o% == 5 goto 0
if %o% == 6 goto exit

:manualdefrag
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                    Manual Defrag"
echo.
call :color 08 "                                        Please check your drive is hdd or ssd"
echo.
call :color 08 "                                   If ssd no need to defrag ,if hhd need to defrag"
echo.
echo Drive Available
wmic logicaldisk get name, volumename
set /p o=Enter drive you want to defrag (Ex: C): 
if %o% == 0 goto defrag
defrag %o%: /o >nul
cls
powershell "Get-PhysicalDisk | Format-Table -AutoSize" |findstr "SSD" >nul & if %errorlevel% == 0 (schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /disable >nul & echo Defrag Drives Successfully!! & timeout 3 >nul & goto manualdefrag) else (schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /enable >nul & echo Defrag Drives Successfully!! & timeout 3 >nul & goto manualdefrag)

:cleaner
cls
echo [0] Back
echo CLEANER
echo [1] Temporary files
echo [2] Recent items
echo [3] Browser
echo [4] Run box history
echo [5] Window update history
echo [6] Log files
echo [7] Recycle bin
echo [8] Clipboard items
echo [9] Thumbnail cache
echo [10] File explorer address bar histories
echo [11] File explorer search histories
echo [12] Disk cleanup
echo.
set /p o=^>^> 
if %o% == 0 goto 3
if %o% == 1 goto temp
if %o% == 2 taskkill /f /im explorer.exe & del /s /f /q %appdata%\Microsoft\Windows\Recent\AutomaticDestinations\*.* & del /s /f /q %appdata%\Microsoft\Windows\Recent\CustomDestinations\*.* & del /s /f /q %appdata%\Microsoft\Windows\Recent\*.* & del /s /f /q %appdata%\Microsoft\Office\Recent\*.* & del /f /s /q %userprofile%\recent\*.* & explorer.exe & goto cleaner
if %o% == 3 goto browser
if %o% == 4 reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f & goto cleaner
if %o% == 5 powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,net stop usosvc & net stop wuauserv & del %windir%\SoftwareDistribution\DataStore\Logs\edb.log & del /f /q C:\ProgramData\USOPrivate\UpdateStore\* & net start usosvc & net start wuauserv & UsoClient.exe RefreshSettings' -Verb runAs" & goto cleaner
if %o% == 6 goto log
if %o% == 7 rd /s /q a:\$Recycle.bin & rd /s /q b:\$Recycle.bin & rd /s /q c:\$Recycle.bin & rd /s /q d:\$Recycle.bin & rd /s /q e:\$Recycle.bin & rd /s /q f:\$Recycle.bin & rd /s /q g:\$Recycle.bin & rd /s /q h:\$Recycle.bin & rd /s /q i:\$Recycle.bin & rd /s /q j:\$Recycle.bin & rd /s /q k:\$Recycle.bin & rd /s /q l:\$Recycle.bin & rd /s /q m:\$Recycle.bin & rd /s /q n:\$Recycle.bin & rd /s /q o:\$Recycle.bin & rd /s /q p:\$Recycle.bin & rd /s /q q:\$Recycle.bin & rd /s /q r:\$Recycle.bin & rd /s /q s:\$Recycle.bin & rd /s /q t:\$Recycle.bin & rd /s /q u:\$Recycle.bin & rd /s /q v:\$Recycle.bin & rd /s /q w:\$Recycle.bin & rd /s /q x:\$Recycle.bin & rd /s /q y:\$Recycle.bin & rd /s /q z:\$Recycle.bin & goto cleaner
if %o% == 8 wmic service where "name like '%%cbdhsvc_%%'" call stopservice & wmic service where "name like '%%cbdhsvc_%%'" call startservice & goto cleaner
if %o% == 9 del /f /s /q /a %localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db & goto cleaner
if %o% == 10 reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f & goto cleaner
if %o% == 11 reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f & goto cleaner
if %o% == 12 cleanmgr & goto cleaner
echo Error please try again!! & timeout 2 >nul & goto cleaner

:log
for /f "tokens=*" %%1 in ('wevtutil.exe el') do wevtutil.exe cl "%%1"
cd/
del *.log /a /s /q /f & goto cleaner

:temp
cls
takeown /f %temp% /r /d y /a
takeown /f %windir%\temp /r /d y /a
takeown /f %windir%\prefetch /r /d y /a
deltree /y %windir%\tempor~1
deltree /y %windir%\temp
deltree /y %windir%\tmp
deltree /y %windir%\ff*.tmp
deltree /y %windir%\history
deltree /y %windir%\cookies
deltree /y %windir%\recent
deltree /y %windir%\spool\printers
del %systemdrive%\WIN386.SWP
del %programdata%\BlueStacks\Logs
del %programdata%\BlueStacks\Engine\Android\Logs
del /s /f /q %temp%\*.*
del /s /f /q %windir%\Temp\*.*
del /s /f /q %windir%\Tempor~1\*.*
del /s /f /q %windir%\prefetch\*.*
del /s /f /q %homepath%\Config~1\Temp\*.*
del /s /f /q %localappdata%\cache\*.*
del /s /f /q %localappdata%\OneDrive\cache\*.*
del /s /f /q %localappdata%\Steam\htmlcache\Cache\*.*
del /s /f /q %localappdata%\Steam\htmlcache\Code Cache\*.*
del /s /f /q %localappdata%\Steam\htmlcache\GPUCache\*.*
del /s /f /q %userprofile%\AppData\LocalLow\Intel\ShaderCache\*.*
del /s /f /q %appdata%\ZaloApp\Cache\*.*
del /s /f /q %appdata%\ZaloApp\Code Cache\*.*
del /s /f /q %appdata%\ZaloApp\GPUCache\*.*
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log 
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old 
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %userprofile%\cookies\*.*
del /f /s /q %userprofile%\Local Settings\Temporary Internet Files\*.* 
del /f /s /q %userprofile%\Local Settings\Temp\*.*
rd /s /q %temp%
rd /s /q %windir%\temp
rd /s /q %windir%\prefetch
rd /s /q %windir%\SoftwareDistribution
rd /s /q %homepath%\Config~1\Temp
md %temp%
md %windir%\temp
md %windir%\prefetch
md %windir%\SoftwareDistribution
md %homepath%\Config~1\Temp
goto cleaner

:device
%userprofile%\TweakBox\DeviceCleanup.exe
cls
echo [0] Back
echo Guide
echo 1. Press "Devices" on the top
echo 2. Press "Select All"
echo 3. Press "Devices" again and press "Remove Selected"
echo 4. Done!
set /p o=^>^> 
if %o% == 0 goto cleaner

:browser
cls
echo [0] Back
echo Some cleaners not work with sync account. Choose your browsers have to clean.
echo Cache  Cookie  History  Bookmark  Password  Reset Data
echo  [1]    [8]     [15]      [22]      [27]      [33]     Google Chrome
echo  [2]    [9]     [16]      [23]      [28]      [34]     Microsoft Edge
echo  [3]    [10]    [17]                          [35]     Firefox
echo  [4]    [11]    [18]      [24]      [29]      [36]     Opera
echo  [5]    [12]    [19]      [25]      [30]      [37]     Brave
echo  [6]    [13]    [20]      [26]      [31]      [38]     Internet Explorer
echo  [7]    [14]    [21]                [32]      [39]     Vivaldi
echo.
set /p o=^>^> 
if %o% == 0 goto cleaner
if %o% == 1 taskkill /f /im chrome.exe & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Google\Chrome\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Google\Chrome\User Data\ShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\ShaderCache\*.*">nul 2>&1 & goto browser
if %o% == 2 taskkill /f /im msedge.exe & del /q /f /s "%localappdata%\Microsoft\Edge\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Microsoft\Edge\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Microsoft\Edge\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Microsoft\Edge\User Data\GrShaderCache\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Microsoft\Edge\User Data\ShaderCache\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\ShaderCache\*.*">nul 2>&1 & goto edge
if %o% == 3 taskkill /f /im firefox.exe & rd /s /q "%localappdata%\Mozilla\Firefox\Profiles" & rd /s /q "%userprofile%\Local Settings\Application Data\Mozilla\Firefox\Profiles" & goto browser
if %o% == 4 taskkill /f /im opera.exe & del /q /f /s "%localappdata%\Opera Software\Opera Stable\Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Opera Software\Opera Stable\Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Opera Software\Opera Stable\System Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Opera Software\Opera Stable\System Cache\*.*">nul 2>&1 & del /q /f /s "%appdata%\Opera Software\Opera Stable\Code Cache\*.*">nul 2>&1 & del /q /f /s "%appdata%\Opera Software\Opera Stable\GPUCache\*.*">nul 2>&1 & del /q /f /s "%appdata%\Opera Software\Opera Stable\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%appdata%\Opera Software\Opera Stable\ShaderCache\*.*">nul 2>&1 & goto opera
if %o% == 5 taskkill /f /im brave.exe & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\ShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\ShaderCache\*.*">nul 2>&1 & goto brave
if %o% == 6 taskkill /f /im iexplore.exe & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 & goto browser
if %o% == 7 taskkill /f /im vivaldi.exe & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\Code Cache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\GPUCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Vivaldi\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\GrShaderCache\*.*">nul 2>&1 & del /q /f /s "%localappdata%\Vivaldi\User Data\ShaderCache\*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\ShaderCache\*.*">nul 2>&1 & goto browser
if %o% == 8 taskkill /f /im chrome.exe & del /q /f "%localappdata%\Google\Chrome\User Data\Default\*Cookies*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\*Cookies*.*">nul 2>&1 & goto browser
if %o% == 9 taskkill /f /im msedge.exe & del /q /f "%localappdata%\Microsoft\Edge\User Data\Default\*Cookies*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\*Cookies*.*">nul 2>&1 & goto browser
if %o% == 10 taskkill /f /im firefox.exe & rd /s /q "%localappdata%\Mozilla\Firefox\Profiles" & rd /s /q "%userprofile%\Local Settings\Application Data\Mozilla\Firefox\Profiles" & goto browser
if %o% == 11 taskkill /f /im opera.exe & del /q /f "%appdata%\Opera Software\Opera Stable\*Cookies*.*">nul 2>&1 & goto browser
if %o% == 12 taskkill /f /im brave.exe & del /q /f "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\*Cookies*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\*Cookies*.*">nul 2>&1 & goto browser
if %o% == 13 taskkill /f /im iexplore.exe & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2 & goto browser
if %o% == 14 taskkill /f /im vivaldi.exe & del /q /f "%localappdata%\Vivaldi\User Data\Default\*Cookies*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\*Cookies*.*">nul 2>&1 & goto browser
if %o% == 15 taskkill /f /im chrome.exe & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\*History*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\*History*.*">nul 2>&1 & goto browser
if %o% == 16 taskkill /f /im msedge.exe & del /q /f "%localappdata%\Microsoft\Edge\User Data\Default\*History*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\*History*.*">nul 2>&1 & goto browser
if %o% == 17 taskkill /f /im firefox.exe & del /q /s /f "%localappdata%\Mozilla\Firefox\Profiles" & del /q /s /f "%userprofile%\Local Settings\Application Data\Mozilla\Firefox\Profiles" & goto browser
if %o% == 18 taskkill /f /im opera.exe & del /q /f "%appdata%\Opera Software\Opera Stable\*History*.*">nul 2>&1 & goto browser
if %o% == 19 taskkill /f /im brave.exe & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\*History*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\*History*.*">nul 2>&1 & goto browser
if %o% == 20 taskkill /f /im iexplore.exe & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1 & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16 & goto browser
if %o% == 21 taskkill /f /im vivaldi.exe & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\*History*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\Default\*History*.*">nul 2>&1 & goto browser
if %o% == 22 taskkill /f /im chrome.exe & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\*Bookmarks*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\*Bookmarks*.*">nul 2>&1 & goto browser
if %o% == 23 taskkill /f /im msedge.exe & del /q /f "%localappdata%\Microsoft\Edge\User Data\Default\*Bookmarks*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\*Bookmarks*.*">nul 2>&1 & goto browser
if %o% == 24 taskkill /f /im opera.exe & del /q /f "%appdata%\Opera Software\Opera Stable\*Bookmarks*.*">nul 2>&1 & goto browser
if %o% == 25 taskkill /f /im brave.exe & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\*Bookmarks*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\*Bookmarks*.*">nul 2>&1 & goto browser
if %o% == 26 taskkill /f /im vivaldi.exe & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\*Bookmarks*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\*Bookmarks*.*">nul 2>&1 & goto browser
if %o% == 27 taskkill /f /im chrome.exe & del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\*Login Data*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data\Default\*Login Data*.*">nul 2>&1 & goto browser
if %o% == 28 taskkill /f /im msedge.exe & del /q /f "%localappdata%\Microsoft\Edge\User Data\Default\*Login Data*.*">nul 2>&1 & del /q /f "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data\Default\*Login Data*.*">nul 2>&1 & goto browser
if %o% == 29 taskkill /f /im opera.exe & del /q /f "%appdata%\Opera Software\Opera Stable\*Login Data*.*">nul 2>&1 & goto browser
if %o% == 30 taskkill /f /im brave.exe & del /q /f /s "%localappdata%\BraveSoftware\Brave-Browser\User Data\Default\*Login Data*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\BraveSoftware\Brave-Browser\User Data\Default\*Login Data*.*">nul 2>&1 & goto browser
if %o% == 31 taskkill /f /im iexplore.exe & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32 & goto browser
if %o% == 32 taskkill /f /im vivaldi.exe & del /q /f /s "%localappdata%\Vivaldi\User Data\Default\*Login Data*.*">nul 2>&1 & del /q /f /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data\Default\*Login Data*.*">nul 2>&1 & goto browser
if %o% == 33 taskkill /f /im chrome.exe & rd /q /s "%localappdata%\Google\Chrome\User Data" & rd /q /s "%userprofile%\Local Settings\Application Data\Google\Chrome\User Data" & goto browser
if %o% == 34 taskkill /f /im msedge.exe & rd /q /s "%localappdata%\Microsoft\Edge\User Data" & rd /q /s "%userprofile%\Local Settings\Application Data\Microsoft\Edge\User Data" & goto browser
if %o% == 35 taskkill /f /im firefox.exe & del /q /s /f "%appdata%\Mozilla\Firefox\Profiles" & goto browser
if %o% == 36 taskkill /f /im opera.exe & rd /q /s "%localappdata%\Opera Software\Opera Stable" & rd /q /s "%appdata%\Opera Software\Opera Stable" & goto browser
if %o% == 37 taskkill /f /im brave.exe & rd /q /s "%localappdata%\BraveSoftware\Brave-Browser\User Data" & rd /q /s "%userprofile%\Local Settings\Application\BraveSoftware\Brave-Browser\User Data" & goto browser
if %o% == 38 taskkill /f /im iexplore.exe & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255 & RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351 & goto browser
if %o% == 39 taskkill /f /im vivaldi.exe & rd /q /s "%localappdata%\Vivaldi\User Data" & rd /q /s "%userprofile%\Local Settings\Application Data\Vivaldi\User Data" & goto browser
echo Error please try again!! & timeout 2 >nul & goto browser

:4
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Keyboard - Mouse                      ^|
echo  ^|                                            ^|
echo  ^|  [2] Resolution - Delay                    ^|
echo  ^|                                            ^|
echo  ^|  [3] CPU                                   ^|
echo  ^|                                            ^|
echo  ^|  [4] GPU                                   ^|
echo  ^|                                            ^|
echo  ^|  [5] RAM                                   ^|
echo  ^|                                            ^|
echo  ^|  [6] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto keymou
if %o% == 2 goto resolution
if %o% == 3 goto cpu
if %o% == 4 goto gpu
if %o% == 5 goto ram
if %o% == 6 goto 0
echo Error please try again!! & timeout 2 >nul & goto 4

:keymou
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Filter Keys Setter                    ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto ekeymou
if %o% == 2 goto dkeymou
if %o% == 3 goto filterkeysetter
if %o% == 4 goto 0
echo Error please try again!! & timeout 2 >nul & goto keymou

:filterkeysetter
%userprofile%\TweakBox\FilterKeysSetter.exe
cls
echo [0] Back
echo Guide
echo 1. At "Settings" tab
echo 2. Choose "Ignore quick keystrokes and/or set the repeat rate"
echo 3. Then set:
echo  + Ignore under 0 ms
echo  + Repeat delay 150 ms
echo  + Repeat rate  25 ms
echo 4. At "Flags" tab
echo    Check:
echo  + On
echo  + Avalible
echo 5. Done!
echo.
set /p o=^>^> 
if %o% == 0 goto keymou
echo Error please try again!! & timeout 2 >nul & goto filterkeysetter

:ekeymou
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseSpeed /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseThreshold1 /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseThreshold2 /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseSensitivity /t reg_sz /d 10 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickHeight /t reg_sz /d 4 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickWidth /t reg_sz /d 4 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickSpeed /t reg_sz /d 500 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SnapToDefaultButton /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SwapMouseButtons /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v ActiveWindowTracking /t reg_dword /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SmoothMouseXCurve /t reg_binary /d "0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000" /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SmoothMouseYCurve /t reg_binary /d "0000000000000000000038000000000000007000000000000000A800000000000000E00000000000" /f
reg add "hkcu\Control Panel\Mouse" /v MouseSpeed /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseThreshold1 /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseThreshold2 /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseTrails /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseSensitivity /t reg_sz /d 10 /f
reg add "hkcu\Control Panel\Mouse" /v SnapToDefaultButton /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v SwapMouseButtons /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverHeight /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverWidth /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverTime /t reg_sz /d 8 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickHeight /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickWidth /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickSpeed /t reg_sz /d 500 /f
reg add "hkcu\Control Panel\Mouse" /v ActiveWindowTracking /t reg_dword /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v Beep /t reg_sz /d "No" /f
reg add "hkcu\Control Panel\Mouse" /v ExtendedSounds /t reg_sz /d "No" /f
reg add "hkcu\Control Panel\Mouse" /v SmoothMouseXCurve /t reg_binary /d "0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000" /f
reg add "hkcu\Control Panel\Mouse" /v SmoothMouseYCurve /t reg_binary /d "0000000000000000000038000000000000007000000000000000A800000000000000E00000000000" /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsolutePointerAsAbsolute /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsoluteAsRelative /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyBoardDataQueueSize /t reg_dword /d 16 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v PollStatusIterations /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v MouseDataQueueSize /t reg_dword /d 16 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t reg_dword /d 16 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v ThreadPriority /t reg_dword /d 31 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v WppRecorder_TraceGuid /t reg_sz /d "{fc8df8fd-d105-40a9-af75-2eec294adf8d}" /f
reg add "hkcu\Control Panel\Accessibility\ToggleKeys" /v Flags /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\StickyKeys" /v Flags /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\MouseKeys" /v Flags /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v Flags /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v BounceTime /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Desktop" /v LogPixels /t reg_dword /d 120 /f
reg add "hkcu\Control Panel\Desktop" /v Win8DpiScaling /t reg_dword /d 0 /f
reg add "hkcu\Control Panel\Keyboard" /v InitialKeyboardIndicators /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Keyboard" /v KeyboardDelay /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Keyboard" /v KeyboardSpeed /t reg_sz /d 31 /f
reg add "hku\.DEFAULT\Control Panel\Keyboard" /v KeyboardDelay /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Keyboard" /v KeyboardSpeed /t reg_sz /d 31 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PP_MCLKStutterModeThreshold /t reg_dword /d 30000 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorUpdateInterval /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v IRRemoteNavigationDelta /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v AttractionRectInsetInDIPS /t reg_dword /d 5 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v DistanceThresholdInDIPS /t reg_dword /d 40 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismDelayInMilliseconds /t reg_dword /d 50 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismUpdateIntervalInMilliseconds /t reg_dword /d 16 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v VelocityInDIPSPerSecond /t reg_dword /d 360 /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v AppStarting /t reg_expand_sz /d "%SystemRoot%\cursors\aero_working.ani" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Arrow /t reg_expand_sz /d "%SystemRoot%\cursors\aero_arrow.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Crosshair /t reg_expand_sz /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Hand /t reg_expand_sz /d "%SystemRoot%\cursors\aero_link.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Help /t reg_expand_sz /d "%SystemRoot%\cursors\aero_helpsel.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v IBeam /t reg_expand_sz /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v No /t reg_expand_sz /d "%SystemRoot%\cursors\aero_unavail.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v NWPen /t reg_expand_sz /d "%SystemRoot%\cursors\aero_pen.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Scheme Source /t reg_dword /d 2 /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeAll /t reg_expand_sz /d "%SystemRoot%\cursors\aero_move.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNESW /t reg_expand_sz /d "%SystemRoot%\cursors\aero_nesw.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNS /t reg_expand_sz /d "%SystemRoot%\cursors\aero_ns.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNWSE /t reg_expand_sz /d "%SystemRoot%\cursors\aero_nwse.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeWE /t reg_expand_sz /d "%SystemRoot%\cursors\aero_we.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v UpArrow /t reg_expand_sz /d "%SystemRoot%\cursors\aero_up.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Wait /t reg_expand_sz /d "%SystemRoot%\cursors\aero_busy.cur" /f
goto keymou

:dkeymou
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseSpeed /t reg_sz /d 1 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseThreshold1 /t reg_sz /d 6 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseThreshold2 /t reg_sz /d 10 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v MouseSensitivity /t reg_sz /d 10 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickHeight /t reg_sz /d 4 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickWidth /t reg_sz /d 4 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v DoubleClickSpeed /t reg_sz /d 500 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SnapToDefaultButton /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SwapMouseButtons /t reg_sz /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v ActiveWindowTracking /t reg_dword /d 0 /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SmoothMouseXCurve /t reg_binary /d "0000000000000000156e000000000000004001000000000029dc0300000000000000280000000000" /f
reg add "hku\.DEFAULT\Control Panel\Mouse" /v SmoothMouseYCurve /t reg_binary /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
reg add "hkcu\Control Panel\Mouse" /v MouseSpeed /t reg_sz /d 1 /f
reg add "hkcu\Control Panel\Mouse" /v MouseThreshold1 /t reg_sz /d 6 /f
reg add "hkcu\Control Panel\Mouse" /v MouseThreshold2 /t reg_sz /d 10 /f
reg add "hkcu\Control Panel\Mouse" /v MouseTrails /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v SnapToDefaultButton /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v SwapMouseButtons /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverHeight /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverWidth /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickHeight /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickWidth /t reg_sz /d 4 /f
reg add "hkcu\Control Panel\Mouse" /v DoubleClickSpeed /t reg_sz /d 500 /f
reg add "hkcu\Control Panel\Mouse" /v MouseHoverTime /t reg_sz /d 400 /f
reg add "hkcu\Control Panel\Mouse" /v MouseSensitivity /t reg_sz /d 10 /f
reg add "hkcu\Control Panel\Mouse" /v ActiveWindowTracking /t reg_dword /d 0 /f
reg add "hkcu\Control Panel\Mouse" /v Beep /t reg_sz /d "No" /f
reg add "hkcu\Control Panel\Mouse" /v ExtendedSounds /t reg_sz /d "No" /f
reg add "hkcu\Control Panel\Mouse" /v SmoothMouseXCurve /t reg_binary /d "0000000000000000156e000000000000004001000000000029dc0300000000000000280000000000" /f
reg add "hkcu\Control Panel\Mouse" /v SmoothMouseYCurve /t reg_binary /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsolutePointerAsAbsolute /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsoluteAsRelative /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyBoardDataQueueSize /t reg_dword /d 100 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v PollStatusIterations /t reg_dword /d 12000 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters" /v MouseDataQueueSize /t reg_dword /d 132 /f
reg delete "hklm\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /f
reg add "hkcu\Control Panel\Accessibility\ToggleKeys" /v Flags /t reg_sz /d 34 /f
reg add "hkcu\Control Panel\Accessibility\StickyKeys" /v Flags /t reg_sz /d 482 /f
reg add "hkcu\Control Panel\Accessibility\MouseKeys" /v Flags /t reg_sz /d 62 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v Flags /t reg_sz /d 98 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v BounceTime /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t reg_sz /d 0 /f
reg delete "hkcu\Control Panel\Desktop" /v LogPixels /f
reg add "hkcu\Control Panel\Desktop" /v Win8DpiScaling /t reg_dword /d 0 /f
reg add "hkcu\Control Panel\Keyboard" /v InitialKeyboardIndicators /t reg_sz /d 0 /f
reg add "hkcu\Control Panel\Keyboard" /v KeyboardDelay /t reg_sz /d 1 /f
reg add "hkcu\Control Panel\Keyboard" /v KeyboardSpeed /t reg_sz /d 31 /f
reg add "hku\.DEFAULT\Control Panel\Keyboard" /v KeyboardDelay /t reg_sz /d 1 /f
reg add "hku\.DEFAULT\Control Panel\Keyboard" /v KeyboardSpeed /t reg_sz /d 31 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PP_MCLKStutterModeThreshold /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorSensitivity /t reg_dword /d 100 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v CursorUpdateInterval /t reg_dword /d 5 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v IRRemoteNavigationDelta /t reg_dword /d 10 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v AttractionRectInsetInDIPS /t reg_dword /d 5 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v DistanceThresholdInDIPS /t reg_dword /d 40 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismDelayInMilliseconds /t reg_dword /d 50 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v MagnetismUpdateIntervalInMilliseconds /t reg_dword /d 16 /f
reg add "hklm\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v VelocityInDIPSPerSecond /t reg_dword /d 360 /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v AppStarting /t reg_expand_sz /d "%SystemRoot%\cursors\aero_working.ani" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Arrow /t reg_expand_sz /d "%SystemRoot%\cursors\aero_arrow.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Crosshair /t reg_expand_sz /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Hand /t reg_expand_sz /d "%SystemRoot%\cursors\aero_link.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Help /t reg_expand_sz /d "%SystemRoot%\cursors\aero_helpsel.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v IBeam /t reg_expand_sz /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v No /t reg_expand_sz /d "%SystemRoot%\cursors\aero_unavail.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v NWPen /t reg_expand_sz /d "%SystemRoot%\cursors\aero_pen.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Scheme Source /t reg_dword /d 2 /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeAll /t reg_expand_sz /d "%SystemRoot%\cursors\aero_move.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNESW /t reg_expand_sz /d "%SystemRoot%\cursors\aero_nesw.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNS /t reg_expand_sz /d "%SystemRoot%\cursors\aero_ns.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeNWSE /t reg_expand_sz /d "%SystemRoot%\cursors\aero_nwse.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v SizeWE /t reg_expand_sz /d "%SystemRoot%\cursors\aero_we.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v UpArrow /t reg_expand_sz /d "%SystemRoot%\cursors\aero_up.cur" /f
reg add "hku\.DEFAULT\Control Panel\Cursors" /v Wait /t reg_expand_sz /d "%SystemRoot%\cursors\aero_busy.cur" /f
goto keymou

:resolution
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Time Resolution v1.2                  ^|
echo  ^|                                            ^|
echo  ^|  [4] Timer Tool v3                         ^|
echo  ^|                                            ^|
echo  ^|  [5] Change Screen Resolution              ^|
echo  ^|                                            ^|
echo  ^|  [6] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 reg add "hkcu\Control Panel\Desktop" /v AutoEndTasks /t reg_sz /d 1 /f & reg add "hkcu\Control Panel\Desktop" /v MenuShowDelay /t reg_sz /d 8 /f & reg add "hkcu\Control Panel\Desktop" /v WaitToKillAppTimeout /t reg_sz /d 1000 /f & reg add "hkcu\Control Panel\Desktop" /v HungAppTimeout /t reg_sz /d 1000 /f & reg add "hkcu\Control Panel\Desktop" /v LowLevelHooksTimeout /t reg_sz /d 1000 /f & reg add "hkcu\Control Panel\Desktop" /v ForegroundLockTimeout /t reg_dword /d 0 /f & reg add "hkcu\Control Panel\Desktop" /v WaitToKillServiceTimeout /t reg_dword /d 4096 /f & reg add "HKC\.DEFAULT\Control Panel\Desktop" /v AutoEndTasks /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t reg_sz /d 1000 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NoLazyMode /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v AlwaysOn /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t reg_dword /d 4294967295 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ExtendedUIHoverTime /t reg_dword /d 0 /f & goto resolution
if %o% == 2 reg delete "hkcu\Control Panel\Desktop" /v AutoEndTasks /f & reg delete "hkcu\Control Panel\Desktop" /v WaitToKillAppTimeout /f & reg delete "hkcu\Control Panel\Desktop" /v HungAppTimeout /f & reg delete "hkcu\Control Panel\Desktop" /v LowLevelHooksTimeout /f\ & reg delete "hkcu\Control Panel\Desktop" /v WaitToKillServiceTimeout /f & reg add "hkcu\Control Panel\Desktop" /v MenuShowDelay /t reg_sz /d 400 /f & reg add "hkcu\Control Panel\Desktop" /v ForegroundLockTimeout /t reg_dword /d 200000 /f & reg delete "hku\.DEFAULT\Control Panel\Desktop" /v AutoEndTasks /f & reg delete "hklm\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /f & reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NoLazyMode /f & reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v AlwaysOn /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t reg_dword /d 10 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t reg_dword /d 20 /f & reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ExtendedUIHoverTime /f & goto resolution
if %o% == 3 goto timeresolution
if %o% == 4 goto timertool
if %o% == 5 goto screenresolution
if %o% == 6 goto 0
echo Error please try again!! & timeout 2 >nul & goto resolution

:timeresolution
%userprofile%\TweakBox\TimerResolution.exe
cls
echo [0] Back
echo Guide
echo 1. Press "Maximum"
echo 2. To turn default press "Default"
echo 3. Then press "Close"
echo 4. Done!
echo.
set /p o=^>^> 
if %o% == 0 goto resolution
echo Error please try again!! & timeout 2 >nul & goto timeresolution

:timertool
%userprofile%\TweakBox\TimerTool.exe
cls
echo [0] Back
echo Guide
echo 1. Change timer at "Modify Timer"
echo 2. Then press "Set Timer"
echo 3. To turn default press "Unset Timer"
echo 4. Done!
echo.
set /p o=^>^> 
if %o% == 0 goto resolution
echo Error please try again!! & timeout 2 >nul & goto timertool

:screenresolution
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] 16 : 10                               ^|
echo  ^|                                            ^|
echo  ^|  [2] 16 : 9                                ^|
echo  ^|                                            ^|
echo  ^|  [3] 4 : 3                                 ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto ratio1610
if %o% == 2 goto ratio169
if %o% == 3 goto ratio43
if %o% == 4 goto 0

:ratio1610
cls
echo [0] Back
echo.
echo Choose resolution:
echo.
echo [1] 2560 × 1600
echo [2] 1920 × 1200
echo [3] 1680 × 1050
echo [4] 1440 × 900
echo [5] 1280 × 800
echo.
set /p o=^>^> 
if %o% == 0 goto screenresolution
if %o% == 1 %userprofile%\TweakBox\QRes.exe /x:2560 /y:1600 & goto ratio1610
if %o% == 2 %userprofile%\TweakBox\QRes.exe /x:1920 /y:1200 & goto ratio1610
if %o% == 3 %userprofile%\TweakBox\QRes.exe /x:1680 /y:1050 & goto ratio1610
if %o% == 4 %userprofile%\TweakBox\QRes.exe /x:1440 /y:900 & goto ratio1610
if %o% == 5 %userprofile%\TweakBox\QRes.exe /x:1280 /y:800 & goto ratio1610

:ratio169
cls
echo [0] Back
echo.
echo Choose resolution:
echo.
echo [1] 2560 x 1440
echo [2] 1920 x 1080
echo [3] 1600 x 900
echo [4] 1366 x 768
echo [5] 1280 x 720
echo [6] 1024 x 576
echo [7] 960 x 540
echo.
set /p o=^>^> 
if %o% == 0 goto screenresolution
if %o% == 1 %userprofile%\TweakBox\QRes.exe /x:2560 /y:1440 & goto ratio169
if %o% == 2 %userprofile%\TweakBox\QRes.exe /x:1920 /y:1080 & goto ratio169
if %o% == 3 %userprofile%\TweakBox\QRes.exe /x:1600 /y:900 & goto ratio169
if %o% == 4 %userprofile%\TweakBox\QRes.exe /x:1366 /y:768 & goto ratio169
if %o% == 5 %userprofile%\TweakBox\QRes.exe /x:1280 /y:720 & goto ratio169
if %o% == 6 %userprofile%\TweakBox\QRes.exe /x:1024 /y:576 & goto ratio169
if %o% == 7 %userprofile%\TweakBox\QRes.exe /x:960 /y:540 & goto ratio169

:ratio43
cls
echo [0] Back
echo.
echo Choose resolution:
echo.
echo [1] 3200 x 2400
echo [2] 2048 x 1536
echo [3] 1152 x 864
echo [4] 1024 x 768
echo [5] 800 x 600
echo.
set /p o=^>^> 
if %o% == 0 goto screenresolution
if %o% == 1 %userprofile%\TweakBox\QRes.exe /x:3200 /y:2400 & goto ratio43
if %o% == 2 %userprofile%\TweakBox\QRes.exe /x:2048 /y:1536 & goto ratio43
if %o% == 3 %userprofile%\TweakBox\QRes.exe /x:1152 /y:864 & goto ratio43
if %o% == 4 %userprofile%\TweakBox\QRes.exe /x:1024 /y:768 & goto ratio43
if %o% == 5 %userprofile%\TweakBox\QRes.exe /x:800 /y:600 & goto ratio43

:ram
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Clean Memory                          ^|
echo  ^|                                            ^|
echo  ^|  [2] Vitural Memory                        ^|
echo  ^|                                            ^|
echo  ^|  [3] Stop Services-Tasks                   ^|
echo  ^|                                            ^|
echo  ^|  [4] Background Apps                       ^|
echo  ^|                                            ^|
echo  ^|  [5] Hyper-V                               ^|
echo  ^|                                            ^|
echo  ^|  [6] Windows Memory Diagnostic             ^|
echo  ^|                                            ^|
echo  ^|  [7] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 %userprofile%\TweakBox\EmptyStandbyList.exe workingsets & %userprofile%\TweakBox\EmptyStandbyList.exe modifiedpagelist & %userprofile%\TweakBox\EmptyStandbyList.exe standbylist & %userprofile%\TweakBox\EmptyStandbyList.exe priority0standbylist & goto ram
if %o% == 2 goto vmem
if %o% == 3 goto services
if %o% == 4 goto backapps
if %o% == 5 goto hyperv
if %o% == 6 mdsched & goto ram
if %o% == 7 goto 0
echo Error please try again!! & timeout 2 >nul & goto ram

:vmem
set v=1
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto setmem
if %o% == 2 reg delete "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SwapfileControl /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 0 0" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 3670016 /f & reg delete "hklm\SOFTWARE\Intel\GMM" /f & goto vmemory
if %o% == 3 goto ram
echo Error please try again!! & timeout 2 >nul & goto vmem

:setmem
cls
echo Waiting a few minutes...
reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SwapfileControl /t reg_dword /d 0 /f >nul
systeminfo | findstr /c:"Total Physical Memory" | findstr 1, >nul
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 1536 3072" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 1048576 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 2, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 3072 6144" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 2097152 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 3, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 6144 12288" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 4194304 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 4, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 6144 12288" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 4194304 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 5, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 3072 3072" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 6291456 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 6, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 3072 3072" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 6291456 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 296 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 7, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 4096 4096" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 8388608 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 8, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 4096 4096" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 8388608 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 9, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 5120 5120" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 10485760 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 10, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 5120 5120" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 10485760 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 11, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 6144 6144" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 12582912 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 12, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 6144 6144" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 12582912 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 15, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 16777216 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 16, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 16777216 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 19, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 20971520 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 20, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 20971520 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 598 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 23, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 25165824 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 24, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 25165824 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 31, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 33554432 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 32, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 33554432 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 63, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 67108864 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (systeminfo | findstr /c:"Total Physical Memory" | findstr 64, >nul)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "%systemdrive%\pagefile.sys 8192 8192" /f & reg add "hklm\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t reg_dword /d 67108864 /f & reg add "hklm\SOFTWARE\Intel\GMM" /v DedicatedSegmentSize /t reg_dword /d 1298 /f & goto vfinish) else (goto verror)

:vfinish
cls
echo Set Vitural Memory Successfully!!
timeout 3 >nul
goto vmem

:services
sc stop Browser
sc config Browser start=disabled
sc stop CscService
sc config CscService start=disabled
sc stop diagsvc
sc config diagsvc start=disabled
sc stop DiagTrack
sc config DiagTrack start=disabled
sc stop DoSvc
sc config DoSvc start=disabled
sc stop DsSvc
sc config DsSvc start=disabled
sc stop EntAppSvc
sc config EntAppSvc start=disabled
sc stop Fax
sc config Fax start=disabled
sc stop fhsvc
sc config fhsvc start=disabled
sc stop FontCache
sc config FontCache start=disabled
sc stop FontCache3.0.0.0
sc config FontCache3.0.0.0 start=disabled
sc stop HomeGroupListener
sc config HomeGroupListener start=disabled
sc stop HomeGroupProvider
sc config HomeGroupProvider start=disabled
sc stop icssvc
sc config icssvc start=disabled
sc stop lfsvc
sc config lfsvc start=disabled
sc stop MapsBroker
sc config MapsBroker start=disabled
sc stop MessagingService
sc config MessagingService start=disabled
sc stop MixedRealityOpenXRSvc
sc config MixedRealityOpenXRSvc start=disabled
sc stop PcaSvc
sc config PcaSvc start=disabled
sc stop PhoneSvc
sc config PhoneSvc start=disabled
sc stop PrintNotify
sc config PrintNotify start=disabled
sc stop RemoteRegistry
sc config RemoteRegistry start=disabled
sc stop RetailDemo
sc config RetailDemo start=disabled
sc stop seclogon
sc config seclogon start=disabled
sc stop SEMgrSvc
sc config SEMgrSvc start=disabled
sc stop SessionEnv
sc config SessionEnv start=disabled
sc stop shpamsvc
sc config shpamsvc start=disabled
sc stop Spooler
sc config Spooler start=disabled
sc stop StiSvc
sc config StiSvc start=disabled
sc stop SysMain
sc config SysMain start=disabled
sc stop TermService
sc config TermService start=disabled
sc stop tzautoupdate
sc config tzautoupdate start=disabled
sc stop UmRdpService
sc config UmRdpService start=disabled
sc stop vmicvss
sc config vmicvss start=disabled
sc stop vmictimesync
sc config vmictimesync start=disabled
sc stop vmicrdv
sc config vmicrdv start=disabled
sc stop vmicvmsession
sc config vmicvmsession start=disabled
sc stop vmicheartbeat
sc config vmicheartbeat start=disabled
sc stop vmicshutdown
sc config vmicshutdown start=disabled
sc stop vmicguestinterface
sc config vmicguestinterface start=disabled
sc stop vmickvpexchange
sc config vmickvpexchange start=disabled
sc stop WalletService
sc config WalletService start=disabled
sc stop WpcMonSvc
sc config WpcMonSvc start=disabled
sc stop wcncsvc 
sc config wcncsvc start=disabled
sc stop WbioSrvc
sc config WbioSrvc start=disabled
sc stop WSearchIdxPi
sc config WSearchIdxPi start=disabled
sc stop WSearch
sc config WSearch start=disabled
sc stop W32Time
sc config W32Time start=disabled
sc stop WerSvc
sc config WerSvc start=disabled
sc stop Wecsvc
sc config Wecsvc start=disabled
sc config GraphicsPerfSvc start=disabled
sc config GpuEnergyDrv start=disabled
sc config Ndu start=disabled
sc config PrintWorkflowUserSvc start=disabled
sc stop wuauserv
sc config wuauserv start=disabled
sc stop SysMain
sc config SysMain start=disabled
sc config Psched start=system
sc config iaStorV start=boot
schtasks /Change /TN "\Microsoft\Windows\Maps\MapsUpdateTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Maps\MapsToastTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable
goto ram

:backapp
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Default)                      ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Optimize)                    ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t reg_dword /d 1 /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_UserInControlOfTheseApps /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_ForceAllowTheseApps /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_ForceDenyTheseApps /f & goto backapp
if %o% == 2 reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t reg_dword /d 2 /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_UserInControlOfTheseApps /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_ForceAllowTheseApps /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground_ForceDenyTheseApps /f & goto backapp
if %o% == 3 goto ram
echo Error please try again!! & timeout 2 >nul & goto backapp

:hyperv
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Default)                      ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Optimize)                    ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 powershell Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor -All & DISM /Online /Disable-Feature /All /FeatureName:Microsoft-Hyper-V & bcdedit /set hypervisorlaunchtype off & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v EnableVirtualizationBasedSecurity /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v RequirePlatformSecurityFeatures /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v HypervisorEnforcedCodeIntegrity /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v LsaCfgFlags /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v HVCIMATRequired /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v ConfigureSystemGuardLaunch /t reg_dword /d 2 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags /t reg_dword /d 0 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v RequireMicrosoftSignedBootChain /t reg_dword /d 0 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" /v HypervisorEnforcedCodeIntegrity /t reg_dword /d 0 /f & reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v WasEnabledBy /t reg_dword /d 0 /f & reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t reg_dword /d 0 /f & goto hyperv
if %o% == 2 powershell Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All & DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V & bcdedit /set hypervisorlaunchtype on & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /f & reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v RequireMicrosoftSignedBootChain /t reg_dword /d 1 /f & reg delete "hklm\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios" /v HypervisorEnforcedCodeIntegrity /f & reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v WasEnabledBy /f & reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t reg_dword /d 1 /f & goto hyperv
if %o% == 3 goto ram
echo Error please try again!! & timeout 2 >nul & goto hyperv

:cpu
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Second Data Level Cache               ^|
echo  ^|                                            ^|
echo  ^|  [2] Power Options                         ^|
echo  ^|                                            ^|
echo  ^|  [3] Cpu Unpark                            ^|
echo  ^|                                            ^|
echo  ^|  [4] Priority                              ^|
echo  ^|                                            ^|
echo  ^|  [5] Power Throttling                      ^|
echo  ^|                                            ^|
echo  ^|  [6] Optimize Optional Feature             ^|
echo  ^|                                            ^|
echo  ^|  [7] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto core
if %o% == 2 goto poweroption
if %o% == 3 goto unpark
if %o% == 4 goto priority
if %o% == 5 goto powerthrottling
if %o% == 6 goto optionalfeature
if %o% == 7 goto 0
echo Error please try again!! & timeout 2 >nul & goto cpu

:priority
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Optimize                              ^|
echo  ^|                                            ^|
echo  ^|  [2] Games                                 ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto opriority
if %o% == 2 goto game
if %o% == 3 goto cpu
echo Error please try again!! & timeout 2 >nul & goto priority

:opriority
reg add "hklm\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t reg_dword /d 38 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ8Priority /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ16Priority /t reg_dword /d 2 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ4294967286Priority /t reg_dword /d 2 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\PriorityControl" /v IRQ4294967287Priority /t reg_dword /d 3 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\Print" /v PriorityClass /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\Print" /v PortThreadPriority /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t reg_sz /d "False" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v BackgroundPriority /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t reg_dword /d 6 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t reg_sz /d "High" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t reg_sz /d "High" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v Priority /t reg_dword /d 2 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Background Only" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v Priority /t reg_dword /d 5 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Capture" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v BackgroundPriority /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v Priority /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t reg_sz /d "High" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Latency Sensitive" /t reg_sz /d "True" /f 
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Background Only" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v Priority /t reg_dword /d 4 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Distribution" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Background Only" /t reg_sz /d "False" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v BackgroundPriority /t reg_dword /d 4 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v Priority /t reg_dword /d 3 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Playback" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Background Only" /t reg_sz /d "False" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v Priority /t reg_dword /d 1 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "Scheduling Category" /t reg_sz /d "High" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Background Only" /t reg_sz /d "True" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v Priority /t reg_dword /d 5 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Window Manager" /v "SFIO Priority" /t reg_sz /d "Normal" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v Affinity /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t reg_sz /d "False" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v BackgroundPriority /t reg_dword /d 0 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t reg_dword /d 10000 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t reg_dword /d 8 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v Priority /t reg_dword /d 2 /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t reg_sz /d "Medium" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t reg_sz /d "High" /f
reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t reg_sz /d "True" /f 
goto priority

:game
cls
echo [0] Back
echo OPTIMIZE  RESTORE  
echo   [1]      [4]    Minecraft
echo   [2]      [5]    Miniworld
echo   [3]      [6]    Bluestack
echo.
set /p o=^>^> 
if %o% == 0 goto priority
if %o% == 1 reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v CpuPriorityClass /t reg_dword /d 3 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v UseLargePages /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\java.exe\PerfOptions" /v CpuPriorityClass /t reg_dword /d 3 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\java.exe\PerfOptions" /v UseLargePages /t reg_dword /d 1 /f & goto game
if %o% == 2 reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iworldpc3.exe\PerfOptions" /v CpuPriorityClass /t reg_dword /d 3 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iworldpc3.exe\PerfOptions" /v UseLargePages /t reg_dword /d 1 /f & goto game
if %o% == 3 reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v CpuPriorityClass /t reg_dword /d 3 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v UseLargePages /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Bluestacks.exe\PerfOptions" /v CpuPriorityClass /t reg_dword /d 3 /f & reg add "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Bluestacks.exe\PerfOptions" /v UseLargePages /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\BlueStacks_nxt" /v FPS /t reg_dword /d 144 /f & goto game
if %o% == 4 reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\java.exe" /f & goto game
if %o% == 5 reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\iworldpc3.exe" /f & goto game
if %o% == 6 reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Bluestacks.exe" /f & goto game
echo Error please try again!! & timeout 2 >nul & goto game

:unpark
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Unpark (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Park (Default)                        ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 reg add "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t reg_dword /d 0 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMin /t reg_dword /d 0 /f & goto unpark
if %o% == 2 reg add "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t reg_dword /d 100 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMin /t reg_dword /d 0 /f & goto unpark
if %o% == 3 goto cpu
echo Error please try again!! & timeout 2 >nul & goto unpark

:powerthrottling
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Disable (Optimize)                    ^|
echo  ^|                                            ^|
echo  ^|  [2] Enable (Default)                      ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 reg add "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t reg_dword /d 1 /f & goto powerthrottling
if %o% == 2 reg delete "hklm\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /f & goto powerthrottling
if %o% == 3 goto cpu
echo Error please try again!! & timeout 2 >nul & goto powerthrottling

:core
set v=2
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto setcore
if %o% == 2 reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 1 /f & goto core
if %o% == 3 goto cpu
echo Error please try again!! & timeout 2 >nul & goto core

:setcore
wmic cpu get name | findstr i3 
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 8264 /f & goto cfinish) else (wmic cpu get name | findstr Ryzen 3)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 8264 /f & goto cfinish) else (wmic cpu get name | findstr i5)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 4132 /f & goto cfinish) else (wmic cpu get name | findstr Ryzen 5)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 4132 /f & goto cfinish) else (wmic cpu get name | findstr i7)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 1298 /f & goto cfinish) else (wmic cpu get name | findstr Ryzen 7)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 1298 /f & goto cfinish) else (wmic cpu get name | findstr i9)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 598 /f & goto cfinish) else (wmic cpu get name | findstr Ryzen 9)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t reg_dword /d 598 /f & goto cfinish) else (goto error)

:cfinish
cls
echo Set Second Data Level Cache Successfully!!
timeout 3 >nul
goto core

:poweroption
cls
echo [0] Back
echo [1] Open Power Options
echo ADD  REMOVE
echo [2]   [8]    Utilmate performance
echo [3]   [9]    High performance
echo [4]   [10]   Balanced
echo [5]   [11]   Power saver
echo ENABLE  DISABLE
echo  [6]     [12]   Hibernate
echo  [7]     [13]   Fast Startup
echo.
set /p o=^>^> 
if %o% == 0 goto cpu
if %o% == 1 %windir%\system32\control.exe /name Microsoft.PowerOptions & goto poweroption
if %o% == 2 powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 & goto poweroption
if %o% == 3 powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c & goto poweroption
if %o% == 4 powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e & goto poweroption
if %o% == 5 powercfg -duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a & goto poweroption
if %o% == 6 powercfg /h on & goto poweroption
if %o% == 7 reg add "hklm\SYSTEM\CurrentControlSet\Control\Power" /v HiberbootEnabledDefault /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Power" /v HiberbootEnabled /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\System" /v HiberbootEnabled /t reg_dword /d 1 /f & goto poweroption
if %o% == 8 powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61 & goto poweroption
if %o% == 9 powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c & goto poweroption
if %o% == 10 powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e & goto poweroption
if %o% == 11 powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a & goto poweroption
if %o% == 12 powercfg /h off & goto poweroption
if %o% == 13 reg add "hklm\SYSTEM\CurrentControlSet\Control\Power" /v HiberbootEnabledDefault /t reg_dword /d 0 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Power" /v HiberbootEnabled /t reg_dword /d 0 /f & reg add "hklm\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\System" /v HiberbootEnabled /t reg_dword /d 0 /f & goto poweroption
echo Error please try again!! & timeout 2 >nul & goto poweroption

:optionalfeature
powershell Enable-WindowsOptionalFeature -Online -FeatureName "SearchEngine-Client-Package"
powershell Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"
powershell Enable-WindowsOptionalFeature -Online -FeatureName "NetFx4-AdvSrvs"
powershell Enable-WindowsOptionalFeature -Online -FeatureName "WCF-Services45"
powershell Enable-WindowsOptionalFeature -Online -FeatureName "WCF-TCP-PortSharing45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "Windows-Defender-Default-Definitions"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "NetFx4Extended-ASPNET45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-HTTP-Activation45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-TCP-Activation45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-Pipe-Activation45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-MSMQ-Activation45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-LoggingLibraries"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-RequestMonitor"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpTracing"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-URLAuthorization"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-IPSecurity"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-Performance"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpCompressionDynamic"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerManagementTools"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ManagementScriptingTools"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-IIS6ManagementCompatibility"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-Metabase"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerRole"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServer"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-CommonHttpFeatures"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpErrors"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpRedirect"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ApplicationDevelopment"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-Security"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-RequestFiltering"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-NetFxExtensibility"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-NetFxExtensibility45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HealthAndDiagnostics"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpLogging"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-HTTP-Activation"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WCF-NonHTTP-Activation"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-StaticContent"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-DefaultDocument" 
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-DirectoryBrowsing"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebDAV"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebSockets"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ApplicationInit"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ISAPIFilter"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ISAPIExtensions"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ASPNET"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ASPNET45"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ASP"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-CGI"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ServerSideIncludes"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-CustomLogging"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-BasicAuthentication"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-HttpCompressionStatic"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ManagementConsole"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-ManagementService"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WMICompatibility"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-LegacyScripts"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-LegacySnapIn"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-FTPServer"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-FTPSvc"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "IIS-FTPExtensibility"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MediaPlayback"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "IIS-HostableWebCore"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "LegacyComponents"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "WindowsMediaPlayer"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-Container"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-DCOMProxy"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-Server"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-HTTP"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-Multicast" 
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSMQ-Triggers"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "DirectPlay"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-PrintToPDFServices-Features"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-XPSServices-Features"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-Foundation-Features"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-Foundation-InternetPrinting-Client"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-Foundation-LPDPrintService"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Printing-Foundation-LPRPortMonitor"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "MSRDC-Infrastructure"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "SimpleTCP"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "SMB1Protocol"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "SMB1Protocol-Client"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "SMB1Protocol-Server"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "SMB1Protocol-Deprecation"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "TelnetClient"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "TFTP"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "VirtualMachinePlatform"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "HypervisorPlatform"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "Windows-Identity-Foundation"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowspowershellV2Root"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowspowershellV2"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WAS-WindowsActivationService"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WAS-ProcessModel"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WAS-NetFxEnvironment"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "WAS-ConfigurationAPI"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "Client-ProjFS"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "Microsoft-Windows-Subsystem-Linux"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "TIFFIFilter"
powershell Disable-WindowsOptionalFeature -Online –FeatureName "WorkFolders-Client"
powershell Disable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-amd64"
goto cpu

:gpu
set v=3
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable (Optimize)                     ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (Default)                     ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto egpu
if %o% == 2 goto dgpu
if %o% == 3 goto 0
echo Error please try again!! & timeout 2 >nul & goto gpu

:egpu
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmGpsPsEnablePerCpuCoreDpc /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PreferSystemMemoryContiguous /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DpiMapIommuContiguous /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyActivelyUsed /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyIdleNoContext /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultLatencyToleranceIdle0 /t reg_dword /d 1000 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ForceDirectFlip /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t reg_dword /d 2 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v VsyncIdleTimeout /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorLatencyTolerance /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorRefreshLatencyTolerance /t reg_dword /d 0 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RmGpsPsEnablePerCpuCoreDpc /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyActivelyUsed /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleLongTime /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleMonitorOff /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleNoContext /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleShortTime /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleVeryLongTime /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle0 /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle0MonitorOff /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle1 /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle1MonitorOff /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceMemory /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceNoContext /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceNoContextMonitorOff /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceOther /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceTimerPeriod /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceActivelyUsed /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceMonitorOff /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceNoContext /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v Latency /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MaxIAverageGraphicsLatencyInOneBucket /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MiracastPerfTrackGraphicsLatency /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MonitorLatencyTolerance /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MonitorRefreshLatencyTolerance /t reg_dword /d 1 /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v TransitionLatency /t reg_dword /d 1 /f
wmic path win32_VideoController get name | findstr Intel
if %errorlevel% == 0 (goto gpu) else (wmic path win32_VideoController get name | findstr AMD)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Services\amdkmdap\Parameters" /v ThreadPriority /t reg_dword /d 31 /f & goto gpu) else (wmic path win32_VideoController get name | findstr NVIDIA)
if %errorlevel% == 0 (reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v RmGpsPsEnablePerCpuCoreDpc /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisablePreemption /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisableCudaContextPreemption /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisableWriteCombining /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v RmGpsPsEnablePerCpuCoreDpc /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v RmGpsPsEnablePerCpuCoreDpc /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID61684 /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v ThreadPriority /t reg_dword /d 31 /f & %userprofile%\TweakBox\gpu nvidia.reg & goto gpu) else (goto error)

:dgpu
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmGpsPsEnablePerCpuCoreDpc /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PreferSystemMemoryContiguous /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DpiMapIommuContiguous /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyActivelyUsed /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyIdleNoContext /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultLatencyToleranceIdle0 /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ForceDirectFlip /f
reg add "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t reg_dword /d 2 /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /f
reg delete "hklm\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorLatencyTolerance /f
reg delete "hklm\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorRefreshLatencyTolerance /f
reg delete "hklm\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /f
wmic path win32_VideoController get name | findstr Intel
if %errorlevel% == 0 (goto gpu) else (wmic path win32_VideoController get name | findstr AMD)
if %errorlevel% == 0 (reg delete "hklm\SYSTEM\CurrentControlSet\Services\amdkmdap\Parameters" /f & goto gpu) else (wmic path win32_VideoController get name | findstr NVIDIA)
if %errorlevel% == 0 (reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v RmGpsPsEnablePerCpuCoreDpc /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisablePreemption /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisableCudaContextPreemption /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisableWriteCombining /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID61684 /f & reg delete "hklm\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /f & goto gpu) else (goto error)

:6
set v=4
set i=1
set x=%windir%\system32
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Window                                ^|
echo  ^|                                            ^|
echo  ^|  [2] Office                                ^|
echo  ^|                                            ^|
echo  ^|  [3] Minecraft Bedrock                     ^|
echo  ^|                                            ^|
echo  ^|  [4] Remove Window Active Watermark        ^|
echo  ^|                                            ^|
echo  ^|  [5] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 goto wcheck
if %o% == 2 goto ocheck
if %o% == 3 cls & takeown /f %windir%\system32\Windows.ApplicationModel.Store.dll & icacls %windir%\system32\Windows.ApplicationModel.Store.dll /grant administrators:f /t & takeown /f %windir%\syswow64\Windows.ApplicationModel.Store.dll & icacls %windir%\syswow64\Windows.ApplicationModel.Store.dll /grant administrators:f /t & del /s /f /q %windir%\system32\Windows.ApplicationModel.Store.dll & del /s /f /q %windir%\syswow64\Windows.ApplicationModel.Store.dll & copy %userprofile%\TweakBox\Active\Minecraft Bedrock\system32\Windows.ApplicationModel.Store.dll %windir%\system32 & copy %userprofile%\TweakBox\Active\Minecraft Bedrock\syswow64\Windows.ApplicationModel.Store.dll %windir%\syswow64 & goto 6
if %o% == 4 reg add "hkcu\Control Panel\Desktop" /v PaintDesktopVersion /t reg_dword /d 0 /f & taskkill /f /im explorer.exe & explorer.exe & goto 8
if %o% == 5 goto 0
echo Error please try again!! & timeout 2 >nul & goto 8

:wcheck
cls
cscript //nologo %x%\slmgr.vbs /xpr |findstr "permanently" >nul
if %errorlevel% == 0 (echo Windows Have Activated!! & timeout 3 >nul & goto 8) else (
cscript //nologo %x%\slmgr.vbs /upk >nul
cscript //nologo %x%\slmgr.vbs /ckms >nul
cscript //nologo %x%\slmgr.vbs /cpky >nul
wmic path Win32_OperatingSystem get Caption |findstr "11" >nul
if %errorlevel% == 0 (goto w10) else (wmic path Win32_OperatingSystem get Caption |findstr "10" >nul)
if %errorlevel% == 0 (goto w10) else (wmic path Win32_OperatingSystem get Caption |findstr "8" >nul)
if %errorlevel% == 0 (goto w8) else (wmic path Win32_OperatingSystem get Caption |findstr "7" >nul)
if %errorlevel% == 0 (goto w7) else (goto error)
)

:w10
cls
wmic os | findstr /I "enterprise" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul||cscript //nologo %x%\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul||cscript //nologo %x%\slmgr.vbs /ipk YYVX9-NTFWV-6MDM3-9PT4T-4M68B >nul||cscript //nologo %x%\slmgr.vbs /ipk 44RPN-FTY23-9VTTB-MP9BX-T84FV >nul||cscript //nologo %x%\slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul||cscript //nologo %x%\slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul||cscript //nologo %x%\slmgr.vbs /ipk DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ >nul||cscript //nologo %x%\slmgr.vbs /ipk QFFDN-GRT3P-VKWWX-X7T3R-8B639 >nul||cscript //nologo %x%\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D >nul||cscript //nologo %x%\slmgr.vbs /ipk 92NFX-8DJQP-P6BBQ-THF9C-7CG2H >nul & goto kms) else wmic os | findstr /I "home" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul||cscript //nologo %x%\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul||cscript //nologo %x%\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul||cscript //nologo %x%\slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul||cscript //nologo %x%\slmgr.vbs /ipk BT79Q-G7N6G-PGBYW-4YWX6-6F4BT >nul & goto kms) else wmic os | findstr /I "education" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul||cscript //nologo %x%\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul & goto kms) else wmic os | findstr /I "pro" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul||cscript //nologo %x%\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul||cscript //nologo %x%\slmgr.vbs /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J >nul||cscript //nologo %x%\slmgr.vbs /ipk 9FNHH-K3HBT-3W4TD-6383H-6XYWF >nul||cscript //nologo %x%\slmgr.vbs /ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y >nul||cscript //nologo %x%\slmgr.vbs /ipk YVWGF-BXNMC-HTQYQ-CPQ99-66QFC >nul & goto kms) else wmic os | findstr /I "server" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk 4DWFP-JF3DJ-B7DTH-78FJB-PDRHK >nul||cscript //nologo %x%\slmgr.vbs /ipk 22XQ2-VRXRG-P8D42-K34TD-G3QQC >nul||cscript //nologo %x%\slmgr.vbs /ipk 7M67G-PC374-GR742-YH8V4-TCBY3 >nul||cscript //nologo %x%\slmgr.vbs /ipk RCTX3-KWVHP-BR6TB-RB6DM-6X7HP >nul||cscript //nologo %x%\slmgr.vbs /ipk 39BXF-X8Q23-P2WWT-38T2F-G3FPG >nul||cscript //nologo %x%\slmgr.vbs /ipk YQGMW-MPWTJ-34KDK-48M3W-X4Q6V >nul||cscript //nologo %x%\slmgr.vbs /ipk W7VD6-7JFBR-RX26B-YKQ3Y-6FFFJ >nul||cscript //nologo %x%\slmgr.vbs /ipk TM24T-X9RMF-VWXK6-X8JC9-BFGM2 >nul||cscript //nologo %x%\slmgr.vbs /ipk WYR28-R7TFJ-3X2YQ-YCY4H-M249D >nul||cscript //nologo %x%\slmgr.vbs /ipk GT63C-RJFQ3-4GMB6-BRFB9-CB83V >nul||cscript //nologo %x%\slmgr.vbs /ipk 74YFP-3QFB3-KQT8W-PMXWJ-7M648 >nul||cscript //nologo %x%\slmgr.vbs /ipk 489J6-VHDMP-X63PK-3K798-CPX3Y >nul||cscript //nologo %x%\slmgr.vbs /ipk YC6KT-GKW9T-YTKYR-T4X34-R7VHC >nul||cscript //nologo %x%\slmgr.vbs /ipk TT8MH-CG224-D3D7Q-498W2-9QCTX >nul||cscript //nologo %x%\slmgr.vbs /ipk 6TPJF-RBVHG-WBW2R-86QPH-6RTM4 >nul||cscript //nologo %x%\slmgr.vbs /ipk 48HP8-DN98B-MYWDG-T2DCC-8W83P >nul||cscript //nologo %x%\slmgr.vbs /ipk XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G >nul||cscript //nologo %x%\slmgr.vbs /ipk HM7DN-YVMH3-46JC3-XYTG7-CYQJJ >nul||cscript //nologo %x%\slmgr.vbs /ipk XC9B7-NBPP2-83J2H-RHMBY-92BT4 >nul||cscript //nologo %x%\slmgr.vbs /ipk 4K36P-JN4VD-GDC6V-KDT89-DYFKP >nul||cscript //nologo %x%\slmgr.vbs /ipk 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ >nul||cscript //nologo %x%\slmgr.vbs /ipk 8N2M2-HWPGY-7PGT9-HGDD8-GVGGY >nul||cscript //nologo %x%\slmgr.vbs /ipk BN3D2-R7TKB-3YPBD-8DRP2-27GG4 >nul||cscript //nologo %x%\slmgr.vbs /ipk KNC87-3J2TX-XB4WP-VCPJV-M4FWM >nul||cscript //nologo %x%\slmgr.vbs /ipk W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9 >nul||cscript //nologo %x%\slmgr.vbs /ipk D2N9P-3P6X9-2R39C-7RTCD-MDVJX >nul||cscript //nologo slmgr /ipk JCKRF-N37P4-C2D82-9YXRT-4M63B >nul||cscript //nologo slmgr /ipk WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY >nul||cscript //nologo slmgr /ipk CB7KF-BWN84-R7R2Y-793K2-8XDDG >nul||cscript //nologo %x%\slmgr.vbs /ipk WVDHN-86M7X-466P6-VHXV7-YY726 >nul||cscript //nologo %x%\slmgr.vbs /ipk N69G4-B89J2-4G8F4-WWYCC-J464C >nul||cscript //nologo %x%\slmgr.vbs /ipk WMDGN-G9PQG-XVVXX-R3X43-63DFG >nul||cscript //nologo %x%\slmgr.vbs /ipk DPCNP-XQFKJ-BJF7R-FRC8D-GF6G4 >nul||cscript //nologo %x%\slmgr.vbs /ipk 6Y6KB-N82V8-D8CQV-23MJW-BWTG6 >nul||cscript //nologo %x%\slmgr.vbs /ipk PTXN8-JFHJM-4WC78-MPCBR-9W4KR >nul||cscript //nologo %x%\slmgr.vbs /ipk 2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG >nul||cscript //nologo %x%\slmgr.vbs /ipk N2KJX-J94YW-TQVFB-DG9YT-724CC >nul||cscript //nologo %x%\slmgr.vbs /ipk 6NMRW-2C8FM-D24W7-TQWMY-CWH2D >nul & goto kms) else (goto error)
)

:w8
cls
wmic os | findstr /I "enterprise" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 >nul||cscript //nologo %x%\slmgr.vbs /ipk TT4HM-HN7YT-62K67-RGRQJ-JFFXW >nul||cscript //nologo %x%\slmgr.vbs /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7 >nul||cscript //nologo %x%\slmgr.vbs /ipk JMNMF-RHW7P-DMY6X-RF3DR-X2BQT >nul & goto kms) else wmic os | findstr /I "pro" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk GCRJD-8NW9H-F2CDX-CCM8D-9D6T9 >nul||cscript //nologo %x%\slmgr.vbs /ipk HMCNV-VVBFX-7HMBH-CTY9B-B4FXY >nul||cscript //nologo %x%\slmgr.vbs /ipk 789NJ-TQK6T-6XTH8-J39CJ-J8D3P >nul||cscript //nologo %x%\slmgr.vbs /ipk NG4HW-VH26C-733KW-K6F98-J8CK4 >nul||cscript //nologo %x%\slmgr.vbs /ipk XCVCF-2NXM9-723PB-MHCB7-2RYQQ >nul||cscript //nologo %x%\slmgr.vbs /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG >nul||cscript //nologo %x%\slmgr.vbs /ipk BB6NG-PQ82V-VRDPW-8XVD2-V8P66 >nul & goto kms) else (cscript //nologo %x%\slmgr.vbs /ipk M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK >nul||cscript //nologo %x%\slmgr.vbs /ipk 7B9N3-D94CG-YTVHR-QBPX3-RJP64 >nul||cscript //nologo %x%\slmgr.vbs /ipk BB6NG-PQ82V-VRDPW-8XVD2-V8P66 >nul||cscript //nologo %x%\slmgr.vbs /ipk BN3D2-R7TKB-3YPBD-8DRP2-27GG4 >nul||cscript //nologo %x%\slmgr.vbs /ipk 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ >nul||goto error)
)

:w7
cls
wmic os | findstr /I "enterprise" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH >nul||cscript //nologo %x%\slmgr.vbs /ipk YDRBP-3D83W-TY26F-D46B2-XCKRJ >nul||cscript //nologo %x%\slmgr.vbs /ipk C29WB-22CC8-VJ326-GHFJW-H9DH4 >nul & goto kms) else wmic os | findstr /I "pro" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4 >nul||cscript //nologo %x%\slmgr.vbs /ipk MRPKT-YTG23-K7D7T-X2JMM-QY7MG >nul||cscript //nologo %x%\slmgr.vbs /ipk W82YF-2Q76Y-63HXB-FGJG9-GF7QX >nul & goto kms) else wmic os | findstr /I "utilmate" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk MVYTY-QP8R7-6G6WG-87MGT-CRH2P >nul||cscript //nologo %x%\slmgr.vbs /ipk MM7DF-G8XWM-J2VRG-4M3C4-GR27X >nul||cscript //nologo %x%\slmgr.vbs /ipk RGQ3V-MCMTC-6HP8R-98CDK-VP3FM >nul||cscript //nologo %x%\slmgr.vbs /ipk 7YWX9-W3C2V-D46GW-P722P-9CP4D >nul & goto kms) else wmic os | findstr /I "starter" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk 2V3W2-JXTTR-28RD8-R228D-KR69C >nul||cscript //nologo %x%\slmgr.vbs /ipk 2K8WH-JVQDM-C9HVC-YR2XC-8M76G >nul||cscript //nologo %x%\slmgr.vbs /ipk 22P26-HD8YH-RD96C-28R8J-DCT28 >nul||cscript //nologo %x%\slmgr.vbs /ipk 273P4-GQ8V6-97YYM-9YTHF-DC2VP >nul & goto kms) else wmic os | findstr /I "home" >nul
if %errorlevel% == 0 (cscript //nologo %x%\slmgr.vbs /ipk 6RBBT-F8VPQ-QCPVQ-KHRB8-RMV82 >nul||cscript //nologo %x%\slmgr.vbs /ipk 38JTJ-VBPFW-XFQDR-PJ794-8447M >nul||cscript //nologo %x%\slmgr.vbs /ipk 4FG99-BC3HD-73CQT-WMF7J-3Q6C9 >nul||cscript //nologo %x%\slmgr.vbs /ipk 4G3GR-J6JDJ-D96PV-T9B9D-M8X2Q >nul||cscript //nologo %x%\slmgr.vbs /ipk 2V36J-4RK8B-GW27Q-4DXPG-RQP78 >nul||cscript //nologo %x%\slmgr.vbs /ipk 22MFQ-HDH7V-RBV79-QMVK9-PTMXQ >nul||cscript //nologo %x%\slmgr.vbs /ipk 239PK-QV6BM-6BX3V-KH2BD-R3VTY >nul||cscript //nologo %x%\slmgr.vbs /ipk 2RDPF-PTCT2-DR237-KD8JY-VH2M7 >nul||cscript //nologo slmgr /ipk 2Q4QP-8P4MD-47YBP-7TXX9-FKDRM >nul & goto kms) else (goto error)
)

:kms
cls
if %i% == 1 set kms=kms7.MSGuides.com
if %i% == 2 set kms=kms8.MSGuides.com
if %i% == 3 set kms=kms9.MSGuides.com
if %i% == 4 set kms=kms.srv.crsoo.com
if %i% == 5 set kms=s8.now.im
if %i% == 6 set kms=s9.now.im
if %i% == 7 set kms=s8.uk.to
if %i% == 8 set kms=s9.us.to
if %i% == 9 set kms=sv9.uk.to
if %i% == 10 goto wcheck
cscript //nologo %x%\slmgr.vbs /skms %kms% >nul
cscript //nologo %x%\slmgr.vbs /ato >nul & set /a i+=1 & goto kms

:error
cls
echo Error! Please try again later..
timeout 3 >nul
if %v% == 1 goto vmem
if %v% == 2 goto core
if %v% == 3 goto gpu
if %v% == 4 goto 8

:ocheck
cls
if exist "%programfiles%\Microsoft Office\Office14" cd %programfiles%\Microsoft Office\Office14
if exist "%programfiles%\Microsoft Office\Office15" cd %programfiles%\Microsoft Office\Office15
if exist "%programfiles%\Microsoft Office\Office16" cd %programfiles%\Microsoft Office\Office16
cscript //nologo ospp.vbs /dstatus |findstr "LICENSED" >nul
if %errorlevel% == 0 (echo Office Have Activated!! & timeout 3 >nul & goto 8) else (cscript //nologo ospp.vbs /unpkey:6F7TH >nul||cscript //nologo ospp.vbs /unpkey:WFG99 >nul||cscript //nologo ospp.vbs /unpkey:DRTFM >nul||cscript //nologo ospp.vbs /unpkey:BTDRB >nul||cscript //nologo ospp.vbs /unpkey:CPQVG >nul||cscript //nologo ospp.vbs /unpkey:6MWKP >nul & cscript //nologo ospp.vbs /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB >nul||cscript //nologo ospp.vbs /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT >nul||cscript //nologo ospp.vbs /inpkey:FN8TT-7WMH6-2D4X9-M337T-2342K >nul||cscript //nologo ospp.vbs /inpkey:KBKQT-2NMXY-JJWGP-M62JB-92CD4 >nul||cscript //nologo ospp.vbs /inpkey:C2FG9-N6J68-H8BTJ-BW3QX-RM3B3 >nul||cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul||cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul||cscript //nologo ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH >nul & goto okms)

:okms
if %i% == 1 set kms=kms7.MSGuides.com
if %i% == 2 set kms=kms8.MSGuides.com
if %i% == 3 set kms=kms9.MSGuides.com
if %i% == 4 set kms=kms.srv.crsoo.com
if %i% == 5 set kms=s8.now.im
if %i% == 6 set kms=s9.now.im
if %i% == 7 set kms=s8.uk.to
if %i% == 8 set kms=s9.us.to
if %i% == 9 set kms=sv9.uk.to
if %i% == 10 set kms=kms.lotro.cc
if %i% == 11 set kms=ug-kms.uni-goettingen.de
if %i% == 12 goto ocheck
cscript //nologo ospp.vbs /setprt:1688 >nul
cscript //nologo ospp.vbs /sethst %kms% >nul
cscript //nologo ospp.vbs /act >nul & set /a i+=1 & goto okms

:5
mode 150,50
cls
echo [0] Back
call :color 09 "File explorer                    Desktop                             Window 11                    Other"
echo.
echo [1] Show hidden files            [22] Meetnow icon                   [49] Classic context menu    [68] Gpedit window home
echo [2] Thumbnail preview            [23] Taskview icon                  [50] Classic start menu      [69] Fix full disk
echo [3] File extensions              [24] Chat icon                      [51] Classic ribbon          [70] Fix system corrupts
echo [4] Recent files                 [25] Search icon                    [52] Quick action menu       [71] Fix time
echo [5] Online tips                  [26] Cortana icon                   [53] Reset quick action menu [72] Fix microsoft store
echo [6] Compact view                 [27] Widget icon                    [54] Drag drop files         [73] User account control
echo [7] Preview handlers             [28] Widget                                                      [74] Webcam notification
echo [8] Sync provider notification   [29] Seconds in clock               WINDOW UPDATE
echo [9] File explorer search history [30] Shortcut arrow                 [55] Windows update          NAVIGATION
echo [10] Window search history       [31] Snap window                    [56] Drivers update          [75] 3D Object
echo [11] Clipboard history           [32] Action center                  [57] App auto update         [76] Desktop
echo [12] Location opening            [33] Snipping tool                  [58] Bypass update window 11 [77] Documents
echo [13] Open folder window          [34] Taskbar icon size              [59] Update notification     [78] Downloads
echo [14] Fix file explorer lag       [35] Transparent effect             [60] Fix window update       [79] Music
echo [15] Open god mode               [36] Lock screen                                                 [80] Pictures
echo                                  [37] Accent color app border        GAMING                       [81] Videos
echo CONTEXT MENU                     [38] Accent color start,taskbar     [61] Xbox services           [82] Libraries
echo [16] Takeownership               [39] Systems dark theme             [62] Game mode               [83] Quick Access
echo [17] Empty recycle bin           [40] Apps dark theme                [63] Game bar                [84] Favorites
echo                                                                      [64] Game DVR                [85] Onedrive
echo PIN APP THIS PC                  VISUAL EFFECT                       [65] Fix xbox login          [86] Removable Drives
echo [18] Control Panel               [41] Animate control,element window [66] Capture                 [87] Recycle bin
echo [19] Nvdia Control Panel         [42] Animate minimize,maximize      [67] Windowed game optimize  [88] Dropbox
echo [20] Onedrive                    [43] Animate taskbar
echo [21] Recycle Bin                 [44] Taskbar thumbnail preview
echo                                  [45] Smooth font
echo                                  [46] Window content while dragging
echo                                  [47] Drop shadow icon label desktop
echo                                  [48] Translucent selection rectangle
echo [G] Gaming  [W] Working
echo.
echo [A] Apply   [B] Reset
call :color 0f Enable
if exist "%userprofile%\TweakBox\data\e1.txt" call :color 0f " 1"
if exist "%userprofile%\TweakBox\data\e2.txt" call :color 0f " 2"
if exist "%userprofile%\TweakBox\data\e3.txt" call :color 0f " 3"
if exist "%userprofile%\TweakBox\data\e4.txt" call :color 0f " 4"
if exist "%userprofile%\TweakBox\data\e5.txt" call :color 0f " 5"
if exist "%userprofile%\TweakBox\data\e6.txt" call :color 0f " 6"
if exist "%userprofile%\TweakBox\data\e7.txt" call :color 0f " 7"
if exist "%userprofile%\TweakBox\data\e8.txt" call :color 0f " 8"
if exist "%userprofile%\TweakBox\data\e9.txt" call :color 0f " 9"
if exist "%userprofile%\TweakBox\data\e10.txt" call :color 0f " 10"
if exist "%userprofile%\TweakBox\data\e11.txt" call :color 0f " 11"
if exist "%userprofile%\TweakBox\data\e14.txt" call :color 0f " 14"
if exist "%userprofile%\TweakBox\data\e16.txt" call :color 0f " 16"
if exist "%userprofile%\TweakBox\data\e17.txt" call :color 0f " 17"
if exist "%userprofile%\TweakBox\data\e18.txt" call :color 0f " 18"
if exist "%userprofile%\TweakBox\data\e19.txt" call :color 0f " 19"
if exist "%userprofile%\TweakBox\data\e20.txt" call :color 0f " 20"
if exist "%userprofile%\TweakBox\data\e21.txt" call :color 0f " 21"
if exist "%userprofile%\TweakBox\data\e22.txt" call :color 0f " 22"
if exist "%userprofile%\TweakBox\data\e23.txt" call :color 0f " 23"
if exist "%userprofile%\TweakBox\data\e24.txt" call :color 0f " 24"
if exist "%userprofile%\TweakBox\data\e26.txt" call :color 0f " 26"
if exist "%userprofile%\TweakBox\data\e27.txt" call :color 0f " 27"
if exist "%userprofile%\TweakBox\data\e28.txt" call :color 0f " 28"
if exist "%userprofile%\TweakBox\data\e29.txt" call :color 0f " 29"
if exist "%userprofile%\TweakBox\data\e30.txt" call :color 0f " 30"
if exist "%userprofile%\TweakBox\data\e31.txt" call :color 0f " 31"
if exist "%userprofile%\TweakBox\data\e32.txt" call :color 0f " 32"
if exist "%userprofile%\TweakBox\data\e33.txt" call :color 0f " 33"
if exist "%userprofile%\TweakBox\data\e35.txt" call :color 0f " 35"
if exist "%userprofile%\TweakBox\data\e36.txt" call :color 0f " 36"
if exist "%userprofile%\TweakBox\data\e37.txt" call :color 0f " 37"
if exist "%userprofile%\TweakBox\data\e38.txt" call :color 0f " 38"
if exist "%userprofile%\TweakBox\data\e39.txt" call :color 0f " 39"
if exist "%userprofile%\TweakBox\data\e40.txt" call :color 0f " 40"
if exist "%userprofile%\TweakBox\data\e41.txt" call :color 0f " 41"
if exist "%userprofile%\TweakBox\data\e42.txt" call :color 0f " 42"
if exist "%userprofile%\TweakBox\data\e43.txt" call :color 0f " 43"
if exist "%userprofile%\TweakBox\data\e44.txt" call :color 0f " 44"
if exist "%userprofile%\TweakBox\data\e45.txt" call :color 0f " 45"
if exist "%userprofile%\TweakBox\data\e46.txt" call :color 0f " 46"
if exist "%userprofile%\TweakBox\data\e47.txt" call :color 0f " 47"
if exist "%userprofile%\TweakBox\data\e48.txt" call :color 0f " 48"
if exist "%userprofile%\TweakBox\data\e49.txt" call :color 0f " 49"
if exist "%userprofile%\TweakBox\data\e50.txt" call :color 0f " 50"
if exist "%userprofile%\TweakBox\data\e51.txt" call :color 0f " 51"
if exist "%userprofile%\TweakBox\data\e52.txt" call :color 0f " 52"
if exist "%userprofile%\TweakBox\data\e53.txt" call :color 0f " 53"
if exist "%userprofile%\TweakBox\data\e54.txt" call :color 0f " 54"
if exist "%userprofile%\TweakBox\data\e55.txt" call :color 0f " 55"
if exist "%userprofile%\TweakBox\data\e56.txt" call :color 0f " 56"
if exist "%userprofile%\TweakBox\data\e57.txt" call :color 0f " 57"
if exist "%userprofile%\TweakBox\data\e58.txt" call :color 0f " 58"
if exist "%userprofile%\TweakBox\data\c591.txt" call :color 0f " 59"
if exist "%userprofile%\TweakBox\data\e60.txt" call :color 0f " 60"
if exist "%userprofile%\TweakBox\data\e61.txt" call :color 0f " 61"
if exist "%userprofile%\TweakBox\data\e62.txt" call :color 0f " 62"
if exist "%userprofile%\TweakBox\data\e63.txt" call :color 0f " 63"
if exist "%userprofile%\TweakBox\data\e64.txt" call :color 0f " 64"
if exist "%userprofile%\TweakBox\data\e65.txt" call :color 0f " 65"
if exist "%userprofile%\TweakBox\data\e66.txt" call :color 0f " 66"
if exist "%userprofile%\TweakBox\data\e67.txt" call :color 0f " 67"
if exist "%userprofile%\TweakBox\data\e68.txt" call :color 0f " 68"
if exist "%userprofile%\TweakBox\data\e69.txt" call :color 0f " 69"
if exist "%userprofile%\TweakBox\data\e70.txt" call :color 0f " 70"
if exist "%userprofile%\TweakBox\data\e71.txt" call :color 0f " 71"
if exist "%userprofile%\TweakBox\data\e72.txt" call :color 0f " 72"
if exist "%userprofile%\TweakBox\data\e73.txt" call :color 0f " 73"
if exist "%userprofile%\TweakBox\data\e74.txt" call :color 0f " 74"
if exist "%userprofile%\TweakBox\data\e75.txt" call :color 0f " 75"
if exist "%userprofile%\TweakBox\data\e76.txt" call :color 0f " 76"
if exist "%userprofile%\TweakBox\data\e77.txt" call :color 0f " 77"
if exist "%userprofile%\TweakBox\data\e78.txt" call :color 0f " 78"
if exist "%userprofile%\TweakBox\data\e79.txt" call :color 0f " 79"
if exist "%userprofile%\TweakBox\data\e80.txt" call :color 0f " 80"
if exist "%userprofile%\TweakBox\data\e81.txt" call :color 0f " 81"
if exist "%userprofile%\TweakBox\data\e82.txt" call :color 0f " 82"
if exist "%userprofile%\TweakBox\data\e83.txt" call :color 0f " 83"
if exist "%userprofile%\TweakBox\data\e84.txt" call :color 0f " 84"
if exist "%userprofile%\TweakBox\data\e85.txt" call :color 0f " 85"
if exist "%userprofile%\TweakBox\data\e86.txt" call :color 0f " 86"
if exist "%userprofile%\TweakBox\data\e87.txt" call :color 0f " 87"
if exist "%userprofile%\TweakBox\data\e88.txt" call :color 0f " 88"
echo.
call :color 0f Disable
if exist "%userprofile%\TweakBox\data\d1.txt" call :color 0f " 1"
if exist "%userprofile%\TweakBox\data\d2.txt" call :color 0f " 2"
if exist "%userprofile%\TweakBox\data\d3.txt" call :color 0f " 3"
if exist "%userprofile%\TweakBox\data\d4.txt" call :color 0f " 4"
if exist "%userprofile%\TweakBox\data\d5.txt" call :color 0f " 5"
if exist "%userprofile%\TweakBox\data\d6.txt" call :color 0f " 6"
if exist "%userprofile%\TweakBox\data\d7.txt" call :color 0f " 7"
if exist "%userprofile%\TweakBox\data\d8.txt" call :color 0f " 8"
if exist "%userprofile%\TweakBox\data\d9.txt" call :color 0f " 9"
if exist "%userprofile%\TweakBox\data\d10.txt" call :color 0f " 10"
if exist "%userprofile%\TweakBox\data\d11.txt" call :color 0f " 11"
if exist "%userprofile%\TweakBox\data\d14.txt" call :color 0f " 14"
if exist "%userprofile%\TweakBox\data\d16.txt" call :color 0f " 16"
if exist "%userprofile%\TweakBox\data\d17.txt" call :color 0f " 17"
if exist "%userprofile%\TweakBox\data\d18.txt" call :color 0f " 18"
if exist "%userprofile%\TweakBox\data\d19.txt" call :color 0f " 19"
if exist "%userprofile%\TweakBox\data\d20.txt" call :color 0f " 20"
if exist "%userprofile%\TweakBox\data\d21.txt" call :color 0f " 21"
if exist "%userprofile%\TweakBox\data\d22.txt" call :color 0f " 22"
if exist "%userprofile%\TweakBox\data\d23.txt" call :color 0f " 23"
if exist "%userprofile%\TweakBox\data\d24.txt" call :color 0f " 24"
if exist "%userprofile%\TweakBox\data\d26.txt" call :color 0f " 26"
if exist "%userprofile%\TweakBox\data\d27.txt" call :color 0f " 27"
if exist "%userprofile%\TweakBox\data\d28.txt" call :color 0f " 28"
if exist "%userprofile%\TweakBox\data\d29.txt" call :color 0f " 29"
if exist "%userprofile%\TweakBox\data\d30.txt" call :color 0f " 30"
if exist "%userprofile%\TweakBox\data\d31.txt" call :color 0f " 31"
if exist "%userprofile%\TweakBox\data\d32.txt" call :color 0f " 32"
if exist "%userprofile%\TweakBox\data\d33.txt" call :color 0f " 33"
if exist "%userprofile%\TweakBox\data\d35.txt" call :color 0f " 35"
if exist "%userprofile%\TweakBox\data\d36.txt" call :color 0f " 36"
if exist "%userprofile%\TweakBox\data\d37.txt" call :color 0f " 37"
if exist "%userprofile%\TweakBox\data\d38.txt" call :color 0f " 38"
if exist "%userprofile%\TweakBox\data\d39.txt" call :color 0f " 39"
if exist "%userprofile%\TweakBox\data\d40.txt" call :color 0f " 40"
if exist "%userprofile%\TweakBox\data\e41.txt" call :color 0f " 41"
if exist "%userprofile%\TweakBox\data\d42.txt" call :color 0f " 42"
if exist "%userprofile%\TweakBox\data\d43.txt" call :color 0f " 43"
if exist "%userprofile%\TweakBox\data\d44.txt" call :color 0f " 44"
if exist "%userprofile%\TweakBox\data\d45.txt" call :color 0f " 45"
if exist "%userprofile%\TweakBox\data\d46.txt" call :color 0f " 46"
if exist "%userprofile%\TweakBox\data\d47.txt" call :color 0f " 47"
if exist "%userprofile%\TweakBox\data\d48.txt" call :color 0f " 48"
if exist "%userprofile%\TweakBox\data\d49.txt" call :color 0f " 49"
if exist "%userprofile%\TweakBox\data\d50.txt" call :color 0f " 50"
if exist "%userprofile%\TweakBox\data\d51.txt" call :color 0f " 51"
if exist "%userprofile%\TweakBox\data\d52.txt" call :color 0f " 52"
if exist "%userprofile%\TweakBox\data\d53.txt" call :color 0f " 53"
if exist "%userprofile%\TweakBox\data\d54.txt" call :color 0f " 54"
if exist "%userprofile%\TweakBox\data\d55.txt" call :color 0f " 55"
if exist "%userprofile%\TweakBox\data\d56.txt" call :color 0f " 56"
if exist "%userprofile%\TweakBox\data\d57.txt" call :color 0f " 57"
if exist "%userprofile%\TweakBox\data\d58.txt" call :color 0f " 59"
if exist "%userprofile%\TweakBox\data\c592.txt" call :color 0f " 59RestartWarning"
if exist "%userprofile%\TweakBox\data\c593.txt" call :color 0f " 59NoRestartWarning"
if exist "%userprofile%\TweakBox\data\d60.txt" call :color 0f " 60"
if exist "%userprofile%\TweakBox\data\d61.txt" call :color 0f " 61"
if exist "%userprofile%\TweakBox\data\d62.txt" call :color 0f " 62"
if exist "%userprofile%\TweakBox\data\d63.txt" call :color 0f " 63"
if exist "%userprofile%\TweakBox\data\d64.txt" call :color 0f " 64"
if exist "%userprofile%\TweakBox\data\d65.txt" call :color 0f " 65"
if exist "%userprofile%\TweakBox\data\d66.txt" call :color 0f " 66"
if exist "%userprofile%\TweakBox\data\d67.txt" call :color 0f " 67"
if exist "%userprofile%\TweakBox\data\d68.txt" call :color 0f " 68"
if exist "%userprofile%\TweakBox\data\d69.txt" call :color 0f " 69"
if exist "%userprofile%\TweakBox\data\d70.txt" call :color 0f " 70"
if exist "%userprofile%\TweakBox\data\d71.txt" call :color 0f " 71"
if exist "%userprofile%\TweakBox\data\d72.txt" call :color 0f " 72"
if exist "%userprofile%\TweakBox\data\d73.txt" call :color 0f " 73"
if exist "%userprofile%\TweakBox\data\d74.txt" call :color 0f " 74"
if exist "%userprofile%\TweakBox\data\d75.txt" call :color 0f " 75"
if exist "%userprofile%\TweakBox\data\d76.txt" call :color 0f " 76"
if exist "%userprofile%\TweakBox\data\d77.txt" call :color 0f " 77"
if exist "%userprofile%\TweakBox\data\d78.txt" call :color 0f " 78"
if exist "%userprofile%\TweakBox\data\d79.txt" call :color 0f " 79"
if exist "%userprofile%\TweakBox\data\d80.txt" call :color 0f " 80"
if exist "%userprofile%\TweakBox\data\d81.txt" call :color 0f " 81"
if exist "%userprofile%\TweakBox\data\d82.txt" call :color 0f " 82"
if exist "%userprofile%\TweakBox\data\d83.txt" call :color 0f " 83"
if exist "%userprofile%\TweakBox\data\d84.txt" call :color 0f " 84"
if exist "%userprofile%\TweakBox\data\d85.txt" call :color 0f " 85"
if exist "%userprofile%\TweakBox\data\d86.txt" call :color 0f " 86"
if exist "%userprofile%\TweakBox\data\d87.txt" call :color 0f " 87"
if exist "%userprofile%\TweakBox\data\d88.txt" call :color 0f " 88"
echo.
call :color 0f Custom
if exist "%userprofile%\TweakBox\data\c121.txt" call :color 0f " 12ThisPC"
if exist "%userprofile%\TweakBox\data\c122.txt" call :color 0f " 12QuickAccess"
if exist "%userprofile%\TweakBox\data\c123.txt" call :color 0f " 12Download"
if exist "%userprofile%\TweakBox\data\e13.txt" call :color 0f " 13NewWindow"
if exist "%userprofile%\TweakBox\data\d13.txt" call :color 0f " 13SameWindow"
if exist "%userprofile%\TweakBox\data\c251.txt" call :color 0f " 25Icon"
if exist "%userprofile%\TweakBox\data\c252.txt" call :color 0f " 25Box"
if exist "%userprofile%\TweakBox\data\c253.txt" call :color 0f " 25Hide"
if exist "%userprofile%\TweakBox\data\c341.txt" call :color 0f " 34Tiny"
if exist "%userprofile%\TweakBox\data\c342.txt" call :color 0f " 34Normal"
if exist "%userprofile%\TweakBox\data\c343.txt" call :color 0f " 34Big"
echo.
echo.
set /p x=^>^> 
if %x% == a goto oconfig
if %x% == b rd /s /q %userprofile%\TweakBox\data & md %userprofile%\TweakBox\data & goto 5
if %x% == g rd /s /q %userprofile%\TweakBox\data & md %userprofile%\TweakBox\data & goto gamingconfig
if %x% == w rd /s /q %userprofile%\TweakBox\data & md %userprofile%\TweakBox\data & goto workingconfig
if %x% == 0 goto 0
if %x% == 1 goto config
if %x% == 2 goto config
if %x% == 3 goto config
if %x% == 4 goto config
if %x% == 5 goto config
if %x% == 6 goto config
if %x% == 7 goto config
if %x% == 8 goto config
if %x% == 9 goto config
if %x% == 10 goto config
if %x% == 11 goto config
if %x% == 12 goto config12
if %x% == 13 goto config
if %x% == 14 goto config
if %x% == 15 md %userprofile%\TweakBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C} & %userprofile%\TweakBox\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C} & goto 5
if %x% == 16 goto config
if %x% == 17 goto config
if %x% == 18 goto config
if %x% == 19 goto config
if %x% == 20 goto config
if %x% == 21 goto config
if %x% == 22 goto config
if %x% == 23 goto config
if %x% == 24 goto config
if %x% == 25 goto config25
if %x% == 26 goto config
if %x% == 27 goto config
if %x% == 28 goto config
if %x% == 29 goto config
if %x% == 30 goto config
if %x% == 31 goto config
if %x% == 32 goto config
if %x% == 33 goto config
if %x% == 34 goto config34
if %x% == 35 goto config
if %x% == 36 goto config
if %x% == 37 goto config
if %x% == 38 goto config
if %x% == 39 goto config
if %x% == 40 goto config
if %x% == 41 goto config
if %x% == 42 goto config
if %x% == 43 goto config
if %x% == 44 goto config
if %x% == 45 goto config
if %x% == 46 goto config
if %x% == 47 goto config
if %x% == 48 goto config
if %x% == 49 goto config
if %x% == 50 goto config
if %x% == 51 goto config
if %x% == 52 goto config
if %x% == 53 goto config
if %x% == 54 goto config
if %x% == 55 goto config
if %x% == 56 goto config
if %x% == 57 goto config
if %x% == 58 goto config
if %x% == 59 goto config59
if %x% == 60 goto config
if %x% == 61 goto config
if %x% == 62 goto config
if %x% == 63 goto config
if %x% == 64 goto config
if %x% == 65 goto config
if %x% == 66 goto config
if %x% == 67 goto config
if %x% == 68 goto config
if %x% == 69 goto config
if %x% == 70 goto config
if %x% == 71 goto config
if %x% == 72 goto config
if %x% == 73 goto config
if %x% == 74 goto config
if %x% == 75 goto config
if %x% == 76 goto config
if %x% == 77 goto config
if %x% == 78 goto config
if %x% == 79 goto config
if %x% == 80 goto config
if %x% == 81 goto config
if %x% == 82 goto config
if %x% == 83 goto config
if %x% == 84 goto config
if %x% == 85 goto config
if %x% == 86 goto config
if %x% == 87 goto config
if %x% == 88 goto config
echo Error please try again!! & timeout 2 >nul & goto 5

:config
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable                                ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable                               ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
if %x% == 13 (
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] New Window                            ^|
echo  ^|                                            ^|
echo  ^|  [2] Same Window                           ^|
echo  ^|                                            ^|
echo  ^|  [3] Back                                  ^|
echo  ^|____________________________________________^|
echo.
)
set /p o=^>^> 
if %o% == 1 del %userprofile%\TweakBox\data\d%x%.txt & echo ""> %userprofile%\TweakBox\data\e%x%.txt & goto 5
if %o% == 2 del %userprofile%\TweakBox\data\e%x%.txt & echo ""> %userprofile%\TweakBox\data\d%x%.txt & goto 5
if %o% == 3 goto 5
echo Error please try again!! & timeout 2 >nul & goto config

:config12
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] This PC                               ^|
echo  ^|                                            ^|
echo  ^|  [2] Quick Access                          ^|
echo  ^|                                            ^|
echo  ^|  [3] Download                              ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%1.txt & goto 5
if %o% == 2 del %userprofile%\TweakBox\data\c%x%1.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%2.txt & goto 5
if %o% == 3 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%1.txt & echo ""> %userprofile%\TweakBox\data\c%x%3.txt & goto 5
if %o% == 4 goto 5
echo Error please try again!! & timeout 2 >nul & goto config12

:config25
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Icon                                  ^|
echo  ^|                                            ^|
echo  ^|  [2] Box                                   ^|
echo  ^|                                            ^|
echo  ^|  [3] Hide                                  ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%1.txt & goto 5
if %o% == 2 del %userprofile%\TweakBox\data\c%x%1.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%2.txt & goto 5
if %o% == 3 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%1.txt & echo ""> %userprofile%\TweakBox\data\c%x%3.txt & goto 5
if %o% == 4 goto 5
echo Error please try again!! & timeout 2 >nul & goto config25

:config34
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Tiny                                  ^|
echo  ^|                                            ^|
echo  ^|  [2] Normal                                ^|
echo  ^|                                            ^|
echo  ^|  [3] Big                                   ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%1.txt & goto 5
if %o% == 2 del %userprofile%\TweakBox\data\c%x%1.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%2.txt & goto 5
if %o% == 3 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%1.txt & echo ""> %userprofile%\TweakBox\data\c%x%3.txt & goto 5
if %o% == 4 goto 5
echo Error please try again!! & timeout 2 >nul & goto config34

:config59
cls
echo   ____________________________________________
echo  ^|                                            ^|
echo  ^|  [1] Enable                                ^|
echo  ^|                                            ^|
echo  ^|  [2] Disable (restart warning)             ^|
echo  ^|                                            ^|
echo  ^|  [3] Disable (no restart warning)          ^|
echo  ^|                                            ^|
echo  ^|  [4] Back                                  ^|
echo  ^|____________________________________________^|
echo.
set /p o=^>^> 
if %o% == 1 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%1.txt & goto 5
if %o% == 2 del %userprofile%\TweakBox\data\c%x%1.txt & del %userprofile%\TweakBox\data\c%x%3.txt & echo ""> %userprofile%\TweakBox\data\c%x%2.txt & goto 5
if %o% == 3 del %userprofile%\TweakBox\data\c%x%2.txt & del %userprofile%\TweakBox\data\c%x%1.txt & echo ""> %userprofile%\TweakBox\data\c%x%3.txt & goto 5
if %o% == 4 goto 5
echo Error please try again!! & timeout 2 >nul & goto config59

:oconfig
if exist "%userprofile%\TweakBox\data\e1.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d1.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e2.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v IconsOnly /t reg_dword /d 0 /f & reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisableThumbnails /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisableThumbnails /f
if exist "%userprofile%\TweakBox\data\d2.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v IconsOnly /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisableThumbnails /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v DisableThumbnails /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e3.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d3.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e4.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t  reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v NoRecentDocsHistory /t  reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ClearRecentDocsOnExit /t  reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t  reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d4.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t  reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v NoRecentDocsHistory /t  reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ClearRecentDocsOnExit /t  reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t  reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e5.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AllowOnlineTips /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d5.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AllowOnlineTips /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e6.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v UseCompactMode /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d6.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v UseCompactMode /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e7.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d7.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowPreviewHandlers /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e8.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d8.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e9.txt" reg add "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d9.txt" reg add "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e10.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d10.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e11.txt" reg add "hkcu\Software\Microsoft\Clipboard" /v EnableClipboardHistory /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d11.txt" reg add "hkcu\Software\Microsoft\Clipboard" /v EnableClipboardHistory /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\c121.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c122.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t reg_dword /d 2 /f
if exist "%userprofile%\TweakBox\data\c123.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t reg_dword /d 3 /f
if exist "%userprofile%\TweakBox\data\e13.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v Settings /t reg_binary /d 0c0002002a01000060000000 /f
if exist "%userprofile%\TweakBox\data\d13.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v Settings /t reg_binary /d 0c0002000a01000060000000 /f
if exist "%userprofile%\TweakBox\data\e14.txt" reg delete "hkcu\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f & reg delete "hkcu\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f & reg delete "hkcu\Software\Microsoft\Windows\Shell\BagMRU" /f & reg delete "hkcu\Software\Microsoft\Windows\Shell\Bags" /f & reg add "hkcu\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /v BagMRU /t reg_dword /d 1388 /f & reg add "hkcu\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /v BagMRU /t reg_dword /d 1388 /f
if exist "%userprofile%\TweakBox\data\e16.txt" reg add "hkcr\*\shell\runas" /d "Take Ownership" /f & reg add "hkcr\*\shell\runas" /v HasLUAShield /t reg_sz /f & reg add "hkcr\*\shell\runas" /v NoWorkingDirectory /t reg_sz /f & reg add "hkcr\*\shell\runas" /v NeverDefault /t reg_sz /f & reg add "hkcr\*\shell\runas" /v Position /t reg_sz /d middle /f & reg add "hkcr\*\shell\runas\command" /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f & reg add "hkcr\*\shell\runas\command" /v IsolatedCommand /t reg_sz /d "cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F" /f & reg add "hkcr\Directory\shell\runas" /d "Take Ownership" /f & reg add "hkcr\Directory\shell\runas" /v HasLUAShield /t reg_sz /f & reg add "hkcr\Directory\shell\runas" /v NoWorkingDirectory /t reg_sz /f & reg add "hkcr\Directory\shell\runas" /v Position /t reg_sz /d middle /f & reg add "hkcr\Directory\shell\runas\command" /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f & reg add "hkcr\Directory\shell\runas\command" /v IsolatedCommand /t reg_sz /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f & reg add "hkcr\Drive\shell\runas" /d "Take Ownership" /f & reg add "hkcr\Drive\shell\runas" /v HasLUAShield /t reg_sz /f & reg add "hkcr\Drive\shell\runas" /v NoWorkingDirectory /t reg_sz /f & reg add "hkcr\Drive\shell\runas" /v Position /t reg_sz /d middle /f & reg add "hkcr\Drive\shell\runas\command" /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f & reg add "hkcr\Drive\shell\runas\command" /v IsolatedCommand /t reg_sz /d "cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t" /f
if exist "%userprofile%\TweakBox\data\d16.txt" reg delete "hkcr\*\shell\TakeOwnership" /f & reg delete "hkcr\*\shell\runas" /f & reg delete "hkcr\Directory\shell\TakeOwnership" /f & reg delete "hkcr\Directory\shell\runas" /f & reg delete "hkcr\Drive\shell\TakeOwnership" /f & reg delete "hkcr\Drive\shell\runas" /f
if exist "%userprofile%\TweakBox\data\e17.txt" reg add "hkcr\Directory\Background\shell\empty" /v CommandStateHandler /t reg_sz /d "{c9298eef-69dd-4cdd-b153-bdbc38486781}" /f & reg add "hkcr\Directory\Background\shell\empty" /v Description /t reg_sz /d "@shell32.dll,-31332" /f & reg add "hkcr\Directory\Background\shell\empty" /v Icon /t reg_sz /d "shell32.dll,-254" /f & reg add "hkcr\Directory\Background\shell\empty" /v MUIVerb /t reg_sz /d "@shell32.dll,-10564" /f & reg add "hkcr\Directory\Background\shell\empty" /v Position /t reg_sz /d "Bottom" /f & reg add "hkcr\Directory\Background\shell\empty\command" /v DelegateExecute /t reg_sz /d "{48527bb3-e8de-450b-8910-8c4099cb8624}" /f
if exist "%userprofile%\TweakBox\data\d17.txt" reg delete "hkcr\Directory\Background\shell\empty" /f
if exist "%userprofile%\TweakBox\data\e18.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /f
if exist "%userprofile%\TweakBox\data\d18.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /f
if exist "%userprofile%\TweakBox\data\e19.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0bbca823-e77d-419e-9a44-5adec2c8eeb0}" /f
if exist "%userprofile%\TweakBox\data\d19.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0bbca823-e77d-419e-9a44-5adec2c8eeb0}" /f
if exist "%userprofile%\TweakBox\data\e20.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
if exist "%userprofile%\TweakBox\data\d20.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
if exist "%userprofile%\TweakBox\data\e21.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /f
if exist "%userprofile%\TweakBox\data\d21.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /f
if exist "%userprofile%\TweakBox\data\e22.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v HideSCAMeetNow /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d22.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer" /v HideSCAMeetNow /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e23.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d23.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e24.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMn /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d24.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMn /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\c251.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c252.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t reg_dword /d 2 /f
if exist "%userprofile%\TweakBox\data\c253.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e26.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCortanaButton /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d26.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCortanaButton /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e27.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d27.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e28.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d28.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e29.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d29.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e30.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /t reg_sz /d "%userprofile%\TweakBox\data\blank.ico" /f
if exist "%userprofile%\TweakBox\data\d30.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /f
if exist "%userprofile%\TweakBox\data\e31.txt" reg add "hkcu\Control Panel\Desktop" /v WindowArrangementActive /t reg_dword /d 1 /f & reg add "hkcu\Control Panel\Desktop" /v DockMoving /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableSnapAssistFlyout /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v JoinResize /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapFill /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapAssist /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d31.txt" reg add "hkcu\Control Panel\Desktop" /v WindowArrangementActive /t reg_dword /d 0 /f & reg add "hkcu\Control Panel\Desktop" /v DockMoving /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableSnapAssistFlyout /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v JoinResize /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapFill /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SnapAssist /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e32.txt" reg delete "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /f & reg delete "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v EnableLegacyBalloonNotifications /f
if exist "%userprofile%\TweakBox\data\d32.txt" reg add "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t reg_dword /d 1 /f & reg add "hkcu\Software\Policies\Microsoft\Windows\Explorer" /v EnableLegacyBalloonNotifications /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e33.txt" reg delete "hklm\SOFTWARE\Policies\Microsoft\TabletPC" /v DisableSnippingTool /f
if exist "%userprofile%\TweakBox\data\d33.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\TabletPC" /v DisableSnippingTool /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c341.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSi /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\c342.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSi /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c343.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSi /t reg_dword /d 2 /f
if exist "%userprofile%\TweakBox\data\e35.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d35.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e36.txt" reg add "hklm\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d36.txt" reg add "hklm\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e37.txt" reg add "hkcu\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d37.txt" reg add "hkcu\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e38.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d38.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e39.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d39.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e40.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d40.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e41.txt" reg add "hkcu\Control Panel\Desktop" /v UserPreferencesMask /t reg_binary /d 9012038012000000 /f
if exist "%userprofile%\TweakBox\data\d41.txt" reg add "hkcu\Control Panel\Desktop" /v UserPreferencesMask /t reg_binary /d 9012038010000000 /f
if exist "%userprofile%\TweakBox\data\e42.txt" reg add "hkcu\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t reg_sz /d 1 /f & reg add "hkcu\Control Panel\Desktop\WindowMetrics" /v MaxAnimate /t reg_sz /d 1 /f
if exist "%userprofile%\TweakBox\data\d42.txt" reg add "hkcu\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t reg_sz /d 1 /f & reg add "hkcu\Control Panel\Desktop\WindowMetrics" /v MaxAnimate /t reg_sz /d 0 /f
if exist "%userprofile%\TweakBox\data\e43.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d43.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e44.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t reg_dword /d 1 /f & reg add "hkcu\software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v NumThumbnails 16 /f
if exist "%userprofile%\TweakBox\data\d44.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t reg_dword /d 0 /f & reg add "hkcu\software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v NumThumbnails 0 /f
if exist "%userprofile%\TweakBox\data\e45.txt" reg add "hkcu\Control Panel\Desktop" /v FontSmoothingType /t reg_dword /d 2 /f & reg add "hkcu\Control Panel\Desktop" /v FontSmoothing /t reg_sz /d 2 /f
if exist "%userprofile%\TweakBox\data\d45.txt" reg add "hkcu\Control Panel\Desktop" /v FontSmoothingType /t reg_dword /d 0 /f & reg add "hkcu\Control Panel\Desktop" /v FontSmoothing /t reg_sz /d 0 /f
if exist "%userprofile%\TweakBox\data\e46.txt" reg add "hkcu\Control Panel\Desktop" /v DragFullWindows /t reg_sz /d 1 /f
if exist "%userprofile%\TweakBox\data\d46.txt" reg add "hkcu\Control Panel\Desktop" /v DragFullWindows /t reg_sz /d 0 /f
if exist "%userprofile%\TweakBox\data\e47.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d47.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e48.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d48.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e49.txt" reg add "hkcu\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
if exist "%userprofile%\TweakBox\data\d49.txt" reg delete "hkcu\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
if exist "%userprofile%\TweakBox\data\e50.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowClassicMode /t  reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d50.txt" reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowClassicMode" /f
if exist "%userprofile%\TweakBox\data\e51.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {e2bf9676-5f8f-435c-97eb-11607a5bedf7} /t reg_sz /f
if exist "%userprofile%\TweakBox\data\d51.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v {e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f
if exist "%userprofile%\TweakBox\data\e52.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableControlCenter /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableEditingQuickSettings /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d52.txt" reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableControlCenter /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableEditingQuickSettings /f
if exist "%userprofile%\TweakBox\data\e53.txt" reg delete "hkcu\Control Panel\Quick Actions" /f & taskkill /f /im explorer.exe & start explorer.exe
if exist "%userprofile%\TweakBox\data\e54.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages" /v UndockingDisabled /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d54.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages" /v UndockingDisabled /f
if exist "%userprofile%\TweakBox\data\e55.txt" reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f & reg delete "hklm\SYSTEM\Internet Communication Management\Internet Communication" /f & reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWindowsUpdate" /f & reg delete "hklm\SOFTWARE\Policies\Microsoft\WindowsStore" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /f & sc start wuauserv & sc config wuauserv start=demand & sc start WaaSMedicSvc & sc config WaaSMedicSvc start=demand
if exist "%userprofile%\TweakBox\data\d55.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v TargetReleaseVersion /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableOSUpgrade /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\Internet Communication Management\Internet Communication" /v DisableWindowsUpdateAccess /t reg_dword /d 1 /f & reg add "hklm\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t reg_dword /d 2 /f & reg add "hklm\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t reg_dword /d 1 /f & reg add "hklm\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t reg_dword /d 1 /f & reg add "hklm\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t reg_dword /d 0 /f & reg add "hklm\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t reg_dword /d 3 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWindowsUpdate /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\WindowsStore" /v DisableOSUpgrade /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v AllowOSUpgrade /t reg_dword /d 0 /f & sc stop wuauserv & sc config wuauserv start=disabled & sc stop WaaSMedicSvc & sc config WaaSMedicSvc start=disabled
if exist "%userprofile%\TweakBox\data\e56.txt" reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\Update" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdate" /v value /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Microsoft\PolicyManager\current\device\Update" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\d56.txt" reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\Update" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdate" /v value /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Microsoft\PolicyManager\current\device\Update" /v ExcludeWUDriversInQualityUpdate /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e57.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v AutoDownload /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d57.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v AutoDownload /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e58.txt" reg delete "hklm\SYSTEM\Setup\LabConfig" /f & reg delete "hklm\SYSTEM\Setup\MoSetup" /f
if exist "%userprofile%\TweakBox\data\d58.txt" reg add "hklm\SYSTEM\Setup\LabConfig" /v BypassTPMCheck /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\Setup\LabConfig" /v BypassRAMCheck /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\Setup\LabConfig" /v BypassSecureBootCheck /t reg_dword /d 1 /f & reg add "hklm\SYSTEM\Setup\MoSetup" /v AllowUpgradesWithUnsupportedTPMOrCPU /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c591.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v SetUpdateNotificationLevel /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v UpdateNotificationLevel /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\c592.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v SetUpdateNotificationLevel /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v UpdateNotificationLevel /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\c593.txt" reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v SetUpdateNotificationLevel /t reg_dword /d 2 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v UpdateNotificationLevel /t reg_dword /d 2 /f
if exist "%userprofile%\TweakBox\data\e60.txt" sc stop bits & sc stop wuauserv & sc stop WaaSMedicSvc & sc stop DcomLaunch & sc stop appidsvc & sc stop cryptsvc & sc stop dosvc & sc stop msiserver & sc stop RpcEptMapper & sc stop trustedinstaller & sc stop usosvc & del /s /q /f %userprofile%\Application Data\Microsoft\Network\Downloader\qmgr*.dat & del /s /q /f %userprofile%\Microsoft\Network\Downloader\qmgr*.dat & del /s /q /f %windir%\Logs\WindowsUpdate\* & del /s /q /f %windir%\winsxs\pending.xml.bak & del /s /q /f %windir%\SoftwareDistribution\DataStore\Logs\edb.log & del /s /q /f %programdata%\USOPrivate\UpdateStore\* & UsoClient.exe RefreshSettings' -Verb runAs" & takeown /f %windir%\winsxs\pending.xml & attrib -r -s -h /s /d %windir%\winsxs\pending.xml & attrib -r -s -h /s /d %windir%\SoftwareDistribution & attrib -r -s -h /s /d %windir%\system32\Catroot2 & ren %windir%\winsxs\pending.xml pending.xml.bak & ren %windir%\SoftwareDistribution SoftwareDistribution.bak & ren %windir%\SoftwareDistribution SoftwareDistribution.old & ren %windir%\system32\Catroot2 Catroot2.bak & ren %windir%\System32\Catroot2 Catroot2.old & rd /s /q %windir%\SoftwareDistribution.bak & rd /s /q %windir%\SoftwareDistribution.old & rd /s /q %windir%\system32\Catroot2.bak & rd /s /q %windir%\system32\Catroot2.old & reg delete "hkcu\Software\Policies\Microsoft\Windows\WindowsUpdate" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /f & gpupdate /force & sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU) & sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU) & regsvr32 /s acelpdec.ax & regsvr32 /s actxprxy.dll & regsvr32 /s asctrls.ocx & regsvr32 /s atl.dll & regsvr32 /s browseui.dll & regsvr32 /s cdfview.dll & regsvr32 /s comcat.dll & regsvr32 /s corpol.dll & regsvr32 /s crswpp.dll & regsvr32 /s cryptdlg.dll & regsvr32 /s cryptext.dll & regsvr32 /s danim.dll & regsvr32 /s datime.dll & regsvr32 /s daxctle.ocx & regsvr32 /s dispex.dll & regsvr32 /s dssenh.dll & regsvr32 /s dxmasf.dll & regsvr32 /s dxtmsft.dll & regsvr32 /s dxtrans.dll & regsvr32 /s fpwpp.dll & regsvr32 /s ftpwpp.dll & regsvr32 /s gpkcsp.dll & regsvr32 /s hhctrl.ocx & regsvr32 /s hlink.dll & regsvr32 /s icmfilter.dll & regsvr32 /s iepeers.dll & regsvr32 /s iesetup.dll & regsvr32 /s ils.dll & regsvr32 /s imgutil.dll & regsvr32 /s inetcfg.dll & regsvr32 /s inetcomm.dll & regsvr32 /s initpki.dll & regsvr32 /s inseng.dll & regsvr32 /s jscript.dll & regsvr32 /s l3codecx.ax & regsvr32 /s licmgr10.dll & regsvr32 /s lmrt.dll & regsvr32 /s mlang.dll & regsvr32 /s mmefxe.ocx & regsvr32 /s mobsync.dll & regsvr32 /s mpg4ds32.ax & regsvr32 /s msapsspc.dll /sspccreatesspireg & regsvr32 /s msdxm.ocx & regsvr32 /s mshtml.dll & regsvr32 /s mshtmled.dll & regsvr32 /s msident.dll & regsvr32 /s msnsspc.dll /sspccreatesspireg & regsvr32 /s msoeacct.dll & regsvr32 /s msr2c.dll & regsvr32 /s msrating.dll & regsvr32 /s msscript.ocx & regsvr32 /s msxml.dll & regsvr32 /s msxml2.dll & regsvr32 /s msxml3.dll & regsvr32 /s msxml6.dll & regsvr32 /s occache.dll & regsvr32 /s ole32.dll & regsvr32 /s oleaut32.dll & regsvr32 /s plugin.ocx & regsvr32 /s pngfilt.dll & regsvr32 /s postwpp.dll & regsvr32 /s qmgr.dll & regsvr32 /s qmgrprxy.dll & regsvr32 /s rsabase.dll & regsvr32 /s rsaenh.dll & regsvr32 /s sccbase.dll & regsvr32 /s schannel.dll & regsvr32 /s scrobj.dll & regsvr32 /s scrrun.dll & regsvr32 /s scrrun.dll mstinit.exe /setup & regsvr32 /s sendmail.dll & regsvr32 /s shdoc401.dll & regsvr32 /s shdocvw.dll & regsvr32 /s shell32.dll & regsvr32 /s slbcsp.dll & regsvr32 /s softpub.dll & regsvr32 /s tdc.ocx & regsvr32 /s thumbvw.dll & regsvr32 /s urlmon.dll & regsvr32 /s vbscript.dll & regsvr32 /s voxmsdec.ax & regsvr32 /s webcheck.dll & regsvr32 /s webpost.dll & regsvr32 /s wintrust.dll & regsvr32 /s wpwizdll.dll & regsvr32 /s wshext.dll & regsvr32 /s wshom.ocx & regsvr32 /s wuapi.dll & regsvr32 /s wuaueng.dll & regsvr32 /s wuaueng1.dll & regsvr32 /s wucltui.dll & regsvr32 /s wups.dll & regsvr32 /s wups2.dll & regsvr32 /s wucltux.dll & regsvr32 /s wudriver.dll & regsvr32 /s wuweb.dll & regsvr32 /s wuwebv.dll & regsvr32 /s xmsconf.ocx & rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN & bitsadmin.exe /reset /allusers & sc start bits & sc config bits start=demand & sc start wuauserv & sc config wuauserv start=demand & sc start WaaSMedicSvc & sc config WaaSMedicSvc start=demand & sc start DcomLaunch & sc config DcomLaunch start=auto & sc start appidsvc & sc config appidsvc start=demand & sc start cryptsvc & sc config cryptsvc start=auto & sc start dosvc & sc config dosvc start=auto & sc start msiserver & sc config msiserver start=demand & sc start RpcEptMapper & sc config RpcEptMapper start=auto & sc start trustedinstaller & sc config trustedinstaller start=auto & sc start usosvc & sc config usosvc start=auto & cls & echo If still corrupt you can do: & echo 1. Check error code in windows update log file C:\Windows\WindowsUpdate.log or window update history & echo 2. Install window update stand-alone in https://www.catalog.update.microsoft.com (enter KB version) & echo 3. Run windows update troubleshooter & echo 4. Disable Firewall and Anti-virus software & echo 5. Delete Temporary Files and Browser Cache (type 5-3 in main menu) & echo 6. Run fix system corrupts (type 13-67 in main menu) & timeout 15 >nul
if exist "%userprofile%\TweakBox\data\e61.txt" sc config XboxGipSvc start=demand & sc config XblAuthManager start=demand & sc config XblGameSave start=demand & sc config XboxNetApiSvc start=demand & sc config xboxgip start=demand
if exist "%userprofile%\TweakBox\data\d61.txt" sc config XboxGipSvc start=disabled & sc config XblAuthManager start=disabled & sc config XblGameSave start=disabled & sc config XboxNetApiSvc start=disabled & sc config xboxgip start=disabled
if exist "%userprofile%\TweakBox\data\e62.txt" reg add "hkcu\Software\Microsoft\GameBar" /v AllowAutoGameMode /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d62.txt" reg add "hkcu\Software\Microsoft\GameBar" /v AllowAutoGameMode /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e63.txt" reg add "hkcu\Software\Microsoft\GameBar" /v ShowStartupPanel /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\GameBar" /v GamePanelStartupTipIndex /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d63.txt" reg add "hkcu\Software\Microsoft\GameBar" /v ShowStartupPanel /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\GameBar" /v GamePanelStartupTipIndex /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e64.txt" reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t reg_dword /d 1 /f & reg add "hkcu\System\GameConfigStore\Children" /f & reg add "hkcu\System\GameConfigStore\Parents" /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_Enabled /t reg_dword /d 1 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_FSEBehavior /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_DSEBehavior /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v Win32_AutoGameModeDefaultProfile /t reg_binary /d 01000100000000000000000000000000000000000000000000000000000000000000000000000000 /f & reg add "hkcu\System\GameConfigStore" /v Win32_GameModeRelatedProcesses /t reg_binary /d 010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 /f & sc stop BcastDVRUserService & sc config BcastDVRUserService start=disabled
if exist "%userprofile%\TweakBox\data\d64.txt" reg add "hklm\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t reg_dword /d 0 /f & reg delete "hkcu\System\GameConfigStore\Children" /f & reg delete "hkcu\System\GameConfigStore\Parents" /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_Enabled /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t reg_dword /d 2 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_FSEBehavior /t reg_dword /d 2 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t reg_dword /d 1 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t reg_dword /d 1 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t reg_dword /d 0 /f & reg add "hkcu\System\GameConfigStore" /v GameDVR_DSEBehavior /t reg_dword /d 2 /f & reg add "hkcu\System\GameConfigStore" /v Win32_AutoGameModeDefaultProfile /t reg_binary /d 01000100000000000000000000000000000000000000000000000000000000000000000000000000 /f & reg add "hkcu\System\GameConfigStore" /v Win32_GameModeRelatedProcesses /t reg_binary /d 010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 /f & sc start BcastDVRUserService & sc config BcastDVRUserService start=demand
if exist "%userprofile%\TweakBox\data\e65.txt" rd /s /q %localappdata%\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\AC\TokenBroker\Accounts & rd /s /q %localappdata%\Packages\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe\AC\TokenBroker\Cache & reg add hklm\SYSTEM\CurrentControlSet\Services\XblAuthManager /v SvcHostSplitDisable /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e66.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v HistoricalCaptureEnabled /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AudioCaptureEnabled /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v MicrophoneCaptureEnabled /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d66.txt" reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v HistoricalCaptureEnabled /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AudioCaptureEnabled /t reg_dword /d 0 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v MicrophoneCaptureEnabled /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e67.txt" reg add "hkcu\Software\Microsoft\DirectX\GraphicsSettings" /v SwapEffectUpgradeCache /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t reg_sz /d "SwapEffectUpgradeEnable=1;" /f
if exist "%userprofile%\TweakBox\data\d67.txt" reg add "hkcu\Software\Microsoft\DirectX\GraphicsSettings" /v SwapEffectUpgradeCache /t reg_dword /d 1 /f & reg add "hkcu\Software\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t reg_sz /d "SwapEffectUpgradeEnable=0;" /f
if exist "%userprofile%\TweakBox\data\e68.txt" pushd "%~dp0" & dir /b %windir%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt & dir /b %windir%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt & for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%windir%\servicing\Packages\%%i"
if exist "%userprofile%\TweakBox\data\e69.txt" sc stop SysMain & sc config SysMain start=disabled & for %%i in (%windir%\system32\*.dll) do regsvr32.exe /s %%i
if exist "%userprofile%\TweakBox\data\e70.txt" sfc /scannow & sfc /verifyonly & DISM /Online /Cleanup-Image /CheckHealth & DISM /Online /Cleanup-Image /ScanHealth & DISM /Online /Cleanup-Image /RestoreHealth & DISM /Online /Cleanup-Image /RestoreHealth /Source:%systemdrive%\RepairSource\install.wim & DISM /Online /Cleanup-Image /RestoreHealth /Source:%systemdrive%\RepairSource\Windows /LimitAccess & DISM /Online /Cleanup-Image /AnalyzeComponentStore & DISM /Online /Cleanup-Image /StartComponentCleanup & DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase & BOOTREC /FIXMBR & BOOTREC /FIXBOOT & BOOTREC /RebuildBcd & powershell Repair-WindowsImage -Online –CheckHealth & powershell Repair-WindowsImage -Online –ScanHealth & powershell Repair-WindowsImage -Online –RestoreHealth & powershell Repair-WindowsImage -Online –RestoreHealth /Source:%systemdrive%\RepairSource\install.wim & powershell Repair-WindowsImage -Online –RestoreHealth /Source:%systemdrive%\RepairSource\Windows /LimitAccess & powershell Repair-WindowsImage -Online –AnalyzeComponentStore & powershell Repair-WindowsImage -Online –StartComponentCleanup & powershell Repair-WindowsImage -Online –StartComponentCleanup /ResetBase
if exist "%userprofile%\TweakBox\data\e71.txt" sc start W32Time & sc config W32Time start= auto & w32tm /resync
if exist "%userprofile%\TweakBox\data\e72.txt" powershell "& {$manifest = (Get-AppxPackage Microsoft.WindowsStore).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}" & wsreset.exe
if exist "%userprofile%\TweakBox\data\e73.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t reg_dword /d 5 /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d73.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t reg_dword /d 0 /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e74.txt" reg add "hklm\SOFTWARE\Microsoft\OEM\Device\Capture" /v NoPhysicalCameraLED /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d74.txt" reg add "hklm\SOFTWARE\Microsoft\OEM\Device\Capture" /v NoPhysicalCameraLED /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e75.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
if exist "%userprofile%\TweakBox\data\d75.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
if exist "%userprofile%\TweakBox\data\e76.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
if exist "%userprofile%\TweakBox\data\d76.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
if exist "%userprofile%\TweakBox\data\e77.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
if exist "%userprofile%\TweakBox\data\d77.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
if exist "%userprofile%\TweakBox\data\e78.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
if exist "%userprofile%\TweakBox\data\d78.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
if exist "%userprofile%\TweakBox\data\e79.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
if exist "%userprofile%\TweakBox\data\d79.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
if exist "%userprofile%\TweakBox\data\e80.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
if exist "%userprofile%\TweakBox\data\d80.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
if exist "%userprofile%\TweakBox\data\e81.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f & reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
if exist "%userprofile%\TweakBox\data\d81.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f & reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
if exist "%userprofile%\TweakBox\data\e82.txt" reg add "hkcu\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d82.txt" reg add "hkcu\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e83.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode /f
if exist "%userprofile%\TweakBox\data\d83.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\e84.txt" reg add "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}" /d "Favorites" /f & reg add "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}" /v FolderValueFlags /t reg_dword /d 40 /f & reg add "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}" /v SortOrderIndex /t reg_dword /d 4 /f & reg add "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 1 /f & reg add "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v Attributes /t reg_dword /d 1879113728 /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{323CA680-C24D-4099-B94D-446DD2D7249E}" /f & reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {323CA680-C24D-4099-B94D-446DD2D7249E} /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d84.txt" reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{323CA680-C24D-4099-B94D-446DD2D7249E}" /f & reg delete "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {323CA680-C24D-4099-B94D-446DD2D7249E}" /f & reg delete "hkcu\Software\Classes\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}" /f
if exist "%userprofile%\TweakBox\data\e85.txt" reg add "hkcr\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d85.txt" reg add "hkcr\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e86.txt" reg add "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /d "Removable Drives" /f
if exist "%userprofile%\TweakBox\data\d86.txt" reg delete "hklm\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
if exist "%userprofile%\TweakBox\data\e87.txt" reg add "hkcu\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d87.txt" reg add "hkcu\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 0 /f
if exist "%userprofile%\TweakBox\data\e88.txt" reg add "hkcu\Software\Classes\CLSID\{E31EA727-12ED-4702-820C-4B6445F28E1A}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 1 /f
if exist "%userprofile%\TweakBox\data\d88.txt" reg add "hkcu\Software\Classes\CLSID\{E31EA727-12ED-4702-820C-4B6445F28E1A}" /v System.IsPinnedToNameSpaceTree /t reg_dword /d 0 /f
goto 5

:gamingconfig
echo ""> %userprofile%\TweakBox\data\e1.txt
echo ""> %userprofile%\TweakBox\data\d2.txt
echo ""> %userprofile%\TweakBox\data\e3.txt
echo ""> %userprofile%\TweakBox\data\d4.txt
echo ""> %userprofile%\TweakBox\data\d5.txt
echo ""> %userprofile%\TweakBox\data\d6.txt
echo ""> %userprofile%\TweakBox\data\d7.txt
echo ""> %userprofile%\TweakBox\data\d8.txt
echo ""> %userprofile%\TweakBox\data\d9.txt
echo ""> %userprofile%\TweakBox\data\d10.txt
echo ""> %userprofile%\TweakBox\data\d11.txt
echo ""> %userprofile%\TweakBox\data\c121.txt
echo ""> %userprofile%\TweakBox\data\d13.txt
echo ""> %userprofile%\TweakBox\data\e14.txt
echo ""> %userprofile%\TweakBox\data\d22.txt
echo ""> %userprofile%\TweakBox\data\d23.txt
echo ""> %userprofile%\TweakBox\data\d24.txt
echo ""> %userprofile%\TweakBox\data\d25.txt
echo ""> %userprofile%\TweakBox\data\d26.txt
echo ""> %userprofile%\TweakBox\data\d27.txt
echo ""> %userprofile%\TweakBox\data\d28.txt
echo ""> %userprofile%\TweakBox\data\e30.txt
echo ""> %userprofile%\TweakBox\data\d31.txt
echo ""> %userprofile%\TweakBox\data\d32.txt
echo ""> %userprofile%\TweakBox\data\d33.txt
echo ""> %userprofile%\TweakBox\data\d35.txt
echo ""> %userprofile%\TweakBox\data\d36.txt
echo ""> %userprofile%\TweakBox\data\d37.txt
echo ""> %userprofile%\TweakBox\data\d38.txt
echo ""> %userprofile%\TweakBox\data\e39.txt
echo ""> %userprofile%\TweakBox\data\e40.txt
echo ""> %userprofile%\TweakBox\data\d41.txt
echo ""> %userprofile%\TweakBox\data\d42.txt
echo ""> %userprofile%\TweakBox\data\d43.txt
echo ""> %userprofile%\TweakBox\data\d45.txt
echo ""> %userprofile%\TweakBox\data\d46.txt
echo ""> %userprofile%\TweakBox\data\d47.txt
echo ""> %userprofile%\TweakBox\data\d48.txt
echo ""> %userprofile%\TweakBox\data\d55.txt
echo ""> %userprofile%\TweakBox\data\d56.txt
echo ""> %userprofile%\TweakBox\data\d57.txt
echo ""> %userprofile%\TweakBox\data\c593.txt
echo ""> %userprofile%\TweakBox\data\d61.txt
echo ""> %userprofile%\TweakBox\data\e62.txt
echo ""> %userprofile%\TweakBox\data\d63.txt
echo ""> %userprofile%\TweakBox\data\d64.txt
echo ""> %userprofile%\TweakBox\data\d66.txt
echo ""> %userprofile%\TweakBox\data\e67.txt
echo ""> %userprofile%\TweakBox\data\e69.txt
echo ""> %userprofile%\TweakBox\data\e70.txt
echo ""> %userprofile%\TweakBox\data\d73.txt
echo ""> %userprofile%\TweakBox\data\d74.txt
goto 5

:workingconfig
echo ""> %userprofile%\TweakBox\data\d1.txt
echo ""> %userprofile%\TweakBox\data\e2.txt
echo ""> %userprofile%\TweakBox\data\e3.txt
echo ""> %userprofile%\TweakBox\data\e4.txt
echo ""> %userprofile%\TweakBox\data\d5.txt
echo ""> %userprofile%\TweakBox\data\d6.txt
echo ""> %userprofile%\TweakBox\data\d7.txt
echo ""> %userprofile%\TweakBox\data\d8.txt
echo ""> %userprofile%\TweakBox\data\e9.txt
echo ""> %userprofile%\TweakBox\data\e10.txt
echo ""> %userprofile%\TweakBox\data\e11.txt
echo ""> %userprofile%\TweakBox\data\c123.txt
echo ""> %userprofile%\TweakBox\data\d13.txt
echo ""> %userprofile%\TweakBox\data\e14.txt
echo ""> %userprofile%\TweakBox\data\e22.txt
echo ""> %userprofile%\TweakBox\data\e23.txt
echo ""> %userprofile%\TweakBox\data\e24.txt
echo ""> %userprofile%\TweakBox\data\e25.txt
echo ""> %userprofile%\TweakBox\data\e26.txt
echo ""> %userprofile%\TweakBox\data\e27.txt
echo ""> %userprofile%\TweakBox\data\e28.txt
echo ""> %userprofile%\TweakBox\data\d30.txt
echo ""> %userprofile%\TweakBox\data\e31.txt
echo ""> %userprofile%\TweakBox\data\e32.txt
echo ""> %userprofile%\TweakBox\data\e33.txt
echo ""> %userprofile%\TweakBox\data\d35.txt
echo ""> %userprofile%\TweakBox\data\e36.txt
echo ""> %userprofile%\TweakBox\data\d37.txt
echo ""> %userprofile%\TweakBox\data\d38.txt
echo ""> %userprofile%\TweakBox\data\e39.txt
echo ""> %userprofile%\TweakBox\data\e40.txt
echo ""> %userprofile%\TweakBox\data\d41.txt
echo ""> %userprofile%\TweakBox\data\d42.txt
echo ""> %userprofile%\TweakBox\data\d43.txt
echo ""> %userprofile%\TweakBox\data\e45.txt
echo ""> %userprofile%\TweakBox\data\d46.txt
echo ""> %userprofile%\TweakBox\data\d47.txt
echo ""> %userprofile%\TweakBox\data\d48.txt
echo ""> %userprofile%\TweakBox\data\e54.txt
echo ""> %userprofile%\TweakBox\data\e55.txt
echo ""> %userprofile%\TweakBox\data\e56.txt
echo ""> %userprofile%\TweakBox\data\e57.txt
echo ""> %userprofile%\TweakBox\data\c591.txt
echo ""> %userprofile%\TweakBox\data\d61.txt
echo ""> %userprofile%\TweakBox\data\d62.txt
echo ""> %userprofile%\TweakBox\data\d63.txt
echo ""> %userprofile%\TweakBox\data\d65.txt
echo ""> %userprofile%\TweakBox\data\d66.txt
echo ""> %userprofile%\TweakBox\data\d67.txt
echo ""> %userprofile%\TweakBox\data\e68.txt
echo ""> %userprofile%\TweakBox\data\e69.txt
echo ""> %userprofile%\TweakBox\data\e70.txt
echo ""> %userprofile%\TweakBox\data\e71.txt
echo ""> %userprofile%\TweakBox\data\e72.txt
echo ""> %userprofile%\TweakBox\data\e73.txt
echo ""> %userprofile%\TweakBox\data\e74.txt
goto 5

:7
set yyyy=%date:~10,4%
set mm=%date:~4,2%
set dd=%date:~7,2%
set hh=%time:~0,2%
if %hh% lss 10 (set hh=0%time:~1,1%)
set mm=%time:~3,2%
set ss=%time:~6,2%
set ms=%time:~9,2%
set time=%mm%/%dd%/%yyyy% %hh%:%mm%:%ss%
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                       Backup"
echo.
echo.
call :color 06 "                                [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Registry Backup" & call :color 06 "          [" & call :color 0f " 2" & call :color 06 " ]" & echo  System Restore
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 12bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 md %userprofile%\TweakBox\regbackup & goto regbackup1
if %o% == 2 goto systemrestore
if %o% == 3 goto 0
if %o% == 4 goto 0
if %o% == 5 goto exit


:systemrestore
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                   System Restore"
echo.
echo.
call :color 06 "                                    [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Enable" & call :color 06 "                  [" & call :color 0f " 2" & call :color 06 " ]" & echo  Disable
call :color 08 "                                       Default"
echo.
echo.
call :color 06 "                                              [" & call :color 0f " 3" & call :color 06 " ]" & echo  Open System Restore
echo.
echo.
call :color 06 "                         [" & call :color 0f " 4" & call :color 06 " ]" & call :color 0f " Create System Restore Point" & call :color 06 "     [" & call :color 0f " 5" & call :color 06 " ]" & echo  Delete All System Restore Point
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 12345bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 reg delete "hklm\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /f & goto systemrestore
if %o% == 2 reg add "hklm\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableConfig /t reg_dword /d 1 /f & reg add "hklm\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /t reg_dword /d 1 /f & goto systemrestore
if %o% == 3 rstrui.exe & goto systemrestore
if %o% == 4 cls & type %userprofile%\TweakBox\logo.txt & echo. & echo. & echo. & echo. & set /p name=Enter your System Restore Point name:  & cls & type %userprofile%\TweakBox\logo.txt & echo. & echo. & echo. & echo. & echo Waiting.. & wmic /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%name%", 100, 12 >nul & echo. & echo System Restore name is "%name%" & echo Choosing correct system restore point to backup & timeout 4 >nul & goto systemrestore
if %o% == 5 goto deletesystemrestore
if %o% == 6 goto 7
if %o% == 7 goto 0
if %o% == 8 goto exit

:deletesystemrestore
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
echo                                           Are you sure you want to delete?
echo.
echo.
call :color 06 "                                            [" & call :color 0f " Y" & call :color 06 " ]" & call :color 0f " Yes" & call :color 06 "           [" & call :color 0f " N" & call :color 06 " ]" & echo  No
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 04 "                                                      [ X ] Exit"
echo.
echo.
echo.
choice /c ynx /n /m ">>"
set o=%errorlevel%
if %o% == 1 vssadmin delete shadows /all /quiet >nul & goto systemrestore
if %o% == 2 goto systemrestore
if %o% == 3 goto exit

:regbackup1
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                   Registry Backup"
echo.
call :color 08 "                                         Make sure you choose correct number"
echo.
echo.
call :color 06 "                          [" & call :color 0f " C" & call :color 06 " ]" & call :color 0f "  Create Backup (max is 20)" & call :color 06 "          [" & call :color 0f " D" & call :color 06 " ]" & echo  Delete all Backup
echo.
echo                                                     Restore Point
dir %userprofile%\TweakBox\regbackup\0\0.txt >nul 2>&1
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\0\0.txt & dir %userprofile%\TweakBox\regbackup\1\1.txt >nul 2>&1) else (echo                                                  Not have any Backup & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fixnone)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\1\1.txt & dir %userprofile%\TweakBox\regbackup\2\2.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\2\2.txt & dir %userprofile%\TweakBox\regbackup\3\3.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\3\3.txt & dir %userprofile%\TweakBox\regbackup\4\4.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\4\4.txt & dir %userprofile%\TweakBox\regbackup\5\5.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\5\5.txt & dir %userprofile%\TweakBox\regbackup\6\6.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\6\6.txt & dir %userprofile%\TweakBox\regbackup\7\7.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\7\7.txt & dir %userprofile%\TweakBox\regbackup\8\8.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\8\8.txt & dir %userprofile%\TweakBox\regbackup\9\9.txt >nul 2>&1) else (echo. & echo. & echo. & goto regbackup1fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\9\9.txt & echo.) else (echo. & echo. & goto regbackup1fix)

:regbackup1fix
call :color 06 "                                                 [" & call :color 0f " N" & call :color 06 " ]" & echo  Next Page (1/2)
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c bcdn0123456789hx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 7
if %o% == 2 goto createbackup
if %o% == 3 goto deletebackup
if %o% == 4 set p=2 & goto regbackup2
if %o% == 5 set b=0 & goto restorebackup
if %o% == 6 set b=1 & goto restorebackup
if %o% == 7 set b=2 & goto restorebackup
if %o% == 8 set b=3 & goto restorebackup
if %o% == 9 set b=4 & goto restorebackup
if %o% == 10 set b=5 & goto restorebackup
if %o% == 11 set b=6 & goto restorebackup
if %o% == 12 set b=7 & goto restorebackup
if %o% == 13 set b=8 & goto restorebackup
if %o% == 14 set b=9 & goto restorebackup
if %o% == 15 goto 0
if %o% == 16 goto exit

:regbackup1fixnone
call :color 06 "                                                 [" & call :color 0f " N" & call :color 06 " ]" & echo  Next Page (1/2)
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c bcdnhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 7
if %o% == 2 goto createbackup
if %o% == 3 goto deletebackup
if %o% == 4 set p=2 & goto regbackup2
if %o% == 5 goto 0
if %o% == 6 goto exit

:regbackup2
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                   Registry Backup"
echo.
call :color 08 "                                         Make sure you choose correct number"
echo.
echo.
call :color 06 "                          [" & call :color 0f " C" & call :color 06 " ]" & call :color 0f "  Create Backup (max is 20)" & call :color 06 "          [" & call :color 0f " D" & call :color 06 " ]" & echo  Delete all Backup
echo.
echo                                                     Restore Point
dir %userprofile%\TweakBox\regbackup\10\10.txt >nul 2>&1
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\10\10.txt & dir %userprofile%\TweakBox\regbackup\11\11.txt >nul 2>&1) else (echo                                                  Not have any Backup & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fixnone)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\11\11.txt & dir %userprofile%\TweakBox\regbackup\12\12.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\12\12.txt & dir %userprofile%\TweakBox\regbackup\13\13.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\13\13.txt & dir %userprofile%\TweakBox\regbackup\14\14.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\14\14.txt & dir %userprofile%\TweakBox\regbackup\15\15.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\15\15.txt & dir %userprofile%\TweakBox\regbackup\16\16.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\16\16.txt & dir %userprofile%\TweakBox\regbackup\17\17.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\17\17.txt & dir %userprofile%\TweakBox\regbackup\18\18.txt >nul 2>&1) else (echo. & echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\18\18.txt & dir %userprofile%\TweakBox\regbackup\19\19.txt >nul 2>&1) else (echo. & echo. & echo. & goto regbackup2fix)
if %errorlevel% == 0 (type %userprofile%\TweakBox\regbackup\19\19.txt & echo.) else (echo. & echo. & goto regbackup2fix)

:regbackup2fix
call :color 06 "                                     [" & call :color 0f " P" & call :color 06 " ]" & call :color 0f "  Previous Page" & call :color 06 "     [" & call :color 0f " N" & call :color 06 " ]" & echo  Next Page (2/2)
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c bcdnp0123456789hx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 7
if %o% == 2 goto createbackup
if %o% == 3 goto deletebackup
if %o% == 4 set p=3 & goto regbackup3
if %o% == 5 set p=1 & goto regbackup1
if %o% == 6 set b=10 & goto restorebackup
if %o% == 7 set b=11 & goto restorebackup
if %o% == 8 set b=12 & goto restorebackup
if %o% == 9 set b=13 & goto restorebackup
if %o% == 10 set b=14 & goto restorebackup
if %o% == 11 set b=15 & goto restorebackup
if %o% == 12 set b=16 & goto restorebackup
if %o% == 13 set b=17 & goto restorebackup
if %o% == 14 set b=18 & goto restorebackup
if %o% == 15 set b=19 & goto restorebackup
if %o% == 16 goto 0
if %o% == 17 goto exit

:regbackup2fixnone
call :color 06 "                                     [" & call :color 0f " P" & call :color 06 " ]" & call :color 0f "  Previous Page" & call :color 06 "     [" & call :color 0f " N" & call :color 06 " ]" & echo  Next Page (2/2)
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c bcdnphx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 7
if %o% == 2 goto createbackup
if %o% == 3 goto deletebackup
if %o% == 4 set p=3 & goto regbackup3
if %o% == 5 set p=1 & goto regbackup1
if %o% == 6 goto 0
if %o% == 7 goto exit

:createbackup
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
set /p name=Enter your Registry Backup name: 
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
echo Waiting..
dir %userprofile%\TweakBox\regbackup\0\0.txt >nul 2>&1
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\1\1.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\0 & echo                       [0] 0. [%time%]  %name%> %userprofile%\TweakBox\regbackup\0\0.txt & reg export hkcr %userprofile%\TweakBox\regbackup\0\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\0\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\0\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\0\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\0\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\2\2.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\1 & echo                       [1] 1. [%time%]  %name%> %userprofile%\TweakBox\regbackup\1\1.txt & reg export hkcr %userprofile%\TweakBox\regbackup\1\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\1\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\1\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\1\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\1\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\3\3.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\2 & echo                       [2] 2. [%time%]  %name%> %userprofile%\TweakBox\regbackup\2\2.txt & reg export hkcr %userprofile%\TweakBox\regbackup\2\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\2\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\2\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\2\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\2\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\4\4.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\3 & echo                       [3] 3. [%time%]  %name%> %userprofile%\TweakBox\regbackup\3\3.txt & reg export hkcr %userprofile%\TweakBox\regbackup\3\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\3\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\3\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\3\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\3\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\5\5.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\4 & echo                       [4] 4. [%time%]  %name%> %userprofile%\TweakBox\regbackup\4\4.txt & reg export hkcr %userprofile%\TweakBox\regbackup\4\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\4\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\4\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\4\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\4\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\6\6.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\5 & echo                       [5] 5. [%time%]  %name%> %userprofile%\TweakBox\regbackup\5\5.txt & reg export hkcr %userprofile%\TweakBox\regbackup\5\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\5\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\5\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\5\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\5\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\7\7.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\6 & echo                       [6] 6. [%time%]  %name%> %userprofile%\TweakBox\regbackup\6\6.txt & reg export hkcr %userprofile%\TweakBox\regbackup\6\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\6\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\6\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\6\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\6\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\8\8.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\7 & echo                       [7] 7. [%time%]  %name%> %userprofile%\TweakBox\regbackup\7\7.txt & reg export hkcr %userprofile%\TweakBox\regbackup\7\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\7\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\7\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\7\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\7\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\9\9.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\8 & echo                       [8] 8. [%time%]  %name%> %userprofile%\TweakBox\regbackup\8\8.txt & reg export hkcr %userprofile%\TweakBox\regbackup\8\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\8\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\8\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\8\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\8\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\10\10.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\9 & echo                       [9] 9. [%time%]  %name%> %userprofile%\TweakBox\regbackup\9\9.txt & reg export hkcr %userprofile%\TweakBox\regbackup\9\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\9\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\9\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\9\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\9\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\11\11.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\10 & echo                       [0] 10. [%time%]  %name%> %userprofile%\TweakBox\regbackup\10\10.txt & reg export hkcr %userprofile%\TweakBox\regbackup\10\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\10\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\10\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\10\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\10\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\12\12.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\11 & echo                       [1] 11. [%time%]  %name%> %userprofile%\TweakBox\regbackup\11\11.txt & reg export hkcr %userprofile%\TweakBox\regbackup\11\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\11\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\11\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\11\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\11\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\13\13.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\12 & echo                       [2] 12. [%time%]  %name%> %userprofile%\TweakBox\regbackup\12\12.txt & reg export hkcr %userprofile%\TweakBox\regbackup\12\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\12\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\12\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\12\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\12\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\14\14.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\13 & echo                       [3] 13. [%time%]  %name%> %userprofile%\TweakBox\regbackup\13\13.txt & reg export hkcr %userprofile%\TweakBox\regbackup\13\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\13\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\13\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\13\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\13\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\15\15.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\14 & echo                       [4] 14. [%time%]  %name%> %userprofile%\TweakBox\regbackup\14\14.txt & reg export hkcr %userprofile%\TweakBox\regbackup\14\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\14\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\14\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\14\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\14\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\16\16.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\15 & echo                       [5] 15. [%time%]  %name%> %userprofile%\TweakBox\regbackup\15\15.txt & reg export hkcr %userprofile%\TweakBox\regbackup\15\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\15\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\15\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\15\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\15\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\17\17.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\16 & echo                       [6] 16. [%time%]  %name%> %userprofile%\TweakBox\regbackup\16\16.txt & reg export hkcr %userprofile%\TweakBox\regbackup\16\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\16\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\16\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\16\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\16\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\18\18.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\17 & echo                       [7] 17. [%time%]  %name%> %userprofile%\TweakBox\regbackup\17\17.txt & reg export hkcr %userprofile%\TweakBox\regbackup\17\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\17\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\17\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\17\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\17\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (dir %userprofile%\TweakBox\regbackup\19\19.txt >nul 2>&1) else (md %userprofile%\TweakBox\regbackup\18 & echo                       [8] 18. [%time%]  %name%> %userprofile%\TweakBox\regbackup\18\18.txt & reg export hkcr %userprofile%\TweakBox\regbackup\18\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\18\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\18\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\18\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\18\hkcc.reg /y & goto regbackup%p%)
if %errorlevel% == 0 (Max! Cannot create backup.. & timeout 2 >nul & goto regbackup%p%) else (md %userprofile%\TweakBox\regbackup\19 & echo                       [9] 19. [%time%]  %name%> %userprofile%\TweakBox\regbackup\19\19.txt & reg export hkcr %userprofile%\TweakBox\regbackup\19\hkcr.reg /y & reg export hkcu %userprofile%\TweakBox\regbackup\19\hkcu.reg /y & reg export hklm %userprofile%\TweakBox\regbackup\19\hklm.reg /y & reg export hku %userprofile%\TweakBox\regbackup\19\hku.reg /y & reg export hkcc %userprofile%\TweakBox\regbackup\19\hkcc.reg /y & goto regbackup%p%)

:restorebackup
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
echo                                           Are you sure you want to restore?
echo.
echo.
call :color 06 "                                            [" & call :color 0f " Y" & call :color 06 " ]" & call :color 0f " Yes" & call :color 06 "           [" & call :color 0f " N" & call :color 06 " ]" & echo  No
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 04 "                                                      [ X ] Exit"
echo.
echo.
echo.
choice /c ynx /n /m ">>"
set o=%errorlevel%
if %o% == 1 reg import %userprofile%\TweakBox\regbackup\%b%\hkcr.reg /y & reg import %userprofile%\TweakBox\regbackup\%b%\hkcu.reg /y & reg import %userprofile%\TweakBox\regbackup\%b%\hklm.reg /y & reg import %userprofile%\TweakBox\regbackup\%b%\hku.reg /y & reg import %userprofile%\TweakBox\regbackup\%b%\hkcc.reg /y & goto regbackup%p%
if %o% == 2 goto regbackup%p%
if %o% == 3 goto exit 

:deletebackup
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
echo                                           Are you sure you want to delete?
echo.
echo.
call :color 06 "                                            [" & call :color 0f " Y" & call :color 06 " ]" & call :color 0f " Yes" & call :color 06 "           [" & call :color 0f " N" & call :color 06 " ]" & echo  No
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 04 "                                                      [ X ] Exit"
echo.
echo.
echo.
choice /c ynx /n /m ">>"
set o=%errorlevel%
if %o% == 1 rd /s /q %userprofile%\TweakBox\regbackup & md %userprofile%\TweakBox\regbackup & goto regbackup1
if %o% == 2 goto regbackup1
if %o% == 3 goto exit

:8
cls
type %userprofile%\TweakBox\logo.txt
echo                                        __  _   __ ___  __          _     _     
echo                                   \  /^|__ ^|_^| (_   ^|  /  \ ^|\ ^|   / \   / \   /^|
echo                                    \/ ^|__ ^| \ __) _^|_ \__/ ^| \^|   \_/ o \_/ o  ^|
echo.
echo.
echo.
echo.
call :color 09 "                                                       More"
echo.
echo.
call :color 06 "                                  [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Support" & call :color 06 "                    [" & call :color 0f " 2" & call :color 06 " ]" & echo  PC Info
echo.
echo.
call :color 06 "                                             [" & call :color 0f " 3" & call :color 06 " ]" & echo  Open Task Manager
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 123bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto support
if %o% == 2 goto pcinfo
if %o% == 3 taskmgr
if %o% == 4 goto 0
if %o% == 5 goto 0
if %o% == 6 goto exit

:support
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                      Support"
echo.
echo.
echo    Run this script as administrator to make all features working successfully. I am not responsible for errors caused
echo    by this script so you have to create a "System Restore" to backup when you get error (type 7 in main menu). Keep
echo    in mind that not every tweaks can come back. You can visit my "Youtube", "Github", "Discord" to have more support
echo.
echo                  Subscribe my "Youtube" channel or donate me at "Github" to help this script grow up
echo.
echo.
call :color 06 "                                    [" & call :color 0f " 1" & call :color 06 " ]" & call :color 0f " Youtube" & call :color 06 "                    [" & call :color 0f " 2" & call :color 06 " ]" & echo  Discord
echo.
echo.
call :color 06 "                                                     [" & call :color 0f " 3" & call :color 06 " ]" & echo  Github
echo.
echo.
echo.
echo.
echo.
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c 123bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 start https://youtube.com/channel/UChvAuw39E3t2oOv9o8L2mOw & goto support
if %o% == 2 start https://discord.gg/7fbbJVRjvy & goto support
if %o% == 3 start https://github.com/tunganh643/TweakBox/releases & goto support
if %o% == 4 goto 8
if %o% == 5 goto 0
if %o% == 6 goto exit

:pcinfo
cls
type %userprofile%\TweakBox\logo.txt
echo.
echo.
echo.
echo.
call :color 09 "                                                      PC Info"
echo.
echo.
echo                                                     OS Version
echo                          Edition: %os% %build% (%bit%)
echo                          Model: %manufacturer% %model%
echo.
echo                                                        CPU
echo                          Name: %cpu%
echo                          Cores: %core% Processors: %processor%
echo                          Virtualization: %vt%
echo.
echo                                                        GPU
echo                          Name: %gpu%
echo.
echo                                                        RAM
echo                          Total Memory: %totalmem% MB
echo                          Used  Memory: %usedmem% MB
echo                          Available Memory: %availablemem% MB
echo.
call :color 0a "                                       [ B ] Back" & call :color 05 "     [ H ] Home" & call :color 04 "     [ X ] Exit"
echo.
echo.
echo.
choice /c bhx /n /m ">>"
set o=%errorlevel%
if %o% == 1 goto 8
if %o% == 2 goto 0
if %o% == 3 goto exit

:exit
del %userprofile%\TweakBox\logo.txt & exit

:color
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1