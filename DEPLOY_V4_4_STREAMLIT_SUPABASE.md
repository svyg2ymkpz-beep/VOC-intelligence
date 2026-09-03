# VOC Intelligence V4.4 — Streamlit Community Cloud + Supabase PostgreSQL

## 목표
한국 본사와 중국법인이 같은 URL로 로그인하고 같은 중앙 DB를 사용하는 공개 테스트 환경입니다.

구조:

Korea Browser ─┐
               ├─ Streamlit Community Cloud ── Supabase PostgreSQL
China Browser ─┘                         └──── AI API Secret

## 1. Supabase에서 무료 프로젝트 생성
1. Supabase 계정을 만들고 새 프로젝트를 생성합니다.
2. Project Settings / Database에서 PostgreSQL connection string을 확인합니다.
3. 가능하면 `Session pooler` 또는 제공되는 외부 접속용 connection string을 사용합니다.
4. 비밀번호가 포함된 전체 connection string을 복사합니다.

예:
`postgresql://postgres.xxxxx:PASSWORD@xxxx.pooler.supabase.com:5432/postgres?sslmode=require`

V4.4는 첫 실행 때 users / voc_cases / audit_log 테이블을 자동 생성합니다.
별도 SQL 파일 실행은 필요 없습니다.

## 2. GitHub에 V4.4 업로드
GitHub에서 새 repository를 만들고 V4.4 폴더의 내용 전체를 업로드합니다.

중요:
- `.streamlit/secrets.toml` 실제 파일은 GitHub에 올리지 마세요.
- `.streamlit/secrets.toml.example`만 올립니다.
- `data/voc_intelligence.db`는 공유 DB가 아니므로 GitHub에 올릴 필요가 없습니다.

## 3. Streamlit Community Cloud 배포
1. Streamlit Community Cloud에 GitHub로 로그인합니다.
2. Create app을 선택합니다.
3. Repository / Branch를 지정합니다.
4. Main file path: `app.py`
5. Advanced settings에서 Python 3.12를 선택합니다.

## 4. Secrets 입력
Streamlit App Settings > Secrets에 아래 형태로 입력합니다.

```toml
DATABASE_URL = "postgresql://USER:PASSWORD@HOST:5432/postgres?sslmode=require"

GEMINI_API_KEY = "YOUR_KEY"
GEMINI_MODEL = "gemini-flash-latest"
```

OpenAI/OpenRouter를 쓸 경우 해당 키를 추가해도 됩니다.

API Key를 Secrets에 넣으면 중국법인 사용자는 API Key를 알 필요가 없습니다.

## 5. 첫 로그인
- ID: `admin`
- Password: `ChangeMe123!`

첫 로그인 직후 Settings에서 관리자 비밀번호를 변경하세요.

그다음:
Settings → 사용자 관리 → 중국법인 계정 생성

예:
- Username: china_npi
- Display Name: China NPI
- Role: Editor
- Temporary Password: 임시 비밀번호

## 6. URL 공유
배포가 완료되면 Streamlit에서 다음과 같은 URL이 만들어집니다.

`https://your-app-name.streamlit.app`

이 주소를 중국법인에 공유합니다.
`localhost` 주소는 공유하지 않습니다.

## 7. 테스트 데이터 원칙
공개 테스트 단계에서는:
- 실제 고객명 → Test Customer A
- 실제 LOT → TEST-LOT-001
- 실제 제품코드 → DEMO-TAPE-001
처럼 더미/비식별 데이터를 권장합니다.

실제 고객 VOC/LOT/제품 정보 사용 전에는 회사 보안정책에 맞는 내부 또는 승인된 배포환경으로 옮기는 것을 권장합니다.

## 8. 로컬 실행
DATABASE_URL을 설정하지 않으면 자동으로 SQLite Local Test DB를 사용합니다.

```bash
cd "$HOME/VOC Intelligence/VOC_Intelligence_V4_4"
python3.12 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m streamlit run app.py
```

이 로컬 SQLite와 Cloud PostgreSQL은 별도 DB입니다.
