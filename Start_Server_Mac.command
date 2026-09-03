#!/bin/bash
cd "$(dirname "$0")"

if command -v docker >/dev/null 2>&1; then
  docker compose up -d --build
  echo
  echo "VOC Intelligence 서버가 시작되었습니다."
  echo "같은 네트워크: http://SERVER_IP:8501"
  open http://localhost:8501
else
  echo "Docker가 없습니다. Python 방식으로 실행합니다."
  if [ ! -d ".venv" ]; then
    python3.12 -m venv .venv
  fi
  source .venv/bin/activate
  python -m pip install -r requirements.txt
  streamlit run app.py --server.address=0.0.0.0 --server.port=8501
fi
