## GameFlix(플래시 게임 서비스 사이트)

## 담당영역

> 테트리스

> 마이페이지( 회원 관리, 개인 게임 랭킹)

<br>

## 기간

> 2021.02.01 ~ 2021.02.28

<br>

## 사용기술

> MVC1 패턴

> JavaBean

> addEventListener

<br>

### 데이터 베이스 설계

![image](https://user-images.githubusercontent.com/77144929/116000484-64360b00-a62b-11eb-9c52-929ff4792497.png)

<br>

#### 테트리스
* 테트리스 게임
* [ L, ㅗ, ㅁ, l, Z ] 5가지 모양 존재
* W [모양변경] A [좌측 이동] S[아래 1칸 이동] D[우측 이동] 블럭 컨트롤
* 하나의 열을 모두 채울시 100점씩 추가
* 시작 / 일시정지 버튼 생성
* 게임이 끝난 후 점수결과 페이지로 이동
* 나가기 클릭시 해당 점수가 DB에 저장.

![ezgif com-gif-maker (6)](https://user-images.githubusercontent.com/77144929/116000789-9a27bf00-a62c-11eb-8e3e-473fed0a162b.gif)


### 마이페이지
#### 회원 상세 페이지
* 회원정보(이름/아이디/비밀번호/이메일/닉네임)를 출력
* 회원 탈퇴 클릭시 회원탈퇴(DB에서 user데이터 삭제)
* 회원 수정 클릭시 수정 페이지로 이동

![ezgif com-gif-maker (7)](https://user-images.githubusercontent.com/77144929/116001069-b37d3b00-a62d-11eb-9c75-2cfe467e1e9e.gif)

#### 회원 수정 페이지

* 비밀번호는 type="password"를 통해 암호화.
* 모든 정보 수정 가능

![ezgif com-gif-maker (8)](https://user-images.githubusercontent.com/77144929/116001199-3d2d0880-a62e-11eb-9c05-f92ece9f608f.gif)

#### 개인 랭킹 페이지
* 여러 게임 중 점수가 가장 높은 6개의 게임플레이 로그기록을 나타냄 
* (6가지 게임 플레이 필수, 기록 null일 경우 페이지 이동 불가)
* 상단 6개(회색 box) 각 점수에 해당하는 뱃지 및 점수 게임 점수 표기
* 하단 6개(빨간 box) 각 게임의 1등 닉네임/점수를 보여준다.

![ezgif com-gif-maker (11)](https://user-images.githubusercontent.com/77144929/116001351-086d8100-a62f-11eb-8ed3-24254ad7bacc.gif)

<br>

![ezgif com-gif-maker (9)](https://user-images.githubusercontent.com/77144929/116001232-664d9900-a62e-11eb-9bf7-2390a5f4ee12.gif)
