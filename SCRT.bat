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
echo ECHO:自检中……
echo
echo ECHO:正在检查程序运行目录……
if not exist "%systemdrive%\SCRT" (
	echo ECHO:未找到程序运行目录！正在创建！
	md "%systemdrive%\SCRT"
	if !errorlevel! == 1 (
		echo WARNING:无法创建运行目录！
	) else (
		echo ECHO:创建成功！
	)
) else (
	echo ECHO:已找到程序运行目录！无需进行任何操作！
)
echo ECHO:自检完成！
echo.
echo 制作者：林俊辉
echo 系统清理诊断程序[版本 8.3.6.5正式版]
echo 制作者：林俊辉。制作团队：Steven Lin Studio（林俊辉工作室）。保留所有权利。
echo 正版请搜索微信19101717029获取正版！
echo 本程序受个人版权保护，发现盗版，从严处理！
echo 拒绝盗版，从我做起！
echo 本文件受个人知识版权保护，但已经开源，请访问https://github.com/small-lin-jam/SCRT/！
echo ECHO:自检完成！

rem set
echo ECHO:初始化中……
echo ECHO:设置中……
echo ECHO:正在设置基础变量……
set d=%~s0
set v=8.3.6.5 正式版
set name=系统清理诊断程序
set fname=%~n0%
set type=%~x0
set SCRT="%cd%\%fname%%type%"
set SFCD=%systemdrive%\SCRT\SFC.bat
set logs=%systemdrive%\SCRT\SCRT.log
set set=%systemdrive%\SCRT\main.set
set uns=%systemdrive%\SCRT\uns.bat
set tc=%systemdrive%\SCRT\tempclean.bat
echo ECHO:基础变量设置完成！
echo ECHO:正在设置错误报告变量……
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
echo ECHO:设置错误报告变量完成！
echo ECHO:设置完成！
echo ECHO:创建卸载程序中……
echo @echo off >"%uns%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%uns%"
echo title SCRT安全重置程序 >>"%uns%"
echo echo SCRT安全重置程序[版本 2.0] >>"%uns%"
echo echo 欢迎使用SCRT安全卸载程序！ >>"%uns%"
echo echo 继续重置请按任意键（退出请关闭当前窗口） >>"%uns%"
echo pause >>"%uns%"
echo schtasks /delete /tn "SCRT" /f >>"%uns%"
echo echo @echo off ^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo cd %systemdrive%\Windows ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo rd /s /q "%%systemdrive%%\SCRT" ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo exit ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo start %%temp%%\unstc.bat >>"%uns%"
echo exit >>"%uns%"
echo ECHO:创建完成！

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
title 系统清理诊断程序[版本 %v%]
if !errorlevel! == 1 (
	set ierr=T
	echo WARNING:初始化失败！
) 
echo ECHO:初始化完成！
echo ECHO:开始计时！
set start=%time%
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%
echo.

rem initialization end

rem information
color 0A&&mode con COLS=120 LINES=50
cls&&title 系统清理诊断程序[版本 %v%]
echo -----------------------------------------------------------说明--------------------------------------------------------
echo 系统清理诊断程序[版本 8.3.6.5 正式版] 
echo 制作者：林俊辉。制作团队：Steven Lin Studio（林俊辉工作室）。保留所有权利。
echo 本说明林俊辉（制作者）保留其所有解释权！
echo 本说明说明了所有可能存在纠纷或刑事的任何问题！
echo.
echo 调用软件：cmd.exe；taskschd.msc；ping.exe；cleanmgr；SFC.exe
echo 调用软件版权：版权所有 (C) Microsoft Corporation。保留所有权利。
echo 网络连通性测试网址：www.baidu.com
echo 您可以随时前往free.v6ym.com:10571(林俊辉个人网)并检查本软件更新
echo.
echo 本软件受个人版权保护，发现盗版，从严处理！
echo 当前软件个人版权拥有者：Steven（林俊辉）
echo 本软件已开源，请前往https://github.com/small-lin-jam/SCRT/！
echo 警告：禁止在该工具中进行植入病毒等不正当行为！一经发现，严查！！！
echo 如发现bug或植入病毒的情况可将bug信息和SCRT.log文件一起发送至linjunhui2012@hotmail.com！
echo -----------------------------------------------------------------------------------------------------------------------
TIMEOUT /T 5

rem start set
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.
echo 开始运行！
echo 温馨提示：没设置的项可以将"%systemdrive%\SCRT\main.set"删除
echo.
echo 提示：如需修改任何设置项请前往"%systemdrive%\SCRT\uns.bat"进行重置操作
if not exist "%set%" (
	echo SCRT-main.set: >"%set%"
		set /p ip=您想要设置清理目录吗（sage = 5）？（y/n）:
	if "!ip!"=="y" (
		echo 请您在弹出的新窗口中选中要清理的所有文件！
		cleanmgr /sageset:5
		echo 设置成功！
		echo cleanmgrset:T >> "%set%"
	) else if "!ip!"=="n" (
		echo 跳过设置过程成功！
		echo cleanmgrset:F >> "%set%"
	 ) else (
		echo 无效输入，请输入y或 n。
	)
	echo 警告：自启动扩展项为危险项，会关闭用户账户控制（简称UAC），您的
	echo       电脑一旦被病毒感染将会破坏您的电脑，请谨慎开启（推荐与
	echo       杀毒软件配合使用）！
	set /p ip=您想要让SCRT自启动并安静运行吗？（y/n）:
	if "!ip!"=="y" (
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d "0" /f
		echo ECHO:正在启用自启动……
		Schtasks /Create /SC ONLOGON /TN "SCRT" /TR "%SCRT%" /RL HIGHEST /F
		echo ECHO:启用自启动完成！
		if !errorlevel! == 1 (
			set UACerr=T
			echo WARNING:错误！
		) 
		set su=T
		echo 打开成功！
		echo startup:T >> "%set%"
	) else if "!ip!"=="n" (
		set su=F
		echo 关闭成功！
		echo startup:F >> "%set%"
	 ) else (
		echo 无效输入，请输入y或 n。
	)
	echo.
	echo 警告:此扩展项在部分性能不佳的电脑上会导致卡顿，会占用小部分CPU和内存
	echo       请谨慎开启！
	set /p ip=您想要让SCRT以高性能模式运行吗？（y/n）:
	if "!ip!"=="y" (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableBackoff /t REG_DWORD /d "1" /f
		if !errorlevel! == 1 (
			set wsdboerr=T
			echo WARNING:注册表错误！
		) 
		set tb=T
		echo 打开成功！
		echo turboset:T >> "%set%"
	) else if "!ip!"=="n" (
		set tb=F
		echo 关闭成功！
		echo turboset:F >> "%set%"
	) else (
		echo 无效输入，请输入y或 n。
	)
	echo.
	echo 恢复模式说明:每次运行SCRT时会自动尝试修复被恶意软件修改的
	echo                系统文件，特别是中病毒或特殊情况导致文件损坏时！
	echo 警告:此功能在部分性能不佳的电脑上会导致卡顿，请谨慎开启！
	set /p ip=您想要让SCRT以增强模式运行吗？（y/n）:
	if "!ip!"=="y" (
		set sfcs=T
		echo 打开成功！
		echo sfcset:T >> "%set%"
	) else if "!ip!"=="n" (
		set sfcs=F
		echo 关闭成功！
		echo sfcset:F >> "%set%"
	 ) else (
		echo 无效输入，请输入y或 n。
	)
	echo.
	echo 增强模式说明:通过mrt删除您电脑上的可疑文件，
	echo               来保护您的电脑！如果恢复模式未开
	echo               启，则此项无效！
	echo 警告:此功能在部分性能不佳的电脑上会导致卡顿，请谨慎开启！
	echo       如电脑未安装mrt更新包，请勿开启此扩展项！
	echo 提示:mrt扫描速度较慢，默认全盘扫描并自动删除危险
	echo       程序，请耐心等待（无需等待其扫描完成，不会
	echo       影响电脑的正常使用）！
	set /p ip=您想要让SCRT以增强模式运行吗？（y/n）:
	if "!ip!"=="y" (
		set mrts=T
		echo 打开成功！
		echo mrtset:T >> "%set%"
	) else if "!ip!"=="n" (
		set mrts=F
		echo 关闭成功！
		echo mrtset:F >> "%set%"
	 ) else (
		echo 无效输入，请输入y或 n。
	)
	TIMEOUT /T 3
) else (
	echo cleanmgr已设置
	echo.
	type "%set%" | findstr /c:"startup:T" >nul && set su=T || set su=F
	echo 自启动已设置
	echo.
	type "%set%" | findstr /c:"turboset:T" >nul && set tb=T || set tb=F
	echo 性能模式已设置
	echo.
	type "%set%" | findstr /c:"sfcset:T" >nul && set sfcs=T || set sfcs=F
	echo 恢复模式已设置
	echo.
	type "%set%" | findstr /c:"mrtset:T" >nul && set mrts=T || set mrts=F
	echo 增强模式已设置
)
echo.

rem start
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.

rem network
echo 正在刷新DNS缓存……
ipconfig /flushdns
echo 正在测试网络连通性（www.baidu.com）……
ping www.baidu.com
echo 网络连通性已测试完成！
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
echo 网络测试已完成！
TIMEOUT /T 2

rem clean
cls&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.&&echo 正在清理电脑垃圾文件……

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
echo 如遇清理卡住，请稍等一会……
echo.
echo 后台清理中……
echo.
echo 正在启动cleanmgr……
cleanmgr /sagerun:5 /autoclean
echo.
echo 正在自动清理……
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
echo 清理完成！
TIMEOUT /t 2

rem scan
cls&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.&&echo 开始后台修复系统文件！
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
		echo WARNING:mrt命令写入失败！
	) 
)
echo exit >>"%SFCD%"
if %sfcs% == T (
	start /min %SFCD%
	echo 请等待sfc.bat自动修复完成
	if !errorlevel! == 1 (
		set serr=T
		echo WARNING:%SFCD%打开失败！
	)
	echo.
	TIMEOUT /t 5
)

rem memory
cls&&title %name%&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.
echo 开始检查内存！
wmic memorychip get capacity
if !errorlevel! == 1 (
	set merr=T
) 
echo 内存检查完成！
TIMEOUT /t 2

rem runtime
set end=%time%
echo ECHO:结束计时！
echo ECHO:正在计算时间……
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
echo ECHO:计算完成！运行时间:%runtime%！

rem logs
echo ECHO:写入日志中……
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
echo ECHO:写入日志成功！

rem SCRTend
cls&&ver&&echo %name%[版本 %v%]&&echo 制作者：林俊辉&&echo.
echo 运行日志在%logs%中
echo.
echo UAC自动更改将会在下一次启动时生效！
echo 建议不要把软件安装在%systemdrive%\盘中哦！
echo 如要加快启动速度，请关闭无用自启动项！
echo mrt扫描速度较慢，如果已经开启了此功能，请耐心等待！
echo.
echo 当前运行目录：%d%
echo 当前文件后缀名：%type%
echo.
echo 本次运行时间：%runtime%
echo.
echo 已完成！
echo 5秒后自动退出......
TIMEOUT /T 5
echo ECHO:正在退出！
endlocal
exit

rem 本文件受个人知识版权保护，但已经开源，请访问https://github.com/small-lin-jam/SCRT/！
rem 本文件开源，但严禁修改、抄袭其内容！
rem 备用代码信息begin
rem 制作者：林俊辉。制作团队：Steven Lin Studio（林俊辉工作室）。保留所有权利。
rem 系统清理诊断程序[版本 8.3.6.5正式版]
rem Steven Lin（林俊辉）版权所有
rem 正版请搜索微信SHlin2012获取正版！
rem 本程序受个人版权保护，发现盗版，从严处理！
rem 拒绝盗版，从我做起！
rem （test）1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ（）()：:*。.,!！""%><中国智造，慧及全球！MADE IN CHINA BY STEVEN LIN
rem 中国智造，慧及全球！MADE IN CHINA BY STEVEN LIN
rem 备用代码信息end