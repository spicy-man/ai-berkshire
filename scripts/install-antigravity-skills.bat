@echo off
setlocal

for %%I in ("%~dp0..") do set "ROOT=%%~fI"

if "%1"=="--global" (
  set "DEST=%USERPROFILE%\.gemini\config\skills"
) else (
  set "DEST=%ROOT%\.agents\skills"
)

where py >nul 2>nul
if %ERRORLEVEL%==0 (
  set "PY=py -3"
) else (
  set "PY=python"
)

%PY% "%ROOT%\scripts\sync-codex-skills.py"
if errorlevel 1 exit /b %ERRORLEVEL%

if not exist "%DEST%" mkdir "%DEST%"
if errorlevel 1 exit /b %ERRORLEVEL%

for /d %%D in ("%ROOT%\codex-skills\*") do (
  if exist "%DEST%\%%~nxD" rmdir /s /q "%DEST%\%%~nxD"
  if errorlevel 1 exit /b 1
  xcopy "%%~fD" "%DEST%\%%~nxD\" /E /I /Y >nul
  if errorlevel 1 exit /b 1
)

echo Installed Antigravity skills to %DEST%
if "%1"=="--global" (
  echo Mode: Global - ~/.gemini/config/skills
) else (
  echo Mode: Project - .agents/skills
  echo Tip: Run ".\scripts\install-antigravity-skills.bat --global" for global installation across all projects.
)
