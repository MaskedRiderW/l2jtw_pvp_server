@echo off
set GS_DEPLOYED=
set DP_DEPLOYED=
set EXIT_F=
set DEPLOY_DIR=..\..\staging

:deployed_start
echo �f�v���C���J�n���܂��B

:gsdeployed_start
set /P GS_DEPLOYED="�Q�[���T�[�o�[���f�v���C���܂����H(y/n) "
if /i %GS_DEPLOYED%==y (goto gs_deployed_run) else (goto gs_deployed_end)

:gs_deployed_run
echo �Q�[���T�[�o�[�̃f�v���C���J�n���܂�
robocopy server\build\dist %DEPLOY_DIR%\ /s /xf General.properties>gsdeploylog.txt
echo �Q�[���T�[�o�[�̃f�v���C���������܂���

:gs_deployed_end

:dp_deployed_start
set /P DP_DEPLOYED="�f�[�^�[�p�b�N���f�v���C���܂����H(y/n) "
if /i %DP_DEPLOYED%==y (goto dp_deployed_run) else (goto dp_deployed_end)

:dp_deployed_run
echo �f�[�^�[�p�b�N�̃f�v���C���J�n���܂�
robocopy dp\build\dist %DEPLOY_DIR%\ /s >dpdeploylog.txt

echo �f�[�^�[�p�b�N�̃f�v���C���������܂���

:dp_deployed_end
:exit_start
set /P EXIT_F="�I�����܂����H(y/n) "
if /i %EXIT_F%==y (goto exit_run) else (goto deployed_start)

:exit_run
echo �I�����܂��B
pause
exit
