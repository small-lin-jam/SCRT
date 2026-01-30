@echo off
setlocal
color 0A&&mode con COLS=120 LINES=50
setlocal enabledelayedexpansion
chcp 936
echo 制作者：林先生
echo 系统清理诊断程序[版本 8.5.2.1 正式版]
echo 制作者：林先生。制作团队：Steven Lin Studio（上海木木个人工作室）。保留所有权利。
echo 本文件已开源，使用GNU通用开源许可证第三版，请访问https://github.com/small-lin-jam/SCRT/！
echo ECHO:初始化中……
echo ECHO:设置中……
echo ECHO:正在设置基础变量……
set d=%~s0
set v=8.5.2.1 正式版
set name=系统清理诊断程序
set fname=%~n0%
set type=%~x0
set date_f=%date:/=%_%time::=%
set date_f=%date_f:.=%
set SCRT="%cd%%fname%%type%"
for /f "tokens=2* delims=    " %%a in ('reg query "HKLM\SOFTWARE\SCRT" /v "home" 2^>nul') do (
	set home=%%b
)
if defined home (
	echo ECHO:已找到SCRT\home注册表项，正在检查有效性！
	if exist "%home%" (
		pushd "%home%" 2>nul
    		if %errorLevel% equ 0 (
        		popd
			echo ECHO:注册表信息有效，正在设置变量
			set logf=%home%logs\
			set subat=%home%startup.bat
			set SFCD=%home%SFC.bat
			set cleanbat=%home%cb.bat
			set set=%home%main.set
			set uns=%home%uns.bat
			set tc=%home%tempclean.bat
		) else (
			echo WARNING"%home%" 存在但可能不是一个有效的目录或无法访问
			set logf=%systemdrive%\SCRT\logs\
			set subat=%systemdrive%\SCRT\startup.bat
			set SFCD=%systemdrive%\SCRT\SFC.bat
			set cleanbat=%systemdrive%\SCRT\cb.bat
			set set=%systemdrive%\SCRT\main.set
			set uns=%systemdrive%\SCRT\uns.bat
			set tc=%systemdrive%\SCRT\tempclean.bat
			set home=%systemdrive%\SCRT\
		)
	) else (
        	echo WARNING:%home%不存在！
		set logf=%systemdrive%\SCRT\logs\
		set subat=%systemdrive%\SCRT\startup.bat
		set SFCD=%systemdrive%\SCRT\SFC.bat
		set cleanbat=%systemdrive%\SCRT\cb.bat
		set set=%systemdrive%\SCRT\main.set
		set uns=%systemdrive%\SCRT\uns.bat
		set tc=%systemdrive%\SCRT\tempclean.bat
		set home=%systemdrive%\SCRT\
	)
) else (
	echo WARNING:注册表项未找到！
	set logf=%systemdrive%\SCRT\logs\
	set subat=%systemdrive%\SCRT\startup.bat
	set SFCD=%systemdrive%\SCRT\SFC.bat
	set cleanbat=%systemdrive%\SCRT\cb.bat
	set set=%systemdrive%\SCRT\main.set
	set uns=%systemdrive%\SCRT\uns.bat
	set tc=%systemdrive%\SCRT\tempclean.bat
	set home=%systemdrive%\SCRT\
)
set logs=%logf%%date_f%.log
set cls=cls^&^title %name%^&^ver^&^echo %name%[版本 %v%]^&^echo 制作者：林先生^&^echo.
echo ECHO:基础变量设置完成！
echo.
echo ECHO:自检中……
echo
echo ECHO:正在检查程序运行目录……
if not exist "%home%" (
	pushd "%home%" 2>nul
    	if !errorLevel! neq 0 (
        	popd
		echo ECHO:未找到程序运行目录！正在创建！
		md "%home%"
		md "%home%logs"
		if !errorlevel! == 1 (
			echo ERROR:无法创建运行目录！
		) else (
			echo ECHO:创建成功！
		)
	) else (
		echo ECHO:已找到程序运行目录！无需进行任何操作！
	)
) else (
	echo ECHO:已找到程序运行目录！无需进行任何操作！
)
echo ECHO:自检完成！
echo.
echo ECHO:正在设置错误报告变量……
set auto=F
if exist "%set%" (
	type "%set%" | findstr /c:"automode:T" >nul && set auto=T || set auto=F
)
set su=F
set sfcs=F
set mrts=F
set suserr=F
set ierr=F
set nperr=F
set cerr=F
set serr=F
set mrterr=F
echo ECHO:设置错误报告变量完成！
echo ECHO:设置自动模式中……
echo ECHO:设置自动模式完成！
echo ECHO:设置完成！
echo ECHO:创建卸载程序中……
echo @echo off >"%uns%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%uns%"
echo title SCRT安全重置程序 >>"%uns%"
echo echo SCRT安全重置程序[版本 3.0] >>"%uns%"
echo echo 欢迎使用SCRT安全重置程序！ >>"%uns%"
echo echo 继续重置请按任意键（退出请关闭当前窗口） >>"%uns%"
echo pause >>"%uns%"
echo schtasks /delete /tn "SCRT" /f >>"%uns%"
echo echo @echo off ^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo cd %systemdrive%\Windows ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo echo rd /s /q "%home%" ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo reg delete "%home%" /f >>"%uns%"
echo echo exit ^>^>"%%temp%%\unstc.bat" >>"%uns%"
echo start %%temp%%\unstc.bat >>"%uns%"
echo exit >>"%uns%"
echo ECHO:创建完成！
echo ECHO:创建临时文件清理程序中……
echo @echo off >"%tc%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%tc%"
echo title SCRT临时文件清理 >>"%tc%"
echo timeout /t 2 >>"%tc%"
echo rd /s /q %temp% >nul 2>nul >>"%tc%"
echo md %temp% >nul 2>nul >>"%tc%"
echo exit >>"%tc%"
echo ECHO:创建完成！
echo.
echo ECHO:正在对日志文件进行检查
for /f "delims=" %%c in ('dir /b %logf% ^| find /c /v ""') do set count=%%c
echo ECHO:日志文件数量%count%个
if %count% geq 10 (
    set /a del_count=%count% - 9
    echo ECHO:需删除的日志文件数量!del_count!个
    for /l %%i in (1, 1, !del_count!) do (
        for /f "delims=" %%f in ('dir /b /od %logf%') do (
            set "oldest_file=%%f"
            goto :delete_file
        )
        :delete_file
        del "%logf%!oldest_file!"
        echo 删除文件 "%logf%!oldest_file!"
        )
    )
) else (
    echo 无需删除多余日志文件
)
echo ECHO:已自动保留最新的九个日志文件
echo ---------------------------------------------------------------------------------------------------- >"%logs%"
echo SCRT-runbegintime:%date% %time% >>"%logs%"
echo SCRT-vision:%v% >>"%logs%"
echo.
echo SCRT-suserr:%suserr% >>"%logs%"
echo.
echo runbegin >>"%logs%"
echo ---------------------------------------------------------------------------------------------------- >>"%logs%"
echo logbegin: >>"%logs%"
title 系统清理诊断程序[版本 %v%]
if !errorlevel! == 1 (
	set ierr=T
	echo ERROR:初始化失败！
) 
echo ECHO:初始化完成！
echo ECHO:开始计时！
set start=%time%
color 0A&&mode con COLS=120 LINES=50
cls&&title %name%
echo.
cls&&title 系统清理诊断程序[版本 %v%]
echo ---------------------------------------------------------开源说明------------------------------------------------------
echo 系统清理诊断程序[版本 8.5.2.1 正式版] 
echo.
echo 本程序使用GNU通用开源许可证第三版
echo.
echo GNU通用开源许可证第三版允许他人只有使用、复制、修改和分发本软件，但需要用于任何合法目的，
echo 修改后的新程序必须使用必须含有GNU通用许可证并提供源代码，告知获取源代码的方式，
echo 不得限制他人对软件的使用、复制、修改和分发，严禁通过任意方式增加对用户的额外限制和在
echo 本开源许可证下的任何权利不得被他人剥夺
echo -----------------------------------------------------------------------------------------------------------------------
if %auto% == F (
	TIMEOUT /T 5
)
cls&&title 系统清理诊断程序[版本 %v%]
echo -----------------------------------------------------------说明--------------------------------------------------------
echo 系统清理诊断程序[版本 8.5.2.1 正式版] 
echo 制作者：林先生。制作团队：Steven Lin Studio（上海木木个人工作室）。保留所有权利。
echo 本说明林先生（制作者）保留其所有解释权！
echo 本说明说明了所有可能存在纠纷或刑事的任何问题！
echo.
echo 安全声明：本程序部分操作会被误判为危险操作，可以查看日志文件和弹窗提示检查文件是否有病毒存在！
echo.
echo 调用软件：cmd.exe；taskschd.msc；ping.exe；cleanmgr；SFC.exe
echo 调用软件版权：版权所有 (C) Microsoft Corporation。保留所有权利。
echo 网络连通性测试网址：www.baidu.com
echo.
echo 本软件已开源，请前往https://github.com/small-lin-jam/SCRT/！
echo 警告：禁止在该工具中进行植入病毒等不正当行为！一经发现，严查！！！
echo 如发现bug或植入病毒的情况可将bug信息和logs文件夹下的脚本一起发送至微信SHlin2012！
echo -----------------------------------------------------------------------------------------------------------------------
if %auto% == F (
	TIMEOUT /T 5
)
echo. >>"%logs%"
echo set: >>"%logs%"
color 0A&&mode con COLS=120 LINES=50
%cls%
echo 开始运行！
echo 提示：如需修改任何设置项请前往"%systemdrive%\SCRT\uns.bat"进行重置操作
echo.
if not exist "%set%" (
	set /p ip=您想要改变SCRT的运行文件存放目录吗？（y/n）:
	if "!ip!"=="y" (
		:input_loop
		echo 请输入一个有效的目录路径：
		set "dir_path="
		set /p "dir_path=路径(将会被设置为：您输入的路径\): "
		if "!dir_path!"=="" (
    			echo 错误：路径不能为空！
    			TIMEOUT /T 2
    			goto input_loop
		)
		echo 正在验证目录路径...

		:check_loop
		if exist "!dir_path!\" (
    			pushd "!dir_path!\" 2>nul
    			if %errorLevel% equ 0 (
        			popd
        			echo ECHO:目录 "!dir_path!\" 存在且有效！
				set home=!dir_path!\
				reg add "HKLM\SOFTWARE\SCRT" /f
				reg add "HKLM\SOFTWARE\SCRT" /v "home" /t REG_SZ /d !dir_path!\ /f
        			goto end_loop
			) else (
				echo WARNING"!dir_path!" 存在但可能不是一个有效的目录或无法访问
			)
		) else (
			echo ERROR:目录 "!dir_path!" 不存在
		)
		set "retry="
		echo.
		echo 请选择：
		echo [1] 重试（输入新路径）
		echo [2] 继续等待（目录可能正在创建中）
		echo [3] 退出
		set /p "retry=请选择 (1/2/3): "
		if /i "!retry!"=="1" goto input_loop
		if /i "!retry!"=="3" goto end_loop
		echo 等待 5 秒后重新检查...
		TIMEOUT /T 5
		goto check_loop

		:end_loop
		echo 本次更改将在下次启动中生效，如果愿意，请自行删除%systemdrive%\SCRT
		echo 目录设置已完成！
		echo [%date% %time%]scrt_home: >>"%logs%"
	) else if "!ip!"=="n" (
		echo 跳过设置过程成功！
		echo [%date% %time%]scrt_home:standard >>"%logs%"
	 ) else (
		echo 无效输入，请输入y或 n。
		echo [%date% %time%]auto mode:ERROR >>"%logs%"
	)
	echo [%date% %time%]home_dir set >>"%logs%"
	echo SCRT-main.set: >"%set%"
	echo.
	echo 静默运行说明：当开启静默模式后，所有延时代码将不会运行，并禁用本程序的ping测试
	echo                           适用于需要自启动或仅需要功能不需要UI的人
	set /p ip=您想让SCRT静默运行吗？（y/n）:
	if "!ip!"=="y" (
		set auto=T
		echo 设置成功！
		echo automode:T >> "%set%"
		echo [%date% %time%]auto mode:T >>"%logs%"
	) else if "!ip!"=="n" (
		echo 跳过设置过程成功！
		echo automode:F >> "%set%"
		echo [%date% %time%]auto mode:F >>"%logs%"
	 ) else (
		echo 无效输入，请输入y或 n。
		echo [%date% %time%]auto mode:ERROR >>"%logs%"
	)
	echo [%date% %time%]auto mode set >>"%logs%"
	echo.
	set /p ip=您想要设置清理目录吗（sage = 5）？（y/n）:
	if "!ip!"=="y" (
		echo 请您在弹出的新窗口中选中要清理的所有文件！
		cleanmgr /sageset:5
		echo 设置成功！
		echo cleanmgrset:T >> "%set%"
		echo [%date% %time%]cleanmgr:T >>"%logs%"
	) else if "!ip!"=="n" (
		echo 跳过设置过程成功！
		echo cleanmgrset:F >> "%set%"
		echo [%date% %time%]cleanmgr:F >>"%logs%"
	 ) else (
		echo 无效输入，请输入y或 n。
		echo [%date% %time%]cleanmgr:ERROR >>"%logs%"
	)
	echo [%date% %time%]cleanmgr set >>"%logs%"
	echo.
	set /p ip=您想要让SCRT自启动运行吗？（y/n）:
	if "!ip!"=="y" (
		echo ECHO:正在启用自启动……
		if %auto% == F (
			Schtasks /Create /SC ONLOGON /TN "SCRT" /TR "%SCRT%" /F
		) else (
			echo start %SCRT% /min >"%subat%"
			echo exit >>"%subat%"
			Schtasks /Create /SC ONLOGON /TN "SCRT" /TR "%subat%" /F
		)
		echo ECHO:启用自启动完成！
		if !errorlevel! == 1 (
			set suserr=T
			echo ERROR:错误！
			echo [%date% %time%]startup set error >>"%logs%"
		) 
		set su=T
		echo 打开成功！
		echo startup:T >> "%set%"
		echo [%date% %time%]startup:T >>"%logs%"
	) else if "!ip!"=="n" (
		set su=F
		echo 关闭成功！
		echo startup:F >> "%set%"
		echo [%date% %time%]startup:F >>"%logs%"
	 ) else (
		echo 无效输入，请输入y或 n。
		echo [%date% %time%]startup:ERROR >>"%logs%"
	)
	echo [%date% %time%]startup set >>"%logs%"
	echo.
	echo 恢复模式说明:每次运行SCRT时会自动尝试修复被恶意软件修改的
	echo                系统文件，特别是中病毒或特殊情况导致文件损坏时！
	echo 警告:此功能在部分性能不佳的电脑上会导致卡顿，请谨慎开启！
	set /p ip=您想要让SCRT以增强模式运行吗？（y/n）:
	if "!ip!"=="y" (
		set sfcs=T
		echo 打开成功！
		echo sfcset:T >> "%set%"
		echo [%date% %time%]sfc:T >>"%logs%"
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
			echo [%date% %time%]mrt:T >>"%logs%"
		) else if "!ip!"=="n" (
			set mrts=F
			echo 关闭成功！
			echo mrtset:F >> "%set%"
			echo [%date% %time%]mrt:F >>"%logs%"
		) else (
			echo 无效输入，请输入y或 n。
			echo [%date% %time%]mrt:ERROR >>"%logs%"
		)
	) else if "!ip!"=="n" (
		set sfcs=F
		set mrts=F
		echo 关闭成功！
		echo sfcset:F >> "%set%"
		echo mrtset:F >> "%set%"
		echo [%date% %time%]sfc:F >>"%logs%"
		echo [%date% %time%]mrt:F >>"%logs%"
	 ) else (
		echo 无效输入，请输入y或 n。
		echo [%date% %time%]sfc:ERROR >>"%logs%"
	)
	echo [%date% %time%]sfc^&mrt set >>"%logs%"
	TIMEOUT /T 3
) else (
	echo 自动模式已设置
	echo.
	echo cleanmgr已设置
	echo.
	type "%set%" | findstr /c:"startup:T" >nul && set su=T || set su=F
	echo 自启动已设置
	echo [%date% %time%]startup set >>"%logs%"
	echo.
	type "%set%" | findstr /c:"sfcset:T" >nul && set sfcs=T || set sfcs=F
	echo 恢复模式已设置
	echo [%date% %time%]sfc set >>"%logs%"
	echo.
	type "%set%" | findstr /c:"mrtset:T" >nul && set mrts=T || set mrts=F
	echo [%date% %time%]mrt set >>"%logs%"
	echo 增强模式已设置
)
echo.
color 0A&&mode con COLS=120 LINES=50
%cls%
echo. >>"%logs%"
echo ---------------------------------------------------------------------------------------------------- >>"%logs%"
echo network-ping: >>"%logs%"
echo. >>"%logs%"
echo ping#1:www.baidu.com >>"%logs%"
echo 正在清理网络缓存……
del "%userprofile%\Local Settings\Temporary Internet Files\*.*" /s /q /f >nul 2>nul
echo [%date% %time%]Temporary Internet Files cleaned >>"%logs%"
echo 清理完成！
echo.
echo 正在刷新DNS缓存……
ipconfig /flushdns
echo [%date% %time%]Temporary DNS cleaned >>"%logs%"
echo 刷新缓存完成！
if %auto% == F (
	echo.
	echo 正在测试网络连通性（www.baidu.com）……
	ping www.baidu.com
	echo [%date% %time%]ping www.baidu.com completed >>"%logs%"
	echo 网络连通性已测试完成！
	echo 网络测试已完成！
	TIMEOUT /T 2
)
if !errorlevel! == 1 (
	set nperr=T
	echo [%date% %time%]ping error >>"%logs%"
) 
echo. >>"%logs%"
echo network-ping end >>"%logs%"
echo. >>"%logs%"
%cls%&&echo 正在清理电脑垃圾文件……
echo 如遇清理卡住，请稍等一会……
echo.
echo 后台清理中……
echo.
echo 正在启动cleanmgr……
start /min cleanmgr /sagerun:5 /autoclean
echo.
echo 正在自动清理……
echo @echo off >%cleanbat%
echo color 0A^&^mode con COLS=120 LINES=50 >>%cleanbat%
echo powershell -Command "Get-ChildItem 'C:\' -Include '*.old','*.tmp','*.temp' -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.PSIsContainer -eq $false} | Remove-Item -Force"^&^exit >>%cleanbat%
start /min %cleanbat%
start  /min cmd /q /d /c "del %windir%\KB*.log /f /s /q"
start  /min cmd /q /d /c "del /f /s /q %windir%\*.bak"
del "%windir%\Downloaded Program Files\*.*" /s /q /f >nul 2>nul
del "%windir%\System32\LogFiles\*.*" /s /q /f >nul 2>nul
del "%windir%\Help\*.*" /s /q /f >nul 2>nul
start  /min cmd /q /d /c  "del %windir%\temp\*.* /s /q /f"
del %userprofile%\Cookies\*.* /s /q /f >nul 2>nul
del %userprofile%\Recent\*.* /s /q /f >nul 2>nul
del %userprofile%\AppData\Local\Microsoft\Windows\INetCache\IE\*.* /s /q /f >nul 2>nul
del %systemdrive%\ProgramData\Microsoft\Windows\WER\*.* /s /q /f >nul 2>nul
rd /s /q %systemdrive%\$WINDOWS.~BT >nul 2>nul
rd /s /q %windir%\SoftwareDistribution\Download\ >nul 2>nul
md %windir%\SoftwareDistribution\Download\ >nul 2>nul
rd /s /q %userprofile%\AppData\Local\CrashDumps >nul 2>nul
md %userprofile%\AppData\Local\CrashDumps >nul 2>nul
echo. >>"%logs%"
echo [%date% %time%]files cleaned >>"%logs%"
echo.
echo 清理完成！
if %auto% == F (
	TIMEOUT /t 2
)
%cls%&&echo 开始后台修复系统文件！
echo @echo off >"%SFCD%"
echo color 0A^&^mode con COLS=120 LINES=50 >>"%SFCD%"
echo title SFC.bat >>"%SFCD%"
echo SFC /scannow >>"%SFCD%"
echo dism /online /cleanup-image /restorehealth >>"%SFCD%"
if %mrts% == T (
	echo mrt /q /f:y >>"%SFCD%"
	if !errorlevel! == 1 (
		set mrterr=T
		echo ERROR:mrt命令写入失败！
		echo [%date% %time%]mrt error >>"%logs%"
	) 
)
echo exit >>"%SFCD%"
if %sfcs% == T (
	start /min %SFCD%
	echo [%date% %time%]sfc ran >>"%logs%"
	echo 请等待sfc.bat自动修复完成
	if !errorlevel! == 1 (
		set serr=T
		echo ERROR:%SFCD%打开失败！
		echo [%date% %time%]sfc error >>"%logs%"
	)
	echo.
	if %auto% == F (
		TIMEOUT /t 5
	)
)
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
echo ECHO:写入日志中……
echo set: >>"%logs%"
echo auto mode=%auto% >>"%logs%"
echo start up=%su% >>"%logs%"
echo repair mode=%sfcs% >>"%logs%"
echo mrt=%mrts% >>"%logs%"
echo set end >>"%logs%"
echo. >>"%logs%"
echo errors: >>"%logs%"
echo. >>"%logs%"
echo sus error=%suserr% >>"%logs%"
echo initialization error=%ierr% >>"%logs%"
echo network-ping error=%nperr% >>"%logs%"
echo clean error=%cerr% >>"%logs%"
echo SFC-scan error=%serr% >>"%logs%"
echo mrt error=%mrterr% >>"%logs%"
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
%cls%
echo 运行日志在%logs%中
echo.
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
if %auto% == F (
	echo 5秒后自动退出......
	TIMEOUT /T 5
)
echo ECHO:正在退出……
start /min %tc%
endlocal
exit
rem 本文件已经开源，使用GNU通用开源许可证第三版，请访问https://github.com/small-lin-jam/SCRT/！
rem 本文件开源！
rem 备用代码信息begin
rem 制作者：林先生。制作团队：Steven Lin Studio（上海木木工作室）。保留所有权利。
rem 系统清理诊断程序[版本 8.5.2.1 正式版]
rem Steven Lin（林先生）版权所有
rem 本程序受个人版权保护！
rem 备用代码信息end