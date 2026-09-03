@echo off
cd /d "%~dp0"

where docker >nul 2>nul
if %errorlevel%==0 (
    docker compose up -d --build
    start http://localhost:8501
    exit /b 0
)

echo Docker not found. Starting with Python...
if not exist .venv (
    py -3.12 -m venv .venv
)
call .venv\Scripts\activate
python -m pip install -r requirements.txt
streamlit run app.py --server.address=0.0.0.0 --server.port=8501
