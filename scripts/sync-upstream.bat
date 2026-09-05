@echo off
setlocal

for %%I in ("%~dp0..") do set "ROOT=%%~fI"

pushd "%ROOT%"

echo [AI Berkshire] Fetching latest updates from upstream (xbtlin/ai-berkshire)...
git fetch upstream
if errorlevel 1 (
    echo [ERROR] Failed to fetch from upstream. Please check your network or upstream remote configuration.
    popd
    exit /b 1
)

echo [AI Berkshire] Syncing skills, tools, and framework files...
git checkout upstream/main -- skills codex-skills codex-prompts tools scripts docs tests assets CLAUDE.md AGENTS.md
if errorlevel 1 (
    echo [ERROR] Failed to checkout upstream framework files.
    popd
    exit /b 1
)

where py >nul 2>nul
if %ERRORLEVEL%==0 (
  set "PY=py -3"
) else (
  set "PY=python"
)

echo [AI Berkshire] Verifying and synchronizing Codex skills...
%PY% "scripts\sync-codex-skills.py"

echo.
echo ========================================================
echo [AI Berkshire] Framework and skills synced successfully!
echo Note: reports/ and personal data are kept intact.
echo ========================================================
echo.
git status -s

popd
