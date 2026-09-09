@echo off
setlocal

for %%I in ("%~dp0..") do set "ROOT=%%~fI"

pushd "%ROOT%"

git remote get-url upstream >nul 2>nul
if errorlevel 1 (
    echo [AI Berkshire] Upstream remote not found. Adding upstream: https://github.com/xbtlin/ai-berkshire.git
    git remote add upstream https://github.com/xbtlin/ai-berkshire.git
)

echo [AI Berkshire] Fetching latest updates from upstream (xbtlin/ai-berkshire)...
git fetch upstream
if errorlevel 1 (
    echo [ERROR] Failed to fetch from upstream. Please check your network or upstream remote configuration.
    pause
    popd
    exit /b 1
)

echo [AI Berkshire] Syncing skills, tools, and framework files...
git checkout upstream/main -- skills codex-skills codex-prompts tools scripts docs tests assets CLAUDE.md AGENTS.md reports/_index
if errorlevel 1 (
    echo [ERROR] Failed to checkout upstream framework files.
    pause
    popd
    exit /b 1
)

where py >nul 2>nul
if %ERRORLEVEL%==0 (
  set "PY=py -3"
) else (
  set "PY=python"
)

echo [AI Berkshire] Verifying and synchronizing Codex skills and prompts...
%PY% "scripts\sync-codex-skills.py"
if exist "%ROOT%\scripts\sync-codex-prompts.py" (
    %PY% "%ROOT%\scripts\sync-codex-prompts.py"
)

if exist "%ROOT%\.agents\skills" (
    echo [AI Berkshire] Updating Antigravity project skills...
    call "%ROOT%\scripts\install-antigravity-skills.bat"
)

echo.
echo ========================================================
echo [AI Berkshire] Framework and skills synced successfully!
echo Note: reports/ and personal data are kept intact.
echo ========================================================
echo.
git status -s

pause
popd
