@echo off
setlocal EnableDelayedExpansion

title Network Access Control Simulation
color 0A

set "PROJECT=NAC_Simulation"
set "LOG=%PROJECT%\NAC_Authentication_Log.txt"

if not exist "%PROJECT%" mkdir "%PROJECT%"

if not exist "%LOG%" (
    echo ===================================================== > "%LOG%"
    echo NETWORK ACCESS CONTROL SIMULATION LOG >> "%LOG%"
    echo ===================================================== >> "%LOG%"
)

:MENU
cls

echo ============================================================
echo        NETWORK ACCESS CONTROL SIMULATION
echo ============================================================
echo.
echo  FreeRADIUS + pfSense CE + Ubuntu
echo.
echo ============================================================
echo.
echo  [1] Project Information
echo  [2] Check Windows Network
echo  [3] Test FreeRADIUS Server
echo  [4] Test pfSense Gateway
echo  [5] Test Protected Server
echo  [6] Authorized User Simulation
echo  [7] Unauthorized User Simulation
echo  [8] View Authentication Log
echo  [9] Create Project Report
echo  [0] Exit
echo.
echo ============================================================
set /p choice=Enter your choice: 

if "%choice%"=="1" goto INFO
if "%choice%"=="2" goto NETWORK
if "%choice%"=="3" goto RADIUS
if "%choice%"=="4" goto PFSENSE
if "%choice%"=="5" goto PROTECTED
if "%choice%"=="6" goto AUTHORIZED
if "%choice%"=="7" goto UNAUTHORIZED
if "%choice%"=="8" goto LOG
if "%choice%"=="9" goto REPORT
if "%choice%"=="0" goto EXIT

echo Invalid choice.
pause
goto MENU


:INFO
cls
echo ============================================================
echo PROJECT INFORMATION
echo ============================================================
echo.
echo Project : Network Access Control Simulation
echo Category: Blue Team / Network Security
echo.
echo Technologies:
echo   - FreeRADIUS
echo   - pfSense CE
echo   - Ubuntu
echo   - VMware/VirtualBox
echo.
echo Objective:
echo Implement authentication-based network access
echo using open-source NAC concepts.
echo.
echo Architecture:
echo.
echo Client
echo    ^|
echo    v
echo pfSense CE
echo    ^|
echo    v
echo FreeRADIUS - Ubuntu
echo    ^|
echo    v
echo Authentication
echo.
pause
goto MENU


:NETWORK
cls
echo ============================================================
echo WINDOWS NETWORK INFORMATION
echo ============================================================
echo.

ipconfig /all

echo.
echo ============================================================
echo ROUTING INFORMATION
echo ============================================================

route print

echo.
pause
goto MENU


:RADIUS
cls
echo ============================================================
echo FREERADIUS SERVER TEST
echo ============================================================
echo.

set /p RADIUS_IP=Enter Ubuntu/FreeRADIUS IP address: 

echo.
echo Testing %RADIUS_IP%...
echo.

ping -n 4 %RADIUS_IP%

if errorlevel 1 (
    echo.
    echo [FAILED] FreeRADIUS server is unreachable.
    echo %date% %time% - RADIUS SERVER - FAILED - %RADIUS_IP% >> "%LOG%"
) else (
    echo.
    echo [SUCCESS] FreeRADIUS server is reachable.
    echo %date% %time% - RADIUS SERVER - SUCCESS - %RADIUS_IP% >> "%LOG%"
)

echo.
pause
goto MENU


:PFSENSE
cls
echo ============================================================
echo PFSENSE GATEWAY TEST
echo ============================================================
echo.

set /p PFSENSE_IP=Enter pfSense LAN IP address: 

echo.
echo Testing pfSense...
echo.

ping -n 4 %PFSENSE_IP%

if errorlevel 1 (
    echo.
    echo [FAILED] pfSense is unreachable.
    echo %date% %time% - PFSENSE - FAILED - %PFSENSE_IP% >> "%LOG%"
) else (
    echo.
    echo [SUCCESS] pfSense is reachable.
    echo %date% %time% - PFSENSE - SUCCESS - %PFSENSE_IP% >> "%LOG%"
)

echo.
pause
goto MENU


:PROTECTED
cls
echo ============================================================
echo PROTECTED NETWORK TEST
echo ============================================================
echo.

set /p TARGET_IP=Enter protected server IP address: 

echo.
echo Testing protected network...
echo.

ping -n 4 %TARGET_IP%

if errorlevel 1 (
    echo.
    echo [BLOCKED / UNREACHABLE]
    echo %date% %time% - PROTECTED NETWORK - BLOCKED - %TARGET_IP% >> "%LOG%"
) else (
    echo.
    echo [ACCESSIBLE]
    echo Protected network is reachable.
    echo %date% %time% - PROTECTED NETWORK - ACCESSIBLE - %TARGET_IP% >> "%LOG%"
)

echo.
pause
goto MENU


:AUTHORIZED
cls
echo ============================================================
echo AUTHORIZED USER SIMULATION
echo ============================================================
echo.

set /p USERNAME=Username: 
set /p PASSWORD=Password: 

echo.
echo Authenticating...
timeout /t 2 >nul

if "%USERNAME%"=="student" if "%PASSWORD%"=="student123" (

    echo.
    echo ========================================================
    echo                 ACCESS GRANTED
    echo ========================================================
    echo.
    echo User       : %USERNAME%
    echo Authentication: SUCCESS
    echo Network Access: ALLOWED
    echo.
    
    echo %date% %time% - USER=%USERNAME% - AUTHENTICATION=SUCCESS - ACCESS=GRANTED >> "%LOG%"

) else (

    echo.
    echo ========================================================
    echo                 ACCESS DENIED
    echo ========================================================
    echo.
    echo Invalid credentials.
    
    echo %date% %time% - USER=%USERNAME% - AUTHENTICATION=FAILED - ACCESS=DENIED >> "%LOG%"
)

echo.
pause
goto MENU


:UNAUTHORIZED
cls
echo ============================================================
echo UNAUTHORIZED USER SIMULATION
echo ============================================================
echo.

set /p USERNAME=Username: 
set /p PASSWORD=Password: 

echo.
echo Checking credentials...
timeout /t 2 >nul

if "%USERNAME%"=="student" if "%PASSWORD%"=="student123" (

    echo.
    echo [WARNING]
    echo Valid credentials detected.
    echo Access would be granted.

    echo %date% %time% - USER=%USERNAME% - TEST=AUTHORIZED >> "%LOG%"

) else (

    echo.
    echo ========================================================
    echo                  ACCESS DENIED
    echo ========================================================
    echo.
    echo Unauthorized user blocked.

    echo %date% %time% - USER=%USERNAME% - AUTHENTICATION=FAILED - ACCESS=DENIED >> "%LOG%"
)

echo.
pause
goto MENU


:LOG
cls
echo ============================================================
echo AUTHENTICATION LOG
echo ============================================================
echo.

type "%LOG%"

echo.
pause
goto MENU


:REPORT
cls
echo ============================================================
echo CREATING PROJECT REPORT
echo ============================================================

(
echo ============================================================
echo NETWORK ACCESS CONTROL SIMULATION
echo ============================================================
echo.
echo Objective:
echo Implement authentication-based network access using
echo open-source Network Access Control concepts.
echo.
echo Technologies:
echo FreeRADIUS
echo pfSense CE
echo Ubuntu
echo VMware / VirtualBox
echo.
echo Security Features:
echo - RADIUS authentication
echo - User authentication
echo - Access control
echo - Firewall policy
echo - Protected network
echo - Authentication logging
echo.
echo Test User:
echo Username: student
echo Password: student123
echo.
echo Authentication Log:
type "%LOG%"
) > "%PROJECT%\NAC_Project_Report.txt"

echo.
echo Report created successfully.
echo.
echo Location:
echo %PROJECT%\NAC_Project_Report.txt
echo.
pause
goto MENU


:EXIT
cls
echo ============================================================
echo NETWORK ACCESS CONTROL SIMULATION
echo ============================================================
echo.
echo Project session completed.
echo.
echo Log saved at:
echo %LOG%
echo.
pause
exit