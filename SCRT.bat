::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdDqDJGqnxna108XSjOPMNWi1Zg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSTk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJoZkgaGkrXXA==
::ZQ05rAF9IBncCkqN+0xwdVsMAlfMaiXvZg==
::ZQ05rAF9IAHYFVzEqQIDCylgLA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDehDl/0A60ZiA==
::fBEirQZwNQPfEVWB+kM9LVsJDDehDl/a
::cRolqwZ3JBvQF1fEqQK23sLQktsH46A862KbEgx9Nw8AUqubtiq4gmtcLmEGxBGcNqlsu1+rNLLSdhyJ0uzeq/Msm+qwdJ3LfIjl
::dhA7uBVwLU+EWGqQ8VQ1Jlt4RQrCD3+vArwTiA==
::YQ03rBFzNR3SWATE100gMQldSwyWdGjzRoYI7f7+4aqrq0NdZ/YqfIbUug==
::dhAmsQZ3MwfNWATE100gMQldSwyWdGjzRoYI7f7+4aqrq0NdZ/YqfIbUug==
::ZQ0/vhVqMQ3MEVWAtB9wJhRaSWQ=
::Zg8zqx1/OA3MEVWAtB9wJhRaSWQ=
::dhA7pRFwIByZRRm313AEZh5MSWQ=
::Zh4grVQjdCuDJEyX8VA2IRdRXzimOXixEroM1NvY3d7Jp1UYNA==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
color 0A&&mode con COLS=120 LINES=50
setlocal enabledelayedexpansion
chcp 936

rem scan app
echo ECHO:�Լ��С���
echo
echo ECHO:���ڼ���������Ŀ¼����
if not exist "%systemdrive%\SCRT" (
	echo ECHO:δ�ҵ���������Ŀ¼�����ڴ�����
	md "%systemdrive%\SCRT"
	if !errorlevel! == 1 (
		echo WARNING:�޷���������Ŀ¼��
	) else (
		echo ECHO:�����ɹ���
	)
) else (
	echo ECHO:���ҵ���������Ŀ¼����������κβ�����
)
echo ECHO:�Լ���ɣ�
echo.
echo �����ߣ��ֿ���
echo ϵͳ������ϳ���[�汾 8.3.6.5��ʽ��]
echo �����ߣ��ֿ��ԡ������Ŷӣ�Steven Lin Studio���ֿ��Թ����ң�����������Ȩ����
echo ����������΢��19101717029��ȡ���棡
echo �������ܸ��˰�Ȩ���������ֵ��棬���ϴ���
echo �ܾ����棬��������
echo ���ļ��ܸ���֪ʶ��Ȩ���������Ѿ���Դ�������https://github.com/small-lin-jam/SCRT/��
echo ECHO:�Լ���ɣ�

rem set
echo ECHO:��ʼ���С���
echo ECHO:�����С���
echo ECHO:�������û�����������
set d=%~s0
set v=8.3.6.5 ��ʽ��
set name=ϵͳ������ϳ���
set fname=%~n0%
set type=%~x0
set SCRT="%cd%\%fname%%type%"
set SFCD=%systemdrive%\SCRT\SFC.bat
set logs=%systemdrive%\SCRT\SCRT.log
set set=%systemdrive%\SCRT\main.set
set uns=%systemdrive%\SCRT\uns.bat
set tc=%systemdrive%\SCRT\tempclean.bat
echo ECHO:��������������ɣ�
echo ECHO:�������ô��󱨸��������
set su=F
set tb=F
set sfcs=F
set mrts=F
set wsdboerr=F
set UACerr=F
set ierr=F
set nperr=F
set cerr=F
set serr=F
set merr=F
set mrterr=F
echo ECHO:���ô��󱨸������ɣ�
echo ECHO:������ɣ�
echo ECHO:����ж�س����С���
echo @echo off >"%uns%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%uns%"
echo title SCRT��ȫ���ó��� >>"%uns%"
echo echo SCRT��ȫ���ó���[�汾 2.0] >>"%uns%"
echo echo ��ӭʹ��SCRT��ȫж�س��� >>"%uns%"
echo echo ���������밴��������˳���رյ�ǰ���ڣ� >>"%uns%"
echo pause >>"%uns%"
echo schtasks /delete /tn "SCRT" /f >>"%uns%"
echo echo @echo off ^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo cd %systemdrive%\Windows ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo rd /s /q "%%systemdrive%%\SCRT" ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo exit ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo start %%temp%%\unstc.bat >>"%uns%"
echo exit >>"%uns%"
echo ECHO:������ɣ�

rem logs
echo ---------------------------------------------------------------------------------------------------- >"%logs%"
echo SCRT-runbegintime:%date% %time% >>"%logs%"
echo SCRT-vision:%v% >>"%logs%"
echo.
echo SCRT-UACerr:%UACerr% >>"%logs%"
echo.
echo runbegin >>"%logs%"
echo ---------------------------------------------------------------------------------------------------- >>"%logs%"
echo logbegin: >>"%logs%"
title ϵͳ������ϳ���[�汾 %v%]
if !errorlevel! == 1 (
	set ierr=T
	echo WARNING:��ʼ��ʧ�ܣ�
) 
echo ECHO:��ʼ����ɣ�
echo ECHO:��ʼ��ʱ��
set start=%time%
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%
echo.

rem initialization end

rem information
color 0A&&mode con COLS=120 LINES=50
cls&&title ϵͳ������ϳ���[�汾 %v%]
echo -----------------------------------------------------------˵��--------------------------------------------------------
echo ϵͳ������ϳ���[�汾 8.3.6.5 ��ʽ��] 
echo �����ߣ��ֿ��ԡ������Ŷӣ�Steven Lin Studio���ֿ��Թ����ң�����������Ȩ����
echo ��˵���ֿ��ԣ������ߣ����������н���Ȩ��
echo ��˵��˵�������п��ܴ��ھ��׻����µ��κ����⣡
echo.
echo ���������cmd.exe��taskschd.msc��ping.exe��cleanmgr��SFC.exe
echo ���������Ȩ����Ȩ���� (C) Microsoft Corporation����������Ȩ����
echo ������ͨ�Բ�����ַ��www.baidu.com
echo ��������ʱǰ��free.v6ym.com:10571(�ֿ��Ը�����)����鱾�������
echo.
echo ������ܸ��˰�Ȩ���������ֵ��棬���ϴ���
echo ��ǰ������˰�Ȩӵ���ߣ�Steven���ֿ��ԣ�
echo ������ѿ�Դ����ǰ��https://github.com/small-lin-jam/SCRT/��
echo ���棺��ֹ�ڸù����н���ֲ�벡���Ȳ�������Ϊ��һ�����֣��ϲ飡����
echo �緢��bug��ֲ�벡��������ɽ�bug��Ϣ��SCRT.log�ļ�һ������linjunhui2012@hotmail.com��
echo -----------------------------------------------------------------------------------------------------------------------
TIMEOUT /T 5

rem start set
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.
echo ��ʼ���У�
echo ��ܰ��ʾ��û���õ�����Խ�"%systemdrive%\SCRT\main.set"ɾ��
echo.
echo ��ʾ�������޸��κ���������ǰ��"%systemdrive%\SCRT\uns.bat"�������ò���
if not exist "%set%" (
	echo SCRT-main.set: >"%set%"
		set /p ip=����Ҫ��������Ŀ¼��sage = 5������y/n��:
	if "!ip!"=="y" (
		echo �����ڵ������´�����ѡ��Ҫ����������ļ���
		cleanmgr /sageset:5
		echo ���óɹ���
		echo cleanmgrset:T >> "%set%"
	) else if "!ip!"=="n" (
		echo �������ù��̳ɹ���
		echo cleanmgrset:F >> "%set%"
	 ) else (
		echo ��Ч���룬������y�� n��
	)
	echo ���棺��������չ��ΪΣ�����ر��û��˻����ƣ����UAC��������
	echo       ����һ����������Ⱦ�����ƻ����ĵ��ԣ�������������Ƽ���
	echo       ɱ��������ʹ�ã���
	set /p ip=����Ҫ��SCRT�����������������𣿣�y/n��:
	if "!ip!"=="y" (
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d "0" /f
		echo ECHO:������������������
		Schtasks /Create /SC ONLOGON /TN "SCRT" /TR "%SCRT%" /RL HIGHEST /F
		echo ECHO:������������ɣ�
		if !errorlevel! == 1 (
			set UACerr=T
			echo WARNING:����
		) 
		set su=T
		echo �򿪳ɹ���
		echo startup:T >> "%set%"
	) else if "!ip!"=="n" (
		set su=F
		echo �رճɹ���
		echo startup:F >> "%set%"
	 ) else (
		echo ��Ч���룬������y�� n��
	)
	echo.
	echo ����:����չ���ڲ������ܲ��ѵĵ����ϻᵼ�¿��٣���ռ��С����CPU���ڴ�
	echo       �����������
	set /p ip=����Ҫ��SCRT�Ը�����ģʽ�����𣿣�y/n��:
	if "!ip!"=="y" (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableBackoff /t REG_DWORD /d "1" /f
		if !errorlevel! == 1 (
			set wsdboerr=T
			echo WARNING:ע������
		) 
		set tb=T
		echo �򿪳ɹ���
		echo turboset:T >> "%set%"
	) else if "!ip!"=="n" (
		set tb=F
		echo �رճɹ���
		echo turboset:F >> "%set%"
	) else (
		echo ��Ч���룬������y�� n��
	)
	echo.
	echo �ָ�ģʽ˵��:ÿ������SCRTʱ���Զ������޸�����������޸ĵ�
	echo                ϵͳ�ļ����ر����в�����������������ļ���ʱ��
	echo ����:�˹����ڲ������ܲ��ѵĵ����ϻᵼ�¿��٣������������
	set /p ip=����Ҫ��SCRT����ǿģʽ�����𣿣�y/n��:
	if "!ip!"=="y" (
		set sfcs=T
		echo �򿪳ɹ���
		echo sfcset:T >> "%set%"
	) else if "!ip!"=="n" (
		set sfcs=F
		echo �رճɹ���
		echo sfcset:F >> "%set%"
	 ) else (
		echo ��Ч���룬������y�� n��
	)
	echo.
	echo ��ǿģʽ˵��:ͨ��mrtɾ���������ϵĿ����ļ���
	echo               ���������ĵ��ԣ�����ָ�ģʽδ��
	echo               �����������Ч��
	echo ����:�˹����ڲ������ܲ��ѵĵ����ϻᵼ�¿��٣������������
	echo       �����δ��װmrt���°�������������չ�
	echo ��ʾ:mrtɨ���ٶȽ�����Ĭ��ȫ��ɨ�貢�Զ�ɾ��Σ��
	echo       ���������ĵȴ�������ȴ���ɨ����ɣ�����
	echo       Ӱ����Ե�����ʹ�ã���
	set /p ip=����Ҫ��SCRT����ǿģʽ�����𣿣�y/n��:
	if "!ip!"=="y" (
		set mrts=T
		echo �򿪳ɹ���
		echo mrtset:T >> "%set%"
	) else if "!ip!"=="n" (
		set mrts=F
		echo �رճɹ���
		echo mrtset:F >> "%set%"
	 ) else (
		echo ��Ч���룬������y�� n��
	)
	TIMEOUT /T 3
) else (
	echo cleanmgr������
	echo.
	type "%set%" | findstr /c:"startup:T" >nul && set su=T || set su=F
	echo ������������
	echo.
	type "%set%" | findstr /c:"turboset:T" >nul && set tb=T || set tb=F
	echo ����ģʽ������
	echo.
	type "%set%" | findstr /c:"sfcset:T" >nul && set sfcs=T || set sfcs=F
	echo �ָ�ģʽ������
	echo.
	type "%set%" | findstr /c:"mrtset:T" >nul && set mrts=T || set mrts=F
	echo ��ǿģʽ������
)
echo.

rem start
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.

rem network
echo ����ˢ��DNS���桭��
ipconfig /flushdns
echo ���ڲ���������ͨ�ԣ�www.baidu.com������
ping www.baidu.com
echo ������ͨ���Ѳ�����ɣ�
if !errorlevel! == 1 (
	set nperr=T
) 

rem network-ping log
echo. >>"%logs%"
echo network-ping: >>"%logs%"
echo. >>"%logs%"
echo ping#1:www.baidu.com >>"%logs%"
echo. >>"%logs%"
echo network-ping end >>"%logs%"
echo. >>"%logs%"
echo �����������ɣ�
TIMEOUT /T 2

rem clean
cls&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.&&echo ����������������ļ�����

rem cleanlog
echo clean up directory: >>"%logs%"
echo. >>"%logs%"
echo directory#1:%windir%\KB*.log >>"%logs%"
echo directory#2:%temp% >>"%logs%"
echo directory#3:%windir%\Downloaded Program Files >>"%logs%"
echo directory#4:%windir%\SoftwareDistribution\Download >>"%logs%"
echo directory#5:%windir%\System32\LogFiles >>"%logs%"
echo directory#6:%windir%\Help >>"%logs%"
echo directory#7:%userprofile%\Downloads >>"%logs%"
echo directory#8:%userprofile%\Cookies >>"%logs%"
echo directory#9:%userprofile%\Recent >>"%logs%"
echo directory#10:%userprofile%\Local Settings\Temporary Internet Files >>"%logs%"
echo directory#11:%userprofile%\AppData\Local\Microsoft\Windows\INetCache\IE >>"%logs%"
echo directory#12:%systemdrive%\$WINDOWS.~BT >>"%logs%"
echo directory#13%systemdrive%\ProgramData\Microsoft\Windows\WER >>"%logs%"
echo. >>"%logs%"
echo clean up directory end >>"%logs%"
echo. >>"%logs%"
echo ��������ס�����Ե�һ�ᡭ��
echo.
echo ��̨�����С���
echo.
echo ��������cleanmgr����
cleanmgr /sagerun:5 /autoclean
echo.
echo �����Զ�������
del %windir%\KB*.log /f /s /q >nul 2>nul
del /f /s /q %systemdrive%\recycled\*.* >nul 2>nul
del /f /s /q %windir%\*.bak  >nul 2>nul
del "%windir%\Downloaded Program Files\*.*" /s /q /f >nul 2>nul
del "%windir%\SoftwareDistribution\Download\*.*" /s /q /f >nul 2>nul
del "%windir%\System32\LogFiles\*.*" /s /q /f >nul 2>nul
del "%windir%\Help\*.*" /s /q /f >nul 2>nul
del %windir%\temp\*.* /s /q /f >nul 2>nul
del %userprofile%\Downloads\*.* /s /q /f >nul 2>nul
del %userprofile%\Cookies\*.* /s /q /f >nul 2>nul
del %userprofile%\Recent\*.* /s /q /f >nul 2>nul
del "%userprofile%\Local Settings\Temporary Internet Files\*.*" /s /q /f >nul 2>nul
del %userprofile%\AppData\Local\Microsoft\Windows\INetCache\IE\*.* /s /q /f >nul 2>nul
del %systemdrive%\ProgramData\Microsoft\Windows\WER\*.* /s /q /f >nul 2>nul
rd /s /q %systemdrive%\$WINDOWS.~BT >nul 2>nul
rd /s /q %windir%\SoftwareDistribution\Download\ >nul 2>nul
md %windir%\SoftwareDistribution\Download\ >nul 2>nul
echo.
echo ������ɣ�
TIMEOUT /t 2

rem scan
cls&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.&&echo ��ʼ��̨�޸�ϵͳ�ļ���
echo @echo off >"%SFCD%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%SFCD%"
echo title SFC.bat >>"%SFCD%"
echo SFC /scannow >>"%SFCD%"
echo dism /online /cleanup-image /scanhealth >>"%SFCD%"
echo dism /online /cleanup-image /restorehealth >>"%SFCD%"
if %mrts% == T (
	echo mrt /q /f:y >>"%SFCD%"
	if !errorlevel! == 1 (
		set mrterr=T
		echo WARNING:mrt����д��ʧ�ܣ�
	) 
)
echo exit >>"%SFCD%"
if %sfcs% == T (
	start /min %SFCD%
	echo ��ȴ�sfc.bat�Զ��޸����
	if !errorlevel! == 1 (
		set serr=T
		echo WARNING:%SFCD%��ʧ�ܣ�
	)
	echo.
	TIMEOUT /t 5
)

rem memory
cls&&title %name%&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.
echo ��ʼ����ڴ棡
wmic memorychip get capacity
if !errorlevel! == 1 (
	set merr=T
) 
echo �ڴ�����ɣ�
TIMEOUT /t 2

rem runtime
set end=%time%
echo ECHO:������ʱ��
echo ECHO:���ڼ���ʱ�䡭��
set options="tokens=1-4 delims=:.,"
for /f %options% %%a in ("%start%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%end%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100
set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%
set /a totalsecs = %hours%*3600 + %mins%*60 + %secs%
set runtime=%hours%:%mins%:%secs%.%ms% (%totalsecs%.%ms%s total)
echo ECHO:������ɣ�����ʱ��:%runtime%��

rem logs
echo ECHO:д����־�С���
echo set: >>"%logs%"
echo staut up=%su% >>"%logs%"
echo repair mode=%sfcs% >>"%logs%"
echo turbo mode=%tb% >>"%logs%"
echo mrt=%mrts% >>"%logs%"
echo set end >>"%logs%"
echo. >>"%logs%"
echo errors: >>"%logs%"
echo. >>"%logs%"
echo Windows Search DisableBackoff errror=%wsdboerr% >>"%logs%"
echo UAC error=%UACerr% >>"%logs%"
echo initialization error=%ierr% >>"%logs%"
echo network-ping error=%nperr% >>"%logs%"
echo clean error=%cerr% >>"%logs%"
echo SFC-scan error=%serr% >>"%logs%"
echo mrt error=%mrterr% >>"%logs%"
echo memorychip error=%merr% >>"%logs%"
echo. >>"%logs%"
echo error end >>"%logs%"
echo. >>"%logs%"
echo log end >>"%logs%"
echo ---------------------------------------------------------------------------------------------------- >>"%logs%"
echo SCRT-vision:%v% >>"%logs%"
echo run end >>"%logs%"
echo. >>"%logs%"
echo SCRT-runendtime:%date% %time% >>"%logs%"
echo SCRT-runtime:%runtime% >>"%logs%"
echo ---------------------------------------------------------------------------------------------------- >>"%logs%"
echo ECHO:д����־�ɹ���

rem SCRTend
cls&&ver&&echo %name%[�汾 %v%]&&echo �����ߣ��ֿ���&&echo.
echo ������־��%logs%��
echo.
echo UAC�Զ����Ľ�������һ������ʱ��Ч��
echo ���鲻Ҫ�������װ��%systemdrive%\����Ŷ��
echo ��Ҫ�ӿ������ٶȣ���ر������������
echo mrtɨ���ٶȽ���������Ѿ������˴˹��ܣ������ĵȴ���
echo.
echo ��ǰ����Ŀ¼��%d%
echo ��ǰ�ļ���׺����%type%
echo.
echo ��������ʱ�䣺%runtime%
echo.
echo ����ɣ�
echo 5����Զ��˳�......
TIMEOUT /T 5
echo ECHO:�����˳���
endlocal
exit

rem ���ļ��ܸ���֪ʶ��Ȩ���������Ѿ���Դ�������https://github.com/small-lin-jam/SCRT/��
rem ���ļ���Դ�����Ͻ��޸ġ���Ϯ�����ݣ�
rem ���ô�����Ϣbegin
rem �����ߣ��ֿ��ԡ������Ŷӣ�Steven Lin Studio���ֿ��Թ����ң�����������Ȩ����
rem ϵͳ������ϳ���[�汾 8.3.6.5��ʽ��]
rem Steven Lin���ֿ��ԣ���Ȩ����
rem ����������΢��SHlin2012��ȡ���棡
rem �������ܸ��˰�Ȩ���������ֵ��棬���ϴ���
rem �ܾ����棬��������
rem ��test��1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ����()��:*��.,!��""%><�й����죬�ۼ�ȫ��MADE IN CHINA BY STEVEN LIN
rem �й����죬�ۼ�ȫ��MADE IN CHINA BY STEVEN LIN
rem ���ô�����Ϣend