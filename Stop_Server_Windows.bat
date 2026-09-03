@echo off
cd /d "%~dp0"
where docker >nul 2>nul
if %errorlevel%==0 (
    docker compose down
) else (
    taskkill /F /IM streamlit.exe >nul 2>nul
)
echo VOC Intelligence server stopped.
