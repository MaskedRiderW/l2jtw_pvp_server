@echo off
REM �N���[���A�b�v
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

REM GS�o�[�W�����T�|�[�g�����m�F���Ă�������
set dp_err=0
if not exist ..\doc\L2J_Server_Ver.txt echo GS�́A�o�[�W�������̃T�|�[�g���������܂���ł����I
if not exist ..\doc\L2J_Server_Ver.txt echo ������x���Ă��������F�R���t�B�OGS ���R���p�C���� GS��GS ���Z�b�g���X�V
if not exist ..\doc\L2J_Server_Ver.txt echo.
if not exist ..\doc\L2J_Server_Ver.txt pause
if not exist ..\doc\L2J_Server_Ver.txt goto end
REM GS�̃o�[�W�������x���𓾂�
FOR /F %%g IN (..\doc\L2J_Server_Ver.txt) DO set vgs=%%g
REM GS�`�F�b�N�o�[�W���������T�|�[�g
if not %vgs% == Ertheia echo �C���X�g�[���𑱍s���邱�Ƃ��ł��܂���DP �A���R�F
if not %vgs% == Ertheia echo �T�|�[�gGS�̃o�[�W�����͎��̂Ƃ���ł��B�F%vgs%
if not %vgs% == Ertheia echo DP DP�ł��T�|�[�g����Ă��܂��FErtheia
if not %vgs% == Ertheia echo GS��DP�͓����o�[�W�������g�p���Ă��邱�Ƃ��m�F���A�ēx���s���Ă�������
if not %vgs% == Ertheia echo.
if not %vgs% == Ertheia pause
if not %vgs% == Ertheia goto end

REM �@�\�F����I�ɃG���[GS��h�~���邽�߂̃��C�u������L���b�V�����폜
if not exist ..\libs\*.jar echo �����̓C���X�g�[���f�[�^�x�[�X�𑱍s����ɂ́A���O�ɁA GS�́u�R���p�C�����ꂽ�v - �𓀂��ēx���Ȃ���΂Ȃ�Ȃ�
if not exist ..\libs\*.jar echo.
if not exist ..\libs\*.jar pause
if not exist ..\libs\*.jar exit

REM ���C�u�����L���b�V�������݂��Ȃ��ꍇ�́A�T�[�o���N�����Ă��Ȃ��Əq�ׁA���̌�`�F�b�N���X�L�b�v
if not exist ..\game\cachedir\ md ..\game\cachedir\
if not exist ..\game\cachedir\packages\*.pkc goto _lib_update

REM ���O�����݂��Ȃ��ꍇ�́A�T�[�o���N�����Ă��Ȃ��Əq�ׁA���̌�`�F�b�N���X�L�b�v
if not exist ..\game\log\*.log goto _lib_update

REM ------------------------------------------------------
REM _lib_check1�`�F�b�N���n�܂�
REM Windows��CMD���̃o�[�W���������łɑ��݂���ꍇ�́A�`�F�b�N���X�L�b�v
if exist ..\game\cachedir\check_w_ver.txt goto _lib_check1

REM Windows��CMD���̃o�[�W���������݂��Ȃ��ꍇ�́A���̊m��
ver > ..\game\cachedir\check_w_ver.txt
goto _lib_del

:_lib_check1
REM Windows��CMD�j���[�X�̌��݂̃o�[�W�������擾����
ver > %temp%\check.txt
FOR /F "skip=1 delims=*" %%a IN (%temp%\check.txt) do set aaa=%%a

REM Windows��CMD�̃o�[�W������񂪂��łɑ��݂�����
FOR /F "skip=1 delims=*" %%b IN (..\game\cachedir\check_w_ver.txt) do set bbb=%%b

REM Windows��CMD�j���[�X�̃o�[�W�������r
if "%aaa%"=="%bbb%" goto _start_lib_check2
echo Windows�̃o�[�W�������X�V����Ă���̂ŁA���̂悤�ɌÂ����C�u������G���[��GS��h�~���邽�߂̃L���b�V�����폜����K�v������܂�
echo.
pause
goto _lib_del
REM _lib_check1�`�F�b�N�I��
REM ------------------------------------------------------

REM ------------------------------------------------------
:_start_lib_check2
REM _lib_check2�`�F�b�N���n�܂�
REM Java�p�X�����݂��Ȃ��ꍇ�́A���̌����ɃX�L�b�v
REM ���݂��Ȃ��ꍇ�́A���̃`�F�b�N��_start_lib_check3�ꎞ��~ "%ProgramFiles%\Java\jdk1.8.*" goto _start_lib_check3
if not exist "%ProgramFiles%\Java\jdk1.8.*" goto _lib_end

REM Java�̃o�[�W������񂪊��ɑ��݂���ꍇ�A��̃`�F�b�N�X�L�b�v
if exist ..\game\cachedir\check_j_ver.txt goto _lib_check2

REM Java�o�[�W�������́A���̐ݒ肪���݂��Ȃ��ꍇ
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > ..\game\cachedir\check_j_ver.txt
goto _lib_del

:_lib_check2
REM Java�̃j���[�X�̌��݂̃o�[�W�������擾����
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > %temp%\check.txt
FOR /F %%j IN (%temp%\check.txt) DO set jjj=%%j

REM ��񂪂��łɑ��݂��Ă���Java�̃o�[�W�������擾
FOR /F %%k IN (..\game\cachedir\check_j_ver.txt) do set kkk=%%k

REM Java�̃o�[�W���������r
REM �^�C���A�E�g _start_lib_check3 ���̃`�F�b�N if "%jjj%"=="%kkk%" goto _start_lib_check3
if "%jjj%"=="%kkk%" goto _lib_end
echo ���g����Java�̃o�[�W�������X�V�����̂ŁA���Ȃ��̓G���[GS��h�����߂ɁA�Â����C�u�����ƃL���b�V�����폜����K�v������܂�
echo.
pause
goto _lib_del
REM _lib_check2 �I�����m�F���Ă�������
REM ------------------------------------------------------

REM ------------------------------------------------------
:_start_lib_check3
REM _lib_check3�`�F�b�N���n�܂�
REM ���t����� - ���łɑ��݂��Ă�����̌��́A3�̃`�F�b�N�X�L�b�v
if exist ..\game\cachedir\check_d_ver.txt goto _lib_check3

REM ���̏�񂪑��݂��Ȃ��A���̐ݒ� - ���t�������
date/t > ..\game\cachedir\check_d_ver.txt
goto _lib_del

:_lib_check3
REM ���݂̓��t���擾���� - ���̃j���[�X
date/t > %temp%\check.txt
FOR /F "tokens=2 delims=/" %%d IN (%temp%\check.txt) DO set ddd=%%d

REM �����̃j���[�X - ���łɑ��݂��Ă�����t���擾����
FOR /F "tokens=2 delims=/" %%m IN (..\game\cachedir\check_d_ver.txt) do set mmm=%%m

REM ���t�̔�r - ���̃j���[�X
if "%ddd%"=="%mmm%" goto _lib_end
echo ����́A���A�Â����C�u������G���[��GS��h�~���邽�߂ɁA�L���b�V���̎����N���[���A�b�v����܂��B
echo.
pause
goto _lib_del
REM _lib_check3 �`�F�b�N�I��
REM ------------------------------------------------------

REM ------------------------------------------------------
:_lib_del
echo.
if not exist ..\libs\backup\ md ..\libs\backup\
copy ..\libs\*.* ..\libs\backup\ /Y > nul
del ..\libs\*.* /F /Q > nul
del ..\game\cachedir\packages\*.* /F /Q > nul
if exist ..\libs\*.jar echo ���Ȃ��́A���C�u�����ƃL���b�V�����폜���邱�Ƃ͂ł��܂���I�T�[�o�[�̓d�����I�t�ɂ�����ċN�����A�ēx���s���Ă�������
if exist ..\libs\*.jar echo.
if exist ..\libs\*.jar pause
if exist ..\libs\*.jar exit
if exist ..\game\cachedir\packages\*.pkc echo ���Ȃ��́A���C�u�����ƃL���b�V�����폜���邱�Ƃ͂ł��܂���I�T�[�o�[�̓d�����I�t�ɂ�����ċN�����A�ēx���s���Ă�������
if exist ..\game\cachedir\packages\*.pkc echo.
if exist ..\game\cachedir\packages\*.pkc pause
if exist ..\game\cachedir\packages\*.pkc exit
ver > ..\game\cachedir\check_w_ver.txt
dir "%ProgramFiles%\Java\jdk1.8.*" /A:D /B /O > ..\game\cachedir\check_j_ver.txt
date/t > ..\game\cachedir\check_d_ver.txt
CLS
echo �Â����C�u�����ƃL���b�V���̓N���A�I
echo �����̓C���X�g�[���f�[�^�x�[�X�𑱍s����ɂ́A���O�ɁAGS�́u�R���p�C�����ꂽ�v - �𓀂��ēx���Ȃ���΂Ȃ�Ȃ�
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
title �C���X�g�[��L2JTW DP - �v���t�@�C��������...�i�X�e�[�W %stage%�j
if not exist %config_file% goto configure
ren %config_file% vars.bat
call vars.bat
ren vars.bat %config_file%
call :colors 17
if /i %config_version% == 2 goto ls_backup
set upgrade_mode=2
echo ���Ȃ��́A���̃o�[�W�������g�p����ŏ��̂悤�Ɍ����� database_installer
echo �������A���́A�C���X�g�[���v���t�@�C���f�[�^�x�[�X�����łɑ��݂��Ă��邪������܂���
echo �����玄�͂��Ȃ��ɂ�������������āA�C���X�g�[���𑱍s���Ă��ē��v���܂�
echo.
echo �A�b�v�f�[�g�ݒ�I�v�V�����F
echo.
echo (1) �C���|�[�g&�Â��ݒ���p�����Ďg�p����F���̃f�[�^�̎g�p�ƌÂ��d�����X�V
echo.
echo (2) �C���|�[�g���V�����ݒ�F�V�����f�[�^�ƍĐݒ肳�ꂽ�f�[�^���C���|�[�g���܂�
echo.
echo (3) �V�����f�[�^���C���|�[�g�F���ׂĂ̌Â��f�[�^�͍폜����A�V�����f�[�^���C���|�[�g���܂�
echo.
echo (4) �\���A�N�Z�X�ݒ�l
echo.
echo (5) �ޏo
echo.
set /P upgrade_mode="�ԍ�����͂�����A[Enter]�L�[�������܂��i�f�t�H���g�́u%upgrade_mode%�v�j: "
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
title �C���X�g�[�� L2JTW DP - �C���X�g�[���i�X�e�[�W %stage%�j
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
echo �V�����Z�b�g�|�C���g�F
echo.
echo 1.MySql �v���O����
echo --------------------
echo �ݒ肵mysql.exe��mysqldump.exe�̏ꏊ
echo.
if "%mysqlBinPath%" == "" (
set mysqlBinPath=use path
echo MySQL�̂̏ꏊ���������܂���ł���
) else (
echo �W���u���C���|�[�g���邱�Ƃ��ł��邩�ǂ����A�e�X�g�̏ꏊ�����L��MySQL��������
echo.
echo %mysqlPath%
)
if not "%mysqlBinPath%" == "use path" call :binaryfind
echo.
path|find "MySQL">NUL
if %errorlevel% == 0 (
echo ��L��MySQL�Ŕ�������A���̈ʒu�ł́A�ꏊ��ύX�������ꍇ�͕ύX���Ă��������A�f�t�H���g�l�ɐݒ肳��܂�...
set mysqlBinPath=use path
) else (
echo MySQL�������邱�Ƃ��ł��Ȃ��Amysql.exe�ʒu����͂��Ă�������...
echo.
echo ���ꂪ�����Ӗ����邩�Ƒ�����@���킩��Ȃ��ꍇ�́A�����������A�֘A������������邽�߂Ɍ����T�C�g��L2JTW���߂ɃE�F�u�T�C�g�܂��͊֘A�ɃA�N�Z�X���Ă�������
)
echo.
echo mysql.exe�ꏊ����͂��Ă��������F
set /P mysqlBinPath="(default %mysqlBinPath%): "
cls
echo.
echo 2.�u���O�C���T�[�o�v�̐ݒ�
echo --------------------
echo ���̃W���u�́AMySQL�T�[�o����уC���|�[�g����́u���O�C���T�[�o�v�ɐڑ����܂�
echo.
set /P lsuser="���[�U�[���i�f�t�H���g�u%lsuser%�v�j: "
:_lspass
set /P lspass="���[�U�p�X���[�h�i�f�t�H���g�u%lspass%�v�j: "
if "%lspass%"=="" goto _lspass
set /P lsdb="�f�[�^�x�[�X�i�f�t�H���g�u%lsdb%�v�j: "
set /P lshost="���P�[�V�����i�f�t�H���g�u%lshost%�v�j: "
echo.
cls
echo.
echo 3-�u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̐ݒ�
echo --------------------
echo ���̃W���u�́A�u�f�B�X�J�b�V�����{�[�h�T�[�o�v�A����уC���|�[�g�����MySQL�T�[�o�[�ɐڑ����܂�
echo.
set /P cbuser="���[�U�[���i�f�t�H���g�u%cbuser%�v�j: "
:_cbpass
set /P cbpass="���[�U�p�X���[�h�i�f�t�H���g�u%cbpass%�v�j: "
if "%cbpass%"=="" goto _cbpass
set /P cbdb="�f�[�^�x�[�X�i�f�t�H���g�u%cbdb%�v�j: "
set /P cbhost="���P�[�V�����i�f�t�H���g�u%cbhost%�v�j: "
echo.
cls
echo.
echo 4.�u�Q�[���T�[�o�v�̐ݒ�
echo --------------------
echo ���̃W���u�́AMySQL�T�[�o�u�Q�[���T�[�o�v�ɐڑ����A�C���|�[�g����ɂȂ�
set /P gsuser="���[�U�[���i�f�t�H���g�u%gsuser%�v�j: "
:_gspass
set /P gspass="���[�U�p�X���[�h�i�f�t�H���g�u%gspass%�v�j: "
if "%gspass%"=="" goto _gspass
set /P gsdb="�f�[�^�x�[�X�i�f�t�H���g�u%gsdb%�v�j: "
set /P gshost="���P�[�V�����i�f�t�H���g�u%gshost%�v�j: "
echo.
cls
echo.
echo 5.���̑��̐ݒ�
echo --------------------
set /P cmode="�J���[���[�h�J���[�ic�j�F���Ȃ��in�j�i�f�t�H���g�u%cmode%�v�j: "
set /P backup="�o�b�N�A�b�v�̏ꏊ�i�f�t�H���g�u%backup%�v�j: "
set /P logdir="���O���b�Z�[�W�̏ꏊ�i�f�t�H���g�u%logdir%�v�j: "
:safe1
set safemode=y
set /P safemode="�f�o�b�O���[�h�iY / N�A�f�t�H���g�u%safemode%�v�j: "
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
echo �ݒ萬���I
echo ���Ȃ��̐ݒ�́u%config_file%�v�ɕۑ�����܂��C�N���A�e�L�X�g�\���ł̂��ׂẴA�J�E���g�̃p�X���[�h
echo.
pause
goto loadconfig

:ls_backup
cls
call :colors 17
set cmdline=
set stage=1-1
title �C���X�g�[��L2JTW DP - �o�b�N�A�b�v�u���O�C���T�[�o�v�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X���o�b�N�A�b�v...
set cmdline="%mysqldumpPath%" --add-drop-table -h %lshost% -u %lsuser% --password=%lspass% %lsdb% ^> "%backup%\ls_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto ls_db_ok

:ls_err1
cls
set lsdbprompt=y
call :colors 47
set stage=1-2
title �C���X�g�[��L2JTW DP - �u���O�C���T�[�o�v�f�[�^�x�[�X�̃o�b�N�A�b�v�����s���܂����I�i�X�e�[�W %stage%�j
echo.
echo ���s�����o�b�N�A�b�v�I
echo �u���O�C���T�[�o�v�f�[�^�x�[�X�����݂��Ȃ����߂ł���
echo �\�z���x�����邱�Ƃ��ł��܂� %lsdb%�C�܂��͑��̐ݒ���p��
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X���m������H
echo.
echo (y)�m��
echo.
echo (n)���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p lsdbprompt=�i�f�t�H���g - OK�j�I�����Ă��������F
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
title �C���X�g�[��L2JTW DP - �m���u���O�C���T�[�o�v�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X���m��...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -e "CREATE DATABASE %lsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto ls_db_ok
if %safe_mode% == 1 goto omfg

:ls_err2
cls
set omfgprompt=q
call :colors 47
set stage=2-2
title �C���X�g�[��L2JTW DP - �u���O�C���T�[�o�v�f�[�^�x�[�X�̍쐬�����s���܂����I�i�X�e�[�W %stage%�j
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X�̍쐬�Ɏ��s���܂����I
echo.
echo �l�����錴���F
echo 1.���[�U�[��/���[�U�[�p�X���[�h/���̑��̊֘A���F�Ȃǂ̃f�[�^���̓G���[�A
echo 2.���[�U�[�u%lsuser%�v�s�\���ȃ��[�U����
echo 3.�f�[�^�x�[�X�����łɑ��݂��Ă��܂�
echo.
echo �ݒ��C�����m�F���Ă��������A�܂��͒��ڍĐݒ�
echo.
echo (c)�p��
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p omfgprompt=�i - �o���f�t�H���g�j��I��:
if /i %omfgprompt%==c goto cs_backup
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto ls_err2

:ls_db_ok
cls
set loginprompt=u
call :colors 17
set stage=2-3
title �C���X�g�[��L2JTW DP - �u���O�C���T�[�o�v�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X���C���X�g�[�����܂��F
echo.
echo (f) ���S�F���ׂĂ̌Â��f�[�^�ƍăC���|�[�g�V�����f�[�^���폜����܂�
echo.
echo (u) �A�b�v�f�[�g�F���ׂĂ̌Â��f�[�^��ێ����A�X�V����ɂȂ�
echo.
echo (s) �ȗ��F���̃I�v�V�������X�L�b�v
echo.
echo (r) ���Z�b�g
echo.
echo (q) �ޏo
echo.
set /p loginprompt=�i - �X�V�f�t�H���g�j��I�����Ă�������:
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
title �C���X�g�[��L2JTW DP - �t���C���X�g�[��"���O�I���T�[�o�["�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u���O�C���T�[�o�v�̃f�[�^�x�[�X���폜���āA�V�����f�[�^�x�[�X���C���|�[�g...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< ls_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u���O�C���T�[�o�v�f�[�^�x�[�X���폜����܂���
goto ls_install

:ls_upgrade
cls
echo.
echo �A�b�v�f�[�g�u���O�C���T�[�o�v�f�[�^�x�[�X�\��
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
title �C���X�g�[��L2JTW DP�� - "���O�I���T�[�o�["�f�[�^�x�[�X���C���X�g�[������...�i�X�e�[�W %stage%�j
echo.
echo �V�����u���O�C���T�[�o�v�f�[�^�x�[�X�̓��e���C���X�g�[�����܂��B
echo.
) else (
title �C���X�g�[��L2JTW DP - �A�b�v�f�[�g�u���O�C���T�[�o�v�f�[�^�x�[�X...�i�X�e�[�W %stage%�j
echo.
echo �A�b�v�f�[�g�u���O�C���T�[�o�v�f�[�^�x�[�X�̓��e
echo.
)
if %logging% == 0 set output=NUL
set dest=ls
for %%i in (..\sql\login\*.sql) do call :dump %%i

echo ���s
echo.
goto cs_backup

:cs_backup
cls
call :colors 17
set cmdline=
set stage=3-1
title �C���X�g�[��L2JTW DP - �o�b�N�A�b�v�v�f�B�X�J�b�V�����{�[�h�T�[�o�["�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̃f�[�^�x�[�X���o�b�N�A�b�v...
set cmdline="%mysqldumpPath%" --add-drop-table -h %cbhost% -u %cbuser% --password=%cbpass% %cbdb% ^> "%backup%\cs_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cs_db_ok

:cs_err1
cls
set cbdbprompt=y
call :colors 47
set stage=3-2
title �C���X�g�[��L2JTW DP - "�f�B�X�J�b�V�����{�[�h�T�[�o�[�u�f�[�^�x�[�X�̃o�b�N�A�b�v�����s���܂����I�i�X�e�[�W %stage%�j
echo.
echo ���s�����o�b�N�A�b�v�I
echo �u�f�B�X�J�b�V�����{�[�h�T�[�o�["�f�[�^�x�[�X�����݂��Ȃ����߂ł���
echo ����ŁA�\�z���x�����邱�Ƃ��ł��܂� %cbdb%�C�܂��͑��̐ݒ���p��
echo.
echo �u�c�_�f���T�[�o�v�f�[�^�x�[�X���쐬���܂��H
echo.
echo (y)�m��
echo.
echo (n)���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p cbdbprompt=�i - OK�f�t�H���g�j��I�����Ă�������:
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
title �C���X�g�[��L2JTW DP - �v���_�f���T�[�o�v�f�[�^�x�[�X���쐬����i�X�e�[�W %stage%�j
echo.
echo �u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̃f�[�^�x�[�X���m�����Ă���...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -e "CREATE DATABASE %cbdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cs_db_ok
if %safe_mode% == 1 goto omfg

:cs_err2
cls
set omfgprompt=q
call :colors 47
set stage=4-2
title �C���X�g�[��L2JTW DP - "�f�B�X�J�b�V�����{�[�h�T�[�o�[�u�f�[�^�x�[�X�̍쐬�����s���܂����I�i�X�e�[�W�i %stage%�j
echo.
echo �u�f�B�X�J�b�V�����{�[�hServer�́A�u�f�[�^�x�[�X�̍쐬�Ɏ��s���܂����I
echo.
echo �l�����錴���F
echo 1.���[�U�[��/���[�U�[�p�X���[�h/���̑��̊֘A���F�Ȃǂ̃f�[�^���̓G���[�A
echo 2.���[�U�[�u%cbuser%�v���Ђ̌��@
echo 3.�f�[�^�x�[�X�����łɑ��݂��Ă��܂�
echo.
echo �ݒ��C�����m�F���Ă��������A�܂��͒��ڍĐݒ�
echo.
echo (c)�����Ă���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p omfgprompt=�I�����Ă��������i�f�t�H���g - �o���j�F
if /i %omfgprompt%==c goto gs_backup
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto cs_err2

:cs_db_ok
cls
set communityprompt=u
call :colors 17
set stage=4-3
title �C���X�g�[�� L2JTW DP -�u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̃f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�c�_�f���T�[�o�v�̃f�[�^�x�[�X���C���X�g�[�����܂��B
echo.
echo (f)���S�F���ׂĂ̌Â��f�[�^�ƍăC���|�[�g�V�����f�[�^���폜����܂�
echo.
echo (u)�A�b�v�f�[�g�F���ׂĂ̌Â��f�[�^��ێ����A�X�V����ɂȂ�
echo.
echo (s)�ȗ��F���̃I�v�V�������X�L�b�v
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p communityprompt=�I�����Ă��������i�f�t�H���g - �A�b�v�f�[�g�j:
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
title �C���X�g�[�� L2JTW DP -���S�C���X�g�[��"�f�B�X�J�b�V�����{�[�h�T�[�o�["�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̃f�[�^�x�[�X���폜���āA�V�����f�[�^�x�[�X���C���|�[�g...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< cs_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u�f�B�X�J�b�V�����{�[�h�T�[�o�v�f�[�^�x�[�X���폜����܂���
goto cs_install

:cs_upgrade
cls
echo.
echo �A�b�v�f�[�g "�f�B�X�J�b�V�����f���T�[�o�u�f�[�^�x�[�X�\��
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
title �C���X�g�[�� L2JTW DP -�u�f�B�X�J�b�V�����T�[�o�[�v�̃f�[�^�x�[�X���C���X�g�[�����܂��B...�i�X�e�[�W %stage%�j
echo.
echo �V�����u�f�B�X�J�b�V�����{�[�h�T�[�o�[�v�̃f�[�^�x�[�X�̓��e���C���X�g�[�����܂��B...
echo.
) else (
title �C���X�g�[�� L2JTW DP - �u�f�B�X�J�b�V�����T�[�o�[�v�f�[�^�x�[�X���X�V���܂�..�i�X�e�[�W %stage%�j
echo.
echo �A�b�v�f�[�g "�f�B�X�J�b�V�����f���T�[�o�u�f�[�^�x�[�X�̓��e...
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
title �C���X�g�[�� L2JTW DP - �o�b�N�A�b�v�u�Q�[���T�[�o�[�v�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�[�v�f�[�^�x�[�X���o�b�N�A�b�v�����...
set cmdline="%mysqldumpPath%" --add-drop-table -h %gshost% -u %gsuser% --password=%gspass% %gsdb% ^> "%backup%\gs_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gs_db_ok

:gs_err1
cls
set gsdbprompt=y
call :colors 47
set stage=5-2
title �C���X�g�[�� L2JTW DP - �u�Q�[���T�[�o�v�́A�f�[�^�x�[�X�̃o�b�N�A�b�v�Ɏ��s���܂����I�i�X�e�[�W %stage%�j
echo.
echo �o�b�N�A�b�v�����s���܂����I
echo �u�Q�[���T�[�o�["�f�[�^�x�[�X�����݂��Ȃ����߂ł���
echo ����ŁA�\�z���x�����邱�Ƃ��ł��܂� %gsdb%�C�܂��͑��̐ݒ���p��
echo.
echo �u�Q�[���T�[�o�v�̃f�[�^�x�[�X���쐬���܂����H
echo.
echo (y)OK
echo.
echo (n)���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p gsdbprompt=�I�����Ă��������F�i�f�t�H���g - OK�j
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
title �C���X�g�[�� L2JTW DP -�u�Q�[���T�[�o�v�̏����쐬���܂��B�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�v�̃f�[�^�x�[�X���m�����Ă���...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -e "CREATE DATABASE %gsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gs_db_ok
if %safe_mode% == 1 goto omfg

:gs_err2
cls
set omfgprompt=q
call :colors 47
set stage=6-2
title �C���X�g�[�� L2JTW DP - �u�Q�[���T�[�o�[�v�́A�f�[�^�x�[�X�̍쐬�Ɏ��s���܂����I�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�[�v�́A�f�[�^�x�[�X�̍쐬�Ɏ��s���܂����I
echo.
echo �l�����錴���F
echo 1.�f�[�^���̓G���[�C���Ƃ��΁A���̂悤�Ƀ��[�U�[��/���[�U�[�p�X���[�h/���̑��̊֘A���
echo 2.���[�U�[�u%gsuser%�v���Ђ̌��@
echo 3.�f�[�^�x�[�X�����łɑ��݂��Ă��܂�
echo.
echo �ݒ��C�����m�F���Ă��������A�܂��͒��ڍĐݒ�
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p omfgprompt=�I�����Ă��������F�i�f�t�H���g - �o���j
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto gs_err2

:gs_db_ok
cls
set installtype=u
call :colors 17
set stage=6-3
title �C���X�g�[�� L2JTW DP - �u�Q�[���T�[�o�v�f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�v�̃f�[�^�x�[�X���C���X�g�[�����܂��B
echo.
echo (f)���S�F���ׂĂ̌Â��f�[�^�ƍăC���|�[�g�V�����f�[�^���폜����܂�
echo.
echo (u)�A�b�v�f�[�g�F���ׂĂ̌Â��f�[�^��ێ����A�X�V����ɂȂ�
echo.
echo (s)�ȗ��F���̃I�v�V�������X�L�b�v
echo.
echo (q)�ޏo
echo.
set /p installtype=�I�����Ă��������F�i�f�t�H���g - �X�V�j
if /i %installtype%==f goto gs_cleanup
if /i %installtype%==u goto gs_upgrade
if /i %installtype%==s goto custom_ask
if /i %installtype%==q goto end
goto gs_db_ok

:gs_cleanup
call :colors 17
set cmdline=
set stage=6-4
title �C���X�g�[�� L2JTW DP - ���S�C���X�g�[��"�Q�[���T�[�o�[�v�̃f�[�^�x�[�X�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�v�̃f�[�^�x�[�X���폜���āA�V�����f�[�^�x�[�X���C���|�[�g...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< gs_cleanup.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �u�Q�[���T�[�o�["�f�[�^�x�[�X���폜����܂���
goto gs_install

:gs_upgrade
cls
echo.
echo �u�Q�[���T�[�o�v�f�[�^�x�[�X�\�����X�V���܂���
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
title �C���X�g�[�� L2JTW DP -�u�Q�[���T�[�o�v�̃f�[�^�x�[�X���C���X�g�[�����܂��B...�i�X�e�[�W %stage%�j
echo.
echo �V���� "�Q�[���T�[�o�["�f�[�^�x�[�X�̓��e���C���X�g�[��
echo.
) else (
title �C���X�g�[�� L2JTW DP - �u�Q�[���T�[�o�v�̃f�[�^�x�[�X���X�V���܂���...�i�X�e�[�W %stage%�j
echo.
echo �u�Q�[���T�[�o�v�f�[�^�x�[�X�̓��e���X�V���܂���
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
set /p charprompt=�C���X�g�[���uNPC/�A�C�e��/���O�Ȃǂ̃X�L���v����: (y)OK�܂��� (N) ����H�i�f�t�H���g - [OK]�j:
if /i %charprompt%==n goto custom_ask
for %%i in (..\sql\L2JTW_2\*.sql) do call :dump %%i
echo ����...
echo.
echo �����ӁF�V�X�e���̈ꕔ�����������Q�[���ŁA���̌��ʁA�|�{�t���ł̃C���X�g�[���Ɏ��s���܂�
echo �@�@�@�@���ꂪ�����ł���΁A�蓮�œ�����SQL���C���|�[�g����
echo �@�@�@�@skill_tw / item_tw / messagetable ���� 3 �� SQL
goto custom_ask

:dump
set cmdline=
if /i %full% == 1 (set action=�C���X�g�[��) else (set action=�X�V)
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
REM �G���[���C���X�g�[���f�[�^�x�[�X���ɔ�������
set dp_err=2
echo �G���[���C���X�g�[���f�[�^�x�[�X���ɔ��������FErtheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
cls
set ntpebcak=c
call :colors 47
title �C���X�g�[�� L2JTW DP -�X�e�[�W %stage% �G���[���������܂���
echo.
echo �G���[�F
echo %mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb%
echo.
echo �A�[�J�C�u�Y %~nx1
echo.
echo ���ÁH
echo.
echo (l)�X�g���[�W�G���[���b�Z�[�W�́A�₢���킹��e�Ղɂ���
echo.
echo (c)�����Ă���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p ntpebcak=�i�f�t�H���g - �����j�I�����Ă��������F
if /i %ntpebcak%==c (call :colors 17 & goto :eof)
if /i %ntpebcak%==l (call :logginon %1 & goto :eof)
if /i %ntpebcak%==r set dp_err=0
if /i %ntpebcak%==r (call :configure & exit)
if /i %ntpebcak%==q (call :end)
goto omfg2

:logginon
cls
call :colors 17
title �C���X�g�[�� L2JTW DP - �X�g���[�W�G���[���b�Z�[�W
set logging=1
if %full% == 1 (
  set output=%logdir%\install-%~nx1.log
) else (
  set output=%logdir%\upgrade-%~nx1.log
)
echo.
echo �G���[���b�Z�[�W���i�[���鏀�����ł��܂���
echo.
echo �̂��߂̃A�[�J�C�u�u%output%�v
echo.
echo �t�@�C�������łɑ��݂���ꍇ�A�o�b�N�A�b�v�́A����ȊO�̏ꍇ�́A�ߋ��ɃJ�o�[�����
echo.
pause
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^<..\sql\%1 2^>^>"%output%"
date /t >"%output%"
time /t >>"%output%"
%cmdline%
echo �X�g���[�W�G���[���b�Z�[�W...
call :colors 17
set logging=0
set output=NUL
goto :eof

:custom_ask
set stage=7
title �C���X�g�[�� L2JTW DP - custom �J�X�^���f�[�^�V�[�g�i�X�e�[�W %stage%�j
cls
set cstprompt=y
echo.
echo custom �f�[�^�x�[�X�ɒǉ��J�X�^���e�[�u������������
echo ���ׂẴG���[���b�Z�[�W�́A�ucustom_errors.log�v�ɕۑ�����܂�
echo.
echo �K�v�ɉ����Ă����̃J�X�^���e�[�u�����L���ɂ��邱�Ƃ��ł��܂��̂ł����ӂ�������
echo ���Ȃ����ύX����K�v������܂� config �t�@�C���̐ݒ�
echo.
set /p cstprompt=�C���X�g�[�� custom �J�X�^���f�[�^�V�[�g: (y) OK�܂��� (N) �i�f�t�H���g - OK�j�L�����Z���F
if /i %cstprompt%==y goto custom_install
if /i %cstprompt%==n goto mod_ask

:custom_install
cls
echo.
echo �C���X�g�[�� custom �J�X�^���R���e���c
echo @echo off> temp.bat
if exist custom_errors.log del custom_errors.log
for %%i in (..\sql\game\custom\*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> custom_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move custom_errors.log %workdir%
goto mod_ask

:mod_ask
set stage=8
title �C���X�g�[�� L2JTW DP - Mod �J�X�^���f�[�^�V�[�g�i�X�e�[�W %stage%�j
cls
set cstprompt=y
echo.
echo Mod �f�[�^�x�[�X�ɒǉ��J�X�^���e�[�u������������
echo ���ׂĂ̏��͊Ԉ���Ĕz�u����܂��umod_errors.log�v
echo.
echo �K�v�ɉ����Ă����̃J�X�^���e�[�u�����L���ɂ��邱�Ƃ��ł��܂��̂ł����ӂ�������
echo ���Ȃ����ύX����K�v������܂� config �t�@�C���̐ݒ�
echo.
echo.
set /p cstprompt=�C���X�g�[�� Mods�J�X�^���f�[�^�V�[�g: (y)OK  (N)�L�����Z�� �i�f�t�H���g - OK�j�F
if /i %cstprompt%==y goto mod_install
if /i %cstprompt%==n goto end

:mod_install
cls
echo.
echo �C���X�g�[�� Mods�J�X�^���R���e���c
echo @echo off> temp.bat
if exist mods_errors.log del mods_errors.log
for %%i in (..\sql\game\mods\*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> mods_errors.log >> temp.bat
call temp.bat> nul
del temp.bat
move mods_errors.log %workdir%
REM ------------------------------------------------------
REM �f�[�^�x�[�X�̃C���X�g�[�����������܂���
if %dp_err% == 0 set dp_err=1
REM ------------------------------------------------------
goto end

:omfg
REM ------------------------------------------------------
REM �G���[���C���X�g�[���f�[�^�x�[�X���ɔ�������
set dp_err=2
echo �G���[���C���X�g�[���f�[�^�x�[�X���ɔ��������FErtheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
set omfgprompt=q
call :colors 57
cls
title �C���X�g�[�� L2JTW DP -�X�e�[�W %stage% �G���[���������܂���
echo.
echo ���s���ɃG���[���������܂����F
echo.
echo "%cmdline%"
echo.
echo �f�[�^�Z�b�g�́A���ׂĂ̒l���ԈႢ����͂���Ă��Ȃ����Ƃ��m�F���邽�߂Ƀ`�F�b�N���邱�Ƃ������߂��܂��I
echo.
if %stage% == 1 set label=ls_err1
if %stage% == 2 set label=ls_err2
if %stage% == 3 set label=cs_err1
if %stage% == 4 set label=cs_err2
if %stage% == 5 set label=gs_err1
if %stage% == 6 set label=gs_err2
echo.
echo (c)�����Ă���
echo.
echo (r)���Z�b�g
echo.
echo (q)�ޏo
echo.
set /p omfgprompt=�I�����Ă��������i�f�t�H���g - �o���j:
if /i %omfgprompt%==c goto %label%
if /i %omfgprompt%==r set dp_err=0
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto end
goto omfg

:binaryfind
if EXIST "%mysqlBinPath%" (echo �������� MySQL) else (echo ������܂���ł��� MySQL�C�������ꏊ����͂��Ă�������...)
goto :eof

:end
REM ------------------------------------------------------
REM DP�́A�i�[���ꂽ�o�[�W���������T�|�[�g
if %dp_err% == 0 echo �f�[�^�x�[�X�̃C���X�g�[�����������Ă��Ȃ��FErtheia> ..\doc\L2J_DataPack_Ver.txt
if %dp_err% == 1 echo Ertheia> ..\doc\L2J_DataPack_Ver.txt
REM ------------------------------------------------------
call :colors 17
title �C���X�g�[�� L2JTW DP - ����
cls
echo.
echo L2JTW DP �C���X�g�[��
echo.
echo L2JTW�T�[�o�[�������p�����������肪�Ƃ��������܂�
echo ���http://www.l2jtw.com���`�F�b�N�C�����邱�Ƃ��ł��܂�
echo.
pause
