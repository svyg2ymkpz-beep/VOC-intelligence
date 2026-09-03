#!/bin/bash
cd "$(dirname "$0")"
rm -f data/.google_gemini_key data/.openrouter_free_key data/.openai_key
echo "저장된 로컬 API Key를 삭제했습니다."
read -n 1 -s -r -p "아무 키나 누르면 종료됩니다..."
