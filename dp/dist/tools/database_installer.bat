@echo off
REM �M�z
if exist ..\game\data\stats\skills\10000-10099.xml del ..\game\data\stats\skills\10000-10099.xml
if exist ..\game\data\stats\skills\27000-Add.xml del ..\game\data\stats\skills\27000-Add.xml
if exist ..\game\data\stats\skills\27000-Subclass.xml del ..\game\data\stats\skills\27000-Subclass.xml
if exist ..\game\data\stats\skills\27001-Item.xml del ..\game\data\stats\skills\27001-Item.xml
if exist ..\game\data\stats\skills\27004-Transfor.xml del ..\game\data\stats\skills\27004-Transfor.xml
if exist ..\game\data\stats\skills\27010-Other.xml del ..\game\data\stats\skills\27010-Other.xml
if exist ..\game\data\stats\items\50003-Cloak.xml del ..\game\data\stats\items\50003-Cloak.xml
if exist ..\game\data\stats\items\50004-Other.xml del ..\game\data\stats\items\50004-Other.xml
if exist ..\game\data\stats\npcs\50000-New.xml del ..\game\data\stats\npcs\50000-New.xml
if exist ..\sql\L2JTW_2\item_tw.sql del ..\sql\L2JTW_2\item_tw.sql
if exist ..\sql\L2JTW_2\npc_tw.sql del ..\sql\L2JTW_2\npc_tw.sql
if exist ..\sql\L2JTW_2\skill_tw.sql del ..\sql\L2JTW_2\skill_tw.sql

REM �ˬd�O�_�s�b GS �䴩��������T
set dp_err=0
if not exist ..\doc\L2J_Server_Ver.txt echo �S���o�{ GS �䴩��������T�I
if not exist ..\doc\L2J_Server_Ver.txt echo �ЦA�@���G��s GS �� �sĶ GS �� �����Y GS �� �]�w Config
if not exist ..\doc\L2J_Server_Ver.txt echo.
if not exist ..\doc\L2J_Server_Ver.txt pause
if not exist ..\doc\L2J_Server_Ver.txt goto end
REM ���o GS �䴩��������T
FOR /F %%g IN (..\doc\L2J_Server_Ver.txt) DO set vgs=%%g
REM �ˬd GS �䴩��������T
if not %vgs% == Ertheia echo �L�k�~��w�� DP�A�]���G
if not %vgs% == Ertheia echo GS �䴩�������O�G%vgs%
if not %vgs% == Ertheia echo DP �䴩�������O�GErtheia
if not %vgs% == Ertheia echo �нT�w GS �M DP ���ϥάۦP��������A�A�դ@��
if not %vgs% == Ertheia echo.
if not %vgs% == Ertheia pause
if not %vgs% == Ertheia goto end

REM �\�໡���G�C�j�@�q�ɶ��R�� libs �M�֨��A�H���� GS �X��
if not exist ..\libs\*.jar echo �z�������s�����Y�u�sĶ�����v�� GS�A�~�i�H�~��w�˸�Ʈw
if not exist ..\libs\*.jar echo.
if not exist ..\libs\*.jar pause
if not exist ..\libs\*.jar exit

REM �p�G libs �֨����s�b�A�����٨S���ҰʹL���A���A�h���L�ˬd
if not exist ..\game\cachedir\ md ..\game\cachedir\
if not exist ..\game\cachedir\packages\*.pkc goto _lib_update

REM �p�G log ���s�b�A�����٨S���ҰʹL���A���A�h���L�ˬd
if not exist ..\game\log\*.log goto _lib_update

REM ------------------------------------------------------
REM _lib_check1 ���ˬd �}�l
REM �p�G Windows �� CMD ������T�w�s�b�A�h�����ˬd1
if exist ..\game\cachedir\check_w_ver.txt goto _lib_check1

REM �p�G Windows �� CMD ������T���s�b�A�h�إ߸�T
ver > ..\game\cachedir\check_w_ver.txt
goto _lib_del

:_lib_check1
REM ���o�ثe�� Windows CMD ������T
ver > %temp%\check.txt
FOR /F "skip=1 delims=*" %%a IN (%temp%\check.txt) do set aaa=%%a

REM ���o�w�s�b�� Windows CMD ������T
FOR /F "skip=1 delims=*" %%b IN (..\game\cachedir\check_w_ver.txt) do set bbb=%%b

REM ��� Windows �� CMD ������T
if "%aaa%"=="%bbb%" goto _start_lib_check2
echo �]���z�� Windows ��������s�A�ҥH�����R���ª� libs �M�֨��A�H���� GS �X��
echo.
pause
goto _lib_del
REM _lib_check1 ���ˬd ����
REM ------------------------------------------------------

REM ------------------------------------------------------
:_start_lib_check2
REM _lib_check2 ���ˬd �}�l
REM �p�G Java ���|���s�b�A�h����U�@���ˬd
REM �Ȱ� _start_lib_check3 �o���ˬd if not exist "%ProgramFiles%\Java\jdk1.8.*" goto _start_lib_check3
if not exist "%ProgramFiles%\Java\jdk1.8.*" goto _lib_end

REM �p�G Java ������T�w�s�b�A�h�����ˬd2
if exist ..\game\cachedir\check_j_ver.txt goto _lib_check2

REM �p�G Java ������T���s�b�A�h�إ߸�T
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > ..\game\cachedir\check_j_ver.txt
goto _lib_del

:_lib_check2
REM ���o�ثe�� Java ������T
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > %temp%\check.txt
FOR /F %%j IN (%temp%\check.txt) DO set jjj=%%j

REM ���o�w�s�b�� Java ������T
FOR /F %%k IN (..\game\cachedir\check_j_ver.txt) do set kkk=%%k

REM ��� Java ������T
REM �Ȱ� _start_lib_check3 �o���ˬd if "%jjj%"=="%kkk%" goto _start_lib_check3
if "%jjj%"=="%kkk%" goto _lib_end
echo �]���z�� Java ��������s�A�ҥH�����R���ª� libs �M�֨��A�H���� GS �X��
echo.
pause
goto _lib_del
REM _lib_check2 ���ˬd ����
REM ------------------------------------------------------

REM ------------------------------------------------------
:_start_lib_check3
REM _lib_check3 ���ˬd �}�l
REM �p�G ���-��� ����T�w�s�b�A�h�����ˬd3
if exist ..\game\cachedir\check_d_ver.txt goto _lib_check3

REM �p�G ���-��� ����T���s�b�A�h�إ߸�T
date/t > ..\game\cachedir\check_d_ver.txt
goto _lib_del

:_lib_check3
REM ���o�ثe�� ���-��� ��T
date/t > %temp%\check.txt
FOR /F "tokens=2 delims=/" %%d IN (%temp%\check.txt) DO set ddd=%%d

REM ���o�w�s�b�� ���-��� ��T
FOR /F "tokens=2 delims=/" %%m IN (..\game\cachedir\check_d_ver.txt) do set mmm=%%m

REM ��� ���-��� ��T
if "%ddd%"=="%mmm%" goto _lib_end
echo �����C�Ӥ�۰ʲM�z�ª� libs �M�֨��A�H���� GS �X��
echo.
pause
goto _lib_del
REM _lib_check3 ���ˬd ����
REM ------------------------------------------------------

REM ------------------------------------------------------
:_lib_del
echo.
if not exist ..\libs\backup\ md ..\libs\backup\
copy ..\libs\*.* ..\libs\backup\ /Y > nul
del ..\libs\*.* /F /Q > nul
del ..\game\cachedir\packages\*.* /F /Q > nul
if exist ..\libs\*.jar echo �L�k�R�� libs �M�֨��I�Х��������A���έ��s�}���A�M��A�դ@��
if exist ..\libs\*.jar echo.
if exist ..\libs\*.jar pause
if exist ..\libs\*.jar exit
if exist ..\game\cachedir\packages\*.pkc echo �L�k�R�� libs �M�֨��I�Х��������A���έ��s�}���A�M��A�դ@��
if exist ..\game\cachedir\packages\*.pkc echo.
if exist ..\game\cachedir\packages\*.pkc pause
if exist ..\game\cachedir\packages\*.pkc exit
ver > ..\game\cachedir\check_w_ver.txt
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > ..\game\cachedir\check_j_ver.txt
date/t > ..\game\cachedir\check_d_ver.txt
CLS
echo �ª� libs �M�֨��M�z�����I
echo �z�������s�����Y�u�sĶ�����v�� GS�A�~�i�H�~��w�˸�Ʈw
echo.
pause
exit

:_lib_update
ver > ..\game\cachedir\check_w_ver.txt
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > ..\game\cachedir\check_j_ver.txt
date/t > ..\game\cachedir\check_d_ver.txt

:_lib_end
REM ------------------------------------------------------

REM ##############################################
REM ## L2JDP Database Installer - (by DrLecter) ##
REM ##############################################
REM ## Interactive script setup -  (by TanelTM) ##
REM ##############################################
REM Copyright (C) 2004-2013 L2J DataPack
REM
REM This file is part of L2J DataPack.
REM
REM L2J DataPack is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM
REM L2J DataPack is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
REM General Public License for more details.
REM
REM You should have received a copy of the GNU General Public License
REM along with this program. If not, see <http://www.gnu.org/licenses/>.

set config_file=vars.txt
set config_version=0

set workdir="%cd%"
set full=0
set stage=0-1
set logging=0

set upgrade_mode=0
set backup=.
set logdir=.
set safe_mode=1
set cmode=c
set fresh_setup=0

:loadconfig
cls
title �w�� L2JTW DP - Ū���]�w��...�]���q %stage%�^
if not exist %config_file% goto configure
ren %config_file% vars.bat
call vars.bat
ren vars.bat %config_file%
call :colors 17
if /i %config_version% == 2 goto ls_backup
set upgrade_mode=2
echo �z���G�O�Ĥ@���ϥγo�Ӫ����� database_installer
echo ���O�ڵo�{�w�˸�Ʈw���]�w�ɤw�g�s�b
echo �]���ڱN�ݱz�X�Ӱ��D�A�޾ɱz�~��w��
echo.
echo ��s�]�w�ﶵ�G
echo.
echo (1) �ɤJ���~��ϥ��ª��]�w�G�N�ϥέ쥻�ª���ƨåB�i���s�@�~
echo.
echo (2) �ɤJ���ϥηs���]�w�G�ɤJ�s����ƨåB���s�]�w���
echo.
echo (3) �ɤJ���s����ơG�Ҧ��ª���ƱN�|�����åB�ɤJ�s�����
echo.
echo (4) �d�ݦs�����]�w��
echo.
echo (5) �h�X
echo.
set /P upgrade_mode="��J�Ʀr��A�Ы� Enter�]�w�]�Ȭ��u%upgrade_mode%�v�^: "
if %upgrade_mode%==1 goto ls_backup
if %upgrade_mode%==2 goto configure
if %upgrade_mode%==3 goto configure
if %upgrade_mode%==4 (cls&type %config_file%&pause&goto loadconfig)
if %upgrade_mode%==5 goto :eof
goto loadconfig

:colors
if /i "%cmode%"=="n" (
if not "%1"=="17" (	color F	) else ( color )
) else ( color %1 )
goto :eof

:configure
cls
call :colors 17
set stage=0-2
title �w�� L2JTW DP - �w�ˡ]���q %stage%�^
set config_version=2
if NOT %upgrade_mode% == 2 (
set fresh_setup=1
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.0\bin

:_MySQL51
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.1\bin\mysql.exe" goto _MySQL55
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.1\bin

:_MySQL55
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.5\bin\mysql.exe" goto _MySQL56
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.5\bin

:_MySQL56
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.6\bin\mysql.exe" goto _MySQL60
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.6\bin

:_MySQL60
if not exist "%ProgramFiles%\MySQL\MySQL Server 6.0\bin\mysql.exe" goto _AppServ
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 6.0\bin

:_AppServ
if not exist "%SystemDrive%\AppServ\MySQL\bin\mysql.exe" goto _other
set mysqlBinPath=%SystemDrive%\AppServ\MySQL\bin

:_other
set lsuser=root
set lspass=
set lsdb=l2jls_ertheia
set lshost=localhost
set cbuser=root
set cbpass=
set cbdb=l2jcs
set cbhost=localhost
set gsuser=root
set gspass=
set gsdb=l2jgs_ertheia
set gshost=localhost
set cmode=c
set backup=.
set logdir=.
)
set mysqlPath=%mysqlBinPath%\mysql.exe
echo �s���]�w�ȡG
echo.
echo 1.MySql �{��
echo --------------------
echo �г]�w mysql.exe �M mysqldump.exe ����m
echo.
if "%mysqlBinPath%" == "" (
set mysqlBinPath=use path
echo �S����� MySQL ����m
) else (
echo �д��եH�U�ҧ�쪺 MySQL ��m�A�O�_�i�H�i��ɤJ�@�~
echo.
echo %mysqlPath%
)
if not "%mysqlBinPath%" == "use path" call :binaryfind
echo.
path|find "MySQL">NUL
if %errorlevel% == 0 (
echo �W���O��쪺 MySQL�A����m�N�|�Q�]���w�]�ȡA�p�G�Q����m�Эק�...
set mysqlBinPath=use path
) else (
echo �L�k��� MySQL�A�п�J mysql.exe ����m...
echo.
echo �p�G���T�w�o�O����N��M�p��ާ@�A�Ш���������d�ߩΪ̦� L2JTW �x������o�ݩδM�������T
)
echo.
echo �п�J mysql.exe ����m�G
set /P mysqlBinPath="(default %mysqlBinPath%): "
cls
echo.
echo 2.�u�n�J���A���v�]�w
echo --------------------
echo ���@�~�N�|�s�u�ܡu�n�J���A���v�� MySQL ���A���A�åB�i��ɤJ�@�~
echo.
set /P lsuser="�ϥΪ̦W�١]�w�]�ȡu%lsuser%�v�^: "
:_lspass
set /P lspass="�ϥΪ̱K�X�]�w�]�ȡu%lspass%�v�^: "
if "%lspass%"=="" goto _lspass
set /P lsdb="��Ʈw�]�w�]�ȡu%lsdb%�v�^: "
set /P lshost="��m�]�w�]�ȡu%lshost%�v�^: "
echo.
cls
echo.
echo 3-�u�Q�ת����A���v�]�w
echo --------------------
echo ���@�~�N�|�s�u�ܡu�Q�ת����A���v�� MySQL ���A���A�åB�i��ɤJ�@�~
echo.
set /P cbuser="�ϥΪ̦W�١]�w�]�ȡu%cbuser%�v�^: "
:_cbpass
set /P cbpass="�ϥΪ̱K�X�]�w�]�ȡu%cbpass%�v�^: "
if "%cbpass%"=="" goto _cbpass
set /P cbdb="��Ʈw�]�w�]�ȡu%cbdb%�v�^: "
set /P cbhost="��m�]�w�]�ȡu%cbhost%�v�^: "
echo.
cls
echo.
echo 4.�u�C�����A���v�]�w
echo --------------------
echo ���@�~�N�|�s�u�ܡu�C�����A���v�� MySQL ���A���A�åB�i��ɤJ�@�~
set /P gsuser="�ϥΪ̦W�١]�w�]�ȡu%gsuser%�v�^: "
:_gspass
set /P gspass="�ϥΪ̱K�X�]�w�]�ȡu%gspass%�v�^: "
if "%gspass%"=="" goto _gspass
set /P gsdb="��Ʈw�]�w�]�ȡu%gsdb%�v�^: "
set /P gshost="��m�]�w�]�ȡu%gshost%�v�^: "
echo.
cls
echo.
echo 5.��L�]�w
echo --------------------
set /P cmode="�C��Ҧ� (c)���C�� �� (n)���L�C��]�w�]�ȡu%cmode%�v�^: "
set /P backup="�ƥ���m�]�w�]�ȡu%backup%�v�^: "
set /P logdir="Logs�T����m�]�w�]�ȡu%logdir%�v�^: "
:safe1
set safemode=y
set /P safemode="Debug �Ҧ��]y/n�A �w�]�ȡu%safemode%�v�^: "
if /i %safemode%==y (set safe_mode=1&goto safe2)
if /i %safemode%==n (set safe_mode=0&goto safe2)
goto safe1

:safe2
cls
echo.
if "%mysqlBinPath%" == "use path" (
set mysqlBinPath=
set mysqldumpPath=mysqldump
set mysqlPath=mysql
) else (
set mysqldumpPath=%mysqlBinPath%\mysqldump.exe
set mysqlPath=%mysqlBinPath%\mysql.exe
)
echo @echo off > %config_file%
echo set config_version=%config_version% >> %config_file%
echo set cmode=%cmode%>> %config_file%
echo set safe_mode=%safe_mode% >> %config_file%
echo set mysqlPath=%mysqlPath%>> %config_file%
echo set mysqlBinPath=%mysqlBinPath%>> %config_file%
echo set mysqldumpPath=%mysqldumpPath%>> %config_file%
echo set lsuser=%lsuser%>> %config_file%
echo set lspass=%lspass%>> %config_file%
echo set lsdb=%lsdb%>> %config_file%
echo set lshost=%lshost% >> %config_file%
echo set cbuser=%cbuser%>> %config_file%
echo set cbpass=%cbpass%>> %config_file%
echo set cbdb=%cbdb%>> %config_file%
echo set cbhost=%cbhost% >> %config_file%
echo set gsuser=%gsuser%>> %config_file%
echo set gspass=%gspass%>> %config_file%
echo set gsdb=%gsdb%>> %config_file%
echo set gshost=%gshost%>> %config_file%
echo set logdir=%logdir%>> %config_file%
echo set backup=%backup%>> %config_file%
echo.
echo �]�w���\�I
echo �A���]�w�ȱN�|�x�s�b�u%config_file%�v�A�Ҧ����b���K�X�N�H�������
echo.
pause
goto loadconfig

:ls_backup
cls
call :colors 17
set cmdline=
set stage=1-1
title �w�� L2JTW DP - �ƥ��u�n�J���A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�ƥ��u�n�J���A���v����Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %lshost% -u %lsuser% --password=%lspass% %lsdb% ^> "%backup%\ls_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto ls_db_ok

:ls_err1
cls
set lsdbprompt=y
call :colors 47
set stage=1-2
title �w�� L2JTW DP - �u�n�J���A���v����Ʈw�ƥ����ѡI�]���q %stage%�^
echo.
echo �ƥ����ѡI
echo ��]�O�]���u�n�J���A���v����Ʈw���s�b
echo �{�b�i�H���A�إ� %lsdb%�A�Ϊ��~��䥦�]�w
echo.
echo �إߡu�n�J���A���v����Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p lsdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %lsdbprompt%==y goto ls_db_create
if /i %lsdbprompt%==n goto cs_backup
if /i %lsdbprompt%==r goto configure
if /i %lsdbprompt%==q goto end
goto ls_err1

:ls_db_create
cls
call :colors 17
set cmdline=
set stage=2-1
title �w�� L2JTW DP - �إߡu�n�J���A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�إߡu�n�J���A���v����Ʈw...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -e "CREATE DATABASE %lsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto ls_db_ok
if %safe_mode% == 1 goto omfg

:ls_err2
cls
set omfgprompt=q
call :colors 47
set stage=2-2
title �w�� L2JTW DP - �u�n�J���A���v����Ʈw�إߥ��ѡI�]���q %stage%�^
echo.
echo �u�n�J���A���v����Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%lsuser%�v���v������
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==c goto cs_backup
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto ls_err2

:ls_db_ok
cls
set loginprompt=u
call :colors 17
set stage=2-3
title �w�� L2JTW DP - �u�n�J���A���v����Ʈw�]���q %stage%�^
echo.
echo �w�ˡu�n�J���A���v����Ʈw�G
echo.
echo (f) ����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (u) ��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s) �ٲ��G���L���ﶵ
echo.
echo (r) ���s�]�w
echo.
echo (q) �h�X
echo.
set /p loginprompt=�п�ܡ]�w�]��-��s�^:
if /i %loginprompt%==f goto ls_cleanup
if /i %loginprompt%==u goto ls_upgrade
if /i %loginprompt%==s goto cs_backup
if /i %loginprompt%==r goto configure
if /i %loginprompt%==q goto end
goto ls_db_ok

:ls_cleanup
call :colors 17
set cmdline=
set stage=2-4
title �w�� L2JTW DP - ����w�ˡu�n�J���A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�����u�n�J���A���v����Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< ls_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u�n�J���A���v��Ʈw�w�Q�R��
goto ls_install

:ls_upgrade
cls
echo.
echo ��s�u�n�J���A���v��Ʈw���c
echo.
echo @echo off> temp.bat
if exist ls_errors.log del ls_errors.log
for %%i in (..\sql\login\updates\*.sql) do echo "%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% --force ^< %%i 2^>^> ls_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move ls_errors.log %workdir%
goto ls_install

:ls_install
cls
set cmdline=
if %full% == 1 (
set stage=2-5
title �w�� L2JTW DP - �w�ˡu�n�J���A���v����Ʈw...�]���q %stage%�^
echo.
echo �w�˷s���u�n�J���A���v����Ʈw���e
echo.
) else (
title �w�� L2JTW DP - ��s�u�n�J���A���v����Ʈw...�]���q %stage%�^
echo.
echo ��s�u�n�J���A���v����Ʈw���e
echo.
)
if %logging% == 0 set output=NUL
set dest=ls
for %%i in (..\sql\login\*.sql) do call :dump %%i

echo ����...
echo.
goto cs_backup

:cs_backup
cls
call :colors 17
set cmdline=
set stage=3-1
title �w�� L2JTW DP - �ƥ��u�Q�ת����A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�ƥ��u�Q�ת����A���v����Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %cbhost% -u %cbuser% --password=%cbpass% %cbdb% ^> "%backup%\cs_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cs_db_ok

:cs_err1
cls
set cbdbprompt=y
call :colors 47
set stage=3-2
title �w�� L2JTW DP - �u�Q�ת����A���v����Ʈw�ƥ����ѡI�]���q %stage%�^
echo.
echo �ƥ����ѡI
echo ��]�O�]���u�Q�ת����A���v����Ʈw���s�b
echo �{�b�i�H���A�إ� %cbdb%�A�Ϊ��~��䥦�]�w
echo.
echo �إߡu�Q�ת����A���v����Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p cbdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %cbdbprompt%==y goto cs_db_create
if /i %cbdbprompt%==n goto gs_backup
if /i %cbdbprompt%==r goto configure
if /i %cbdbprompt%==q goto end
goto cs_err1

:cs_db_create
cls
call :colors 17
set cmdline=
set stage=4-1
title �w�� L2JTW DP - �إߡu�Q�ת����A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�إߡu�Q�ת����A���v����Ʈw...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -e "CREATE DATABASE %cbdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cs_db_ok
if %safe_mode% == 1 goto omfg

:cs_err2
cls
set omfgprompt=q
call :colors 47
set stage=4-2
title �w�� L2JTW DP - �u�Q�ת����A���v����Ʈw�إߥ��ѡI�]���q %stage%�^
echo.
echo �u�Q�ת����A���v����Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%cbuser%�v���v������
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==c goto gs_backup
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto cs_err2

:cs_db_ok
cls
set communityprompt=u
call :colors 17
set stage=4-3
title �w�� L2JTW DP - �u�Q�ת����A���v����Ʈw�]���q %stage%�^
echo.
echo �w�ˡu�Q�ת����A���v����Ʈw�G
echo.
echo (f)����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (u)��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s)�ٲ��G���L���ﶵ
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p communityprompt=�п�ܡ]�w�]��-��s�^:
if /i %communityprompt%==f goto cs_cleanup
if /i %communityprompt%==u goto cs_upgrade
if /i %communityprompt%==s goto gs_backup
if /i %communityprompt%==r goto configure
if /i %communityprompt%==q goto end
goto cs_db_ok

:cs_cleanup
call :colors 17
set cmdline=
set stage=4-4
title �w�� L2JTW DP - ����w�ˡu�Q�ת����A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�����u�Q�ת����A���v����Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< cs_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u�Q�ת����A���v����Ʈw�w�Q�R��
goto cs_install

:cs_upgrade
cls
echo.
echo ��s�u�Q�ת����A���v����Ʈw���c
echo.
echo @echo off> temp.bat
if exist cs_errors.log del cs_errors.log
for %%i in (..\sql\community\updates\*.sql) do echo "%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% --force ^< %%i 2^>^> cs_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move cs_errors.log %workdir%
goto cs_install

:cs_install
cls
set cmdline=
if %full% == 1 (
set stage=4-5
title �w�� L2JTW DP - �w�ˡu�Q�צ��A���v����Ʈw...�]���q %stage%�^
echo.
echo �w�˷s���u�Q�ת����A���v����Ʈw���e...
echo.
) else (
title �w�� L2JTW DP - ��s�u�Q�צ��A���v����Ʈw..�]���q %stage%�^
echo.
echo ��s�u�Q�ת����A���v����Ʈw���e...
echo.
)
if %logging% == 0 set output=NUL
set dest=cb
for %%i in (..\sql\community\*.sql) do call :dump %%i

echo done...
echo.
goto gs_backup

:gs_backup
cls
call :colors 17
set cmdline=
set stage=5-1
title �w�� L2JTW DP - �ƥ��u�C�����A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�ƥ��u�C�����A���v����Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %gshost% -u %gsuser% --password=%gspass% %gsdb% ^> "%backup%\gs_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gs_db_ok

:gs_err1
cls
set gsdbprompt=y
call :colors 47
set stage=5-2
title �w�� L2JTW DP - �u�C�����A���v����Ʈw�ƥ����ѡI�]���q %stage%�^
echo.
echo �ƥ����ѡI
echo ��]�O�]���u�C�����A���v����Ʈw���s�b
echo �{�b�i�H���A�إ� %gsdb%�A�Ϊ��~��䥦�]�w
echo.
echo �إߡu�C�����A���v����Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p gsdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %gsdbprompt%==y goto gs_db_create
if /i %gsdbprompt%==n goto eof
if /i %gsdbprompt%==r goto configure
if /i %gsdbprompt%==q goto end
goto gs_err1

:gs_db_create
cls
call :colors 17
set stage=6-1
set cmdline=
title �w�� L2JTW DP - �إߡu�C�����A���v����ơ]���q %stage%�^
echo.
echo ���b�إߡu�C�����A���v����Ʈw...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -e "CREATE DATABASE %gsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gs_db_ok
if %safe_mode% == 1 goto omfg

:gs_err2
cls
set omfgprompt=q
call :colors 47
set stage=6-2
title �w�� L2JTW DP - �u�C�����A���v����Ʈw�إߥ��ѡI�]���q %stage%�^
echo.
echo �u�C�����A���v����Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%gsuser%�v���v������
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto gs_err2

:gs_db_ok
cls
set installtype=u
call :colors 17
set stage=6-3
title �w�� L2JTW DP - �u�C�����A���v����Ʈw�]���q %stage%�^
echo.
echo �w�ˡu�C�����A���v����Ʈw�G
echo.
echo (f)����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (u)��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s)�ٲ��G���L���ﶵ
echo.
echo (q)�h�X
echo.
set /p installtype=�п�ܡ]�w�]��-��s�^:
if /i %installtype%==f goto gs_cleanup
if /i %installtype%==u goto gs_upgrade
if /i %installtype%==s goto custom_ask
if /i %installtype%==q goto end
goto gs_db_ok

:gs_cleanup
call :colors 17
set cmdline=
set stage=6-4
title �w�� L2JTW DP - ����w�ˡu�C�����A���v����Ʈw�]���q %stage%�^
echo.
echo ���b�����u�C�����A���v����Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< gs_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u�C�����A���v����Ʈw�w�Q�R��
goto gs_install

:gs_upgrade
cls
echo.
echo ��s�u�C�����A���v����Ʈw���c
echo.
echo @echo off> temp.bat
if exist gs_errors.log del gs_errors.log
for %%i in (..\sql\game\updates\*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% --force ^< %%i 2^>^> gs_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move gs_errors.log %workdir%
goto gs_install

:gs_install
cls
set cmdline=
if %full% == 1 (
set stage=6-5
title �w�� L2JTW DP - �w�ˡu�C�����A���v����Ʈw...�]���q %stage%�^
echo.
echo �w�˷s���u�C�����A���v����Ʈw���e
echo.
) else (
title �w�� L2JTW DP - ��s�u�C�����A���v����Ʈw...�]���q %stage%�^
echo.
echo ��s�u�C�����A���v����Ʈw���e
echo.
)
if %logging% == 0 set output=NUL
set dest=gs
for %%i in (..\sql\game\*.sql) do call :dump %%i
for %%i in (..\sql\game\mods\*.sql) do call :dump %%i
for %%i in (..\sql\game\custom\*.sql) do call :dump %%i
for %%i in (..\sql\L2JTW\*.sql) do call :dump %%i

echo ����...
echo.
set charprompt=y
set /p charprompt=�w�ˡuNPC/���~/�ޯ൥�W�١v�����: (y) �T�w �� (N) �����H�]�w�]��-�T�w�^:
if /i %charprompt%==n goto custom_ask
for %%i in (..\sql\L2JTW_2\*.sql) do call :dump %%i
echo ����...
echo.
echo ���`�N�G�����t�Φw�ˤ���Ʒ|���ѡA�ɭP�C�����X�{�ýX
echo �@�@�@�@�p�G�J��o�ر��ΡA�ЦA��ʾɤJ SQL �̭���
echo �@�@�@�@skill_tw / item_tw / messagetable �o 3 �� SQL
goto custom_ask

:dump
set cmdline=
if /i %full% == 1 (set action=�w��) else (set action=��s)
echo %action% %1>>"%output%"
echo %action% %~nx1
if "%dest%"=="ls" set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< %1 2^>^>"%output%"
if "%dest%"=="cb" set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< %1 2^>^>"%output%"
if "%dest%"=="gs" set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %1 2^>^>"%output%"
%cmdline%
if %logging%==0 if NOT %ERRORLEVEL%==0 call :omfg2 %1
goto :eof

:omfg2
REM ------------------------------------------------------
REM ��Ʈw�w�˹L�{���o�Ϳ��~
set dp_err=2
echo ��Ʈw�w�˹L�{���o�Ϳ��~�GErtheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
cls
set ntpebcak=c
call :colors 47
title �w�� L2JTW DP - ���q %stage% �o�Ϳ��~
echo.
echo �X�{���~�G
echo %mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb%
echo.
echo �ɮ� %~nx1
echo.
echo �B�z�覡�H
echo.
echo (l)�x�s���~�T���A�H��K�d��
echo.
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p ntpebcak=�п�ܡ]�w�]��-�~��^:
if /i %ntpebcak%==c (call :colors 17 & goto :eof)
if /i %ntpebcak%==l (call :logginon %1 & goto :eof)
if /i %ntpebcak%==r set dp_err=0
if /i %ntpebcak%==r (call :configure & exit)
if /i %ntpebcak%==q (call :end)
goto omfg2

:logginon
cls
call :colors 17
title �w�� L2JTW DP - �x�s���~�T��
set logging=1
if %full% == 1 (
  set output=%logdir%\install-%~nx1.log
) else (
  set output=%logdir%\upgrade-%~nx1.log
)
echo.
echo �ǳ��x�s���~�T��
echo.
echo �ɮ׬��u%output%�v
echo.
echo �p�G���ɮפw�s�b�A�жi��ƥ��A�_�h�N�|�л\�L�h
echo.
pause
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^<..\sql\%1 2^>^>"%output%"
date /t >"%output%"
time /t >>"%output%"
%cmdline%
echo �x�s���~�T��...
call :colors 17
set logging=0
set output=NUL
goto :eof

:custom_ask
set stage=7
title �w�� L2JTW DP - custom �ۭq��ƪ��]���q %stage%�^
cls
set cstprompt=y
echo.
echo custom �ۭq��ƪ��[�J��Ʈw����
echo �Ҧ����~�T���N�x�s�b�ucustom_errors.log�v
echo.
echo �Ъ`�N�A�p�G�n�ϳo�Ǧۭq��ƪ�����ҥ�
echo �A�����ק� config ���ɮ׳]�w
echo.
set /p cstprompt=�w�� custom �ۭq��ƪ�: (y) �T�w �� (N) �����]�w�]��-�T�w�^:
if /i %cstprompt%==y goto custom_install
if /i %cstprompt%==n goto mod_ask

:custom_install
cls
echo.
echo �w�� custom �ۭq���e
echo @echo off> temp.bat
if exist custom_errors.log del custom_errors.log
for %%i in (..\sql\game\custom\*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> custom_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move custom_errors.log %workdir%
goto mod_ask

:mod_ask
set stage=8
title �w�� L2JTW DP - Mod �ۭq��ƪ��]���q %stage%�^
cls
set cstprompt=y
echo.
echo Mod �ۭq��ƪ��[�J��Ʈw����
echo �Ҧ����~��T�N��J�umod_errors.log�v
echo.
echo �Ъ`�N�A�p�G�n�ϳo�Ǧۭq��ƪ�����ҥ�
echo �A�����ק� config ���ɮ׳]�w
echo.
echo.
set /p cstprompt=�w�� Mods �ۭq��ƪ�: (y) �T�w �� (N) �����]�w�]��-�T�w�^:
if /i %cstprompt%==y goto mod_install
if /i %cstprompt%==n goto end

:mod_install
cls
echo.
echo �w�� Mods �ۭq���e
echo @echo off> temp.bat
if exist mods_errors.log del mods_errors.log
for %%i in (..\sql\game\mods\*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> mods_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move mods_errors.log %workdir%
REM ------------------------------------------------------
REM ��Ʈw�w�˧���
if %dp_err% == 0 set dp_err=1
REM ------------------------------------------------------
goto end

:omfg
REM ------------------------------------------------------
REM ��Ʈw�w�˹L�{���o�Ϳ��~
set dp_err=2
echo ��Ʈw�w�˹L�{���o�Ϳ��~�GErtheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
set omfgprompt=q
call :colors 57
cls
title �w�� L2JTW DP - ���q %stage% �o�Ϳ��~
echo.
echo ����ɥX�{���~�G
echo.
echo "%cmdline%"
echo.
echo ��ĳ�ˬd�@�U�]�w����ơA�H�T�O�Ҧ���J���ƭȨS�����~�I
echo.
if %stage% == 1 set label=ls_err1
if %stage% == 2 set label=ls_err2
if %stage% == 3 set label=cs_err1
if %stage% == 4 set label=cs_err2
if %stage% == 5 set label=gs_err1
if %stage% == 6 set label=gs_err2
echo.
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==c goto %label%
if /i %omfgprompt%==r set dp_err=0
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto omfg

:binaryfind
if EXIST "%mysqlBinPath%" (echo ��쪺 MySQL) else (echo �S����� MySQL�A�Цb�U����J���T����m...)
goto :eof

:end
REM ------------------------------------------------------
REM �x�s DP �䴩��������T
if %dp_err% == 0 echo ��Ʈw�w�˥������GErtheia> ..\doc\L2J_DataPack_Ver.txt
if %dp_err% == 1 echo Ertheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
call :colors 17
title �w�� L2JTW DP - ����
cls
echo.
echo L2JTW DP �w�˧���
echo.
echo �P�¨ϥ� L2JTW ���A��
echo ������T�i�H�b http://www.l2jtw.com �d�ߨ�
echo.
pause