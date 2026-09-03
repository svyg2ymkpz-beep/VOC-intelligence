#!/bin/bash
PID=$(lsof -tiTCP:8501 -sTCP:LISTEN)
if [ -n "$PID" ]; then
  kill $PID
  echo "VOC Intelligence를 종료했습니다."
else
  echo "실행 중인 VOC Intelligence가 없습니다."
fi
sleep 1
