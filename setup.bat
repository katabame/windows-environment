rem `curl -s example.com/setup.bat | cmd`
@echo off
cd /d %~dp0

openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto promotion

for /f %%a in (pkgs.txt) do (
	echo Installing %%a
	winget install %%a --id --silent --force
)
pause
goto end

:promotion
powershell start-process %~nx0 -verb runas

:end
