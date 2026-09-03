#!/bin/bash
cd "$(dirname "$0")"
if command -v docker >/dev/null 2>&1; then
  docker compose down
else
  pkill -f "streamlit.*app.py" 2>/dev/null || true
fi
echo "VOC Intelligence 서버 종료"
