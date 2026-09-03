# VOC Intelligence V4.4 Shared Cloud Test Edition

V4.3의 AI/UI 기능을 유지하면서 한국 본사 ↔ 중국법인이 같은 URL과 중앙 DB를 사용할 수 있도록 만든 공유 테스트 버전입니다.

## 핵심
- Top Tab UI + Gothic VOC branding
- Admin / Editor / Viewer login
- AI VOC 자동 구조화
- KO / ZH / EN summary
- Gemini / OpenRouter / OpenAI / Local
- Audit Log
- Local: SQLite fallback
- Cloud: PostgreSQL via `DATABASE_URL`
- Streamlit Secrets 기반 서버 API Key
- Streamlit Community Cloud + Supabase 배포 가이드 포함

## 실행 모드
`DATABASE_URL` 없음 → Local SQLite

`DATABASE_URL` 있음 → Shared PostgreSQL

자세한 배포 방법은 `DEPLOY_V4_4_STREAMLIT_SUPABASE.md`를 보세요.
