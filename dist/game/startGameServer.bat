@echo off
title Game Server Console
REM ------------------------------------------------------
REM �ˬd�O�_�s�b DP �䴩��������T
if not exist ..\doc\L2J_DataPack_Ver.txt echo DP �S�����T�������sĶ�I
if not exist ..\doc\L2J_DataPack_Ver.txt echo �ЦA�@���G��s DP �� �sĶ DP �� �����Y DP �� �w�˸�Ʈw
if not exist ..\doc\L2J_DataPack_Ver.txt echo.
if not exist ..\doc\L2J_DataPack_Ver.txt pause
if not exist ..\doc\L2J_DataPack_Ver.txt exit
REM ���o DP �䴩��������T
FOR /F %%g IN (..\doc\L2J_DataPack_Ver.txt) DO set vdp=%%g
REM �ˬd DP �䴩��������T
if not %vdp% == Ertheia echo �L�k�~�������A���A�]���G
if not %vdp% == Ertheia echo GS �䴩�������O�GErtheia
if not %vdp% == Ertheia echo DP �䴩�������O�G%vdp%
if not %vdp% == Ertheia echo �нT�w GS �M DP ���ϥάۦP��������A�A�դ@��
if not %vdp% == Ertheia echo.
if not %vdp% == Ertheia pause
if not %vdp% == Ertheia exit
REM ------------------------------------------------------
REM �R���w�g�F�� 90 �ӥH�W�� log (�]���F�� 100 �ӫ�,GS�N�|�X��)
if not exist log\backup\ md log\backup\
if exist log\accounting*.log.90* (
copy log\accounting*.* log\backup\ /Y > nul
del log\accounting*.* /F /Q > nul
)
if exist log\chat*.log.90* (
copy log\chat*.* log\backup\ /Y > nul
del log\chat*.* /F /Q > nul
)
if exist log\error*.log.90* (
copy log\error*.* log\backup\ /Y > nul
del log\error*.* /F /Q > nul
)
if exist log\item*.log.90* (
copy log\item*.* log\backup\ /Y > nul
del log\item*.* /F /Q > nul
)
if exist log\java*.log.90* (
copy log\java*.* log\backup\ /Y > nul
del log\java*.* /F /Q > nul
)
if exist log\olympiad*.csv.90* (
copy log\olympiad*.* log\backup\ /Y > nul
del log\olympiad*.* /F /Q > nul
)
REM ------------------------------------------------------

call :init
:: ----- �]�w java �O����ζq�Ψ�L�Ѽ� -----
set javaheap_Xms=1024m
set javaheap_Xmx=1536m

set java_param=com.l2jserver.gameserver.GameServer
set java_param=-cp "%iii%libs\*";"%LLL%l2jserver.jar" %java_param%
set java_param=-Xms%javaheap_Xms% -Xmx%javaheap_Xmx% %java_param%
:: set java_param=-XX:PermSize=50m %java_param%
:: set java_param=-XX:MaxPermSize=100m %java_param%
set java_param=-XX:+UseParNewGC %java_param%
set java_param=-XX:+CMSParallelRemarkEnabled %java_param%
set java_param=-XX:+UseConcMarkSweepGC %java_param%
set java_param=-Djava.util.logging.manager=com.l2jserver.util.L2LogManager %java_param%
:: set java_param=-Djava.util.logging.manager=com.l2jserver.util.L2LogManager -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseParNewGC -XX:+UseCMSCompactAtFullCollection -XX:+CMSIncrementalMode -Xms%javaheap% -Xmx%javaheap% -cp "%iii%libs\*";"%LLL%l2jserver.jar" com.l2jserver.gameserver.GameServer
goto start

:init
set LLL=%~dp0
::FOR /F "delims=game" %%i IN ("%LLL%") do set iii=%%i
set iii=%LLL:~0,-5%
call :check_libs
call :try_java
goto :eof

:check_libs
REM ------------------------------------------------------
if not exist ..\libs\*.jar (
	echo �z�������s�����Y�u�sĶ�����v�� GS�A�~�i�H�~�����
	echo.
	pause
	exit
)
goto :eof
REM ------------------------------------------------------

:check_java
if "%found%"=="1" goto :eof
if not exist %1 goto :eof
set found=1
set PATH=%~dp1
echo �ϥ� java ��m %path%
echo.
goto :eof

:set_java
echo �j�M java ��m
call :check_java "%ProgramW6432%\Java\jre8\bin\java.exe"
call :check_java "%ProgramFiles%\Java\jre8\bin\java.exe"
call :check_java "%ProgramFiles(x86)%\Java\jre8\bin\java.exe"
if not exist "%ProgramW6432%\Java\j*1.8.*" goto _next_set_x64
dir "%ProgramW6432%\Java\j*1.8.*" /A:D /B /O > %temp%\check.txt
FOR /F %%j IN (%temp%\check.txt) DO set ver=%%j
call :check_java "%ProgramFiles%\Java\%ver%\bin\java.exe"
:_next_set_x64
if not exist "%ProgramFiles%\Java\j*1.8.*" goto _next_set_x86
dir "%ProgramFiles%\Java\j*1.8.*" /A:D /B /O > %temp%\check.txt
FOR /F %%j IN (%temp%\check.txt) DO set ver=%%j
call :check_java "%ProgramFiles%\Java\%ver%\bin\java.exe"
:_next_set_x86
if not exist "%ProgramFiles(x86)%\Java\j*1.8.*" goto _next_set_java
dir "%ProgramFiles(x86)%\Java\j*1.8.*" /A:D /B /O > %temp%\check.txt
FOR /F %%j IN (%temp%\check.txt) DO set ver=%%j
call :check_java "%ProgramFiles(x86)%\Java\%ver%\bin\java.exe"
:_next_set_java
call :check_java "%windir%\system32\java.exe"
if "%found%"=="" (
	echo �䤣�� java.exe
	echo �Х��w�� java 1.8
	echo �U���Φw�˥i�Ѧҽ׾�
	echo http://www.l2jtw.com/l2jtwbbs/viewtopic.php?f=42^&t=6264
	echo.
	pause
	exit
)
goto :eof

:try_java
java -version:1.8 -cp "%iii%libs\*";"%LLL%l2jserver.jar" com.l2jserver.JavaTest
if not %ERRORLEVEL% == 0 call :set_java
goto :eof

:start
echo Starting L2J Game Server.
echo.

java %java_param%

REM NOTE: If you have a powerful machine, you could modify/add some extra parameters for performance, like:
REM -Xms1536m
REM -Xmx3072m
REM -XX:+AggressiveOpts
REM Use this parameters carefully, some of them could cause abnormal behavior, deadlocks, etc.
REM More info here: http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html

if ERRORLEVEL 2 goto restart
if ERRORLEVEL 1 goto error
goto end

:restart
echo.
echo Admin Restarted Game Server.
echo.
goto start

:error
echo.
echo Game Server Terminated Abnormally!
echo.

:end
echo.
echo Game Server Terminated.
echo.
pause