# VOC Intelligence V3.5.6

## V3.0 핵심
- 기존 VOC 검색/수정
- Created By / Created Date 자동 기록
- Updated By / Updated Date / Last Update Summary 자동 기록
- 수정 전 Excel DB 자동 백업
- 사용자명 기록
- V2.4의 Multi-AI / 다국어 UI / Excel DB 유지

## 실행
```bash
cd ~/Downloads/VOC_Streamlit_V3_0
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
streamlit run app.py
```

## 기존 V2.4 DB 이어쓰기
V2.4의 `data/VOC_Master_AI.xlsx`를 V3.0의 `data/` 폴더로 복사하세요. V3.0 실행 시 필요한 이력관리 컬럼을 자동 추가합니다.


## V3.0.1 Hotfix
- 503 / 429 / 5xx / timeout 계열의 일시적 AI 서버 오류 자동 감지
- 선택 모델 자동 재시도
- Gemini 사용 시 다른 Gemini 모델로 자동 전환
- 그래도 실패하면 Local / Rule-based 분석으로 자동 폴백
- 긴 원본 서버 오류 대신 사용자 친화적인 경고 표시


## V3.2 신규 기능
- Dashboard: 전체/Open/Closed/Critical/FACA Due, 고객별·제품별·불량유형별 현황, Open Issue, 최근 수정 VOC
- 사용자명 / AI Provider / 모델 설정 기억
- 선택 시 API Key를 현재 Mac의 로컬 숨김 파일에 저장
- `VOC Intelligence.command` 더블클릭 실행 파일
- `Reset_API_Keys.command` 저장 Key 삭제

## 기존 DB 이어쓰기
기존 V3.0.1의 `data/VOC_Master_AI.xlsx`를 V3.2의 `data/` 폴더로 복사하면 됩니다.


## V3.3 변경사항
### Dashboard
- 전체 VOC
- Open
- Pending
- Over Due
- Drop
- Closed
- High / Critical Dashboard 카드 삭제
- Open 집계에서 Closed / Drop 제외
- Over Due는 Status가 Over Due이거나 FACA Due가 지난 미종결 VOC를 반영

### Status 선택지
Pending / Over Due / Drop을 추가했습니다.

### Mac App 실행
프로젝트 폴더 안의 `VOC Intelligence.app`을 더블클릭하면 실행됩니다.
처음 한 번만 Python 환경/패키지를 준비하며, 이후에는 브라우저가 자동으로 열립니다.

중요: 현재 V3.3의 `.app`은 완전한 단일 독립 실행 파일이 아닙니다.
같은 폴더에 있는 `app.py`, `data`, `requirements.txt` 등을 사용하므로
`VOC_Streamlit_V3_3` 폴더 전체를 그대로 보관해야 합니다.

종료하려면 `Stop VOC Intelligence.command`를 더블클릭하세요.

### 기존 DB 이어쓰기
V3.2의 `data/VOC_Master_AI.xlsx`를 V3.3의 `data/` 폴더에 복사하면 됩니다.


## V3.4 UI / App Polish
- 앱 이름을 `VOC Intelligence`로 단순화
- 전용 앱 아이콘 추가
- macOS `.app` 아이콘 연결
- 브라우저 탭 아이콘 적용
- 상단 시작 화면을 앱형 Hero UI로 변경
- 사이드바에 브랜드 영역 추가
- 시작 시 `VOC Intelligence` 브랜드가 바로 보이도록 정리
- 기존 Dashboard / VOC 분석 / 수정 / 저장 기능은 유지

### 실행
`VOC Intelligence.app`을 더블클릭하면 됩니다.

> 현재 구조는 여전히 같은 폴더 안의 `app.py`, `data`, `assets`, `requirements.txt`를 사용합니다.
> 따라서 `VOC_Streamlit_V3_4` 폴더 전체를 보관해야 합니다.


## V3.4.1 실행 안정화 Hotfix
- 브라우저를 2초 후 무조건 여는 방식 제거
- Streamlit 서버가 실제로 준비될 때까지 최대 60초 확인
- Python 위치 자동 탐색
- 최초 실행 시 가상환경/패키지 설치 오류 감지
- 실행 실패 시 Safari의 localhost 오류 대신 안내창 표시
- 실패 시 `data/voc_app.log`를 TextEdit으로 자동 오픈
- 수동 진단용 `VOC Intelligence - Diagnostic.command` 추가


## V3.5 macOS launcher fix
- `.app`이 `/usr/bin/python3`를 먼저 잡던 문제 수정
- Terminal에서 실제로 사용하는 `python3`를 우선 사용
- 이미 Diagnostic 실행으로 생성된 `.venv`가 있으면 그대로 재사용
- Streamlit의 deprecated `use_container_width`를 `width` 옵션으로 교체


## V3.5 Business Edition
- Today’s Action dashboard
- Quick Status Update with audit history
- Roman VOC brand icon
- Enterprise UI polish


## V3.5.6 Hotfix
- Fixes an important macOS launcher issue: an old Streamlit process on localhost:8501 could remain running.
- The launcher now terminates the stale VOC Streamlit server before starting the app from the current folder.
- The running version is visibly shown as `V3.5.6 Business Edition` in the UI.


## V3.5.6 macOS launch fix
- `.app` now resolves Python through an interactive login shell (`zsh -lic`) so it matches the Python that works in Terminal.
- Existing `.venv` is reused when present.
- Includes a plain-text guide for removing macOS quarantine on the downloaded folder.


## V3.5.6 macOS bootstrap fix
- Finder-launched `.app` no longer tries to create a virtual environment with Apple's `/usr/bin/python3`.
- First launch delegates environment setup to the Terminal-based diagnostic launcher, which matches the user's working Terminal environment.
- Once `.venv/bin/streamlit` exists, subsequent `.app` launches are direct and do not need Terminal.
- Added `Mac_보안경고_한번에_해제.command` to remove quarantine from the whole folder in one step.


## V3.5.6 macOS first-launch fix
- Fixed a Finder/macOS behavior where `open -a Terminal <file.command>` could open Terminal without executing the command.
- The app now explicitly tells Terminal to run the first-launch setup command.
- First-launch terminal output is verbose so any remaining Python issue is immediately visible.


## V3.5.6 macOS launcher redesign
- Removed Terminal/AppleScript from the normal `.app` launch path.
- Automatically removes quarantine attributes from the extracted V3.5.6 folder after the app is permitted to run once.
- Reuses a working `.venv` from an older `VOC_Streamlit_V*` folder when available.
- Avoids Apple's `/usr/bin/python3` if it cannot provide pip/venv.
- Uses `python -m streamlit` for cross-version venv reuse.


## V3.5.6 launcher fix
- If `.venv/bin/python` exists, the app trusts and uses it directly.
- Removed the Finder-side import probe that could reject a working venv.
- Homebrew Python 3.12 paths are checked explicitly.
- Added `VENV_재설치.command` as a one-click repair option.
