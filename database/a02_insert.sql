-- 데이터 입력 : 회원
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'aaaa','aa11','홍길동','aaa@naver.com', '1번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'bbbb','bb22','김길동','bbb@naver.com', '2번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'cccc','cc33','이길동','ccc@naver.com', '3번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'dddd','dd44','송길동','ddd@naver.com', '4번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'eeee','ee55','강길동','eee@naver.com', '5번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'ffff','ff66','원길동','fff@naver.com', '6번이');

SELECT * FROM G_MEMBER;

-- 데이터 입력 : 게임
INSERT INTO G_GAME VALUES('카드게임',to_date('2020/12/01','YYYY/MM/DD'),29,'img/game/card.png','integrate_Game.jsp');
INSERT INTO G_GAME VALUES('랜덤게임',to_date('2021/02/11','YYYY/MM/DD'),10,'img/game/random.png','random_Game.jsp');
INSERT INTO G_GAME VALUES('1번게임',to_date('2020/05/07','YYYY/MM/DD'),70,'img/game/1game.png','no1_Game.jsp');
INSERT INTO G_GAME VALUES('2번게임',to_date('2019/12/20','YYYY/MM/DD'),22,'img/game/2game.png','no2_Game.jsp');
INSERT INTO G_GAME VALUES('3번게임',to_date('2021/01/07','YYYY/MM/DD'),102,'img/game/3game.png','no3_Game.jsp');
INSERT INTO G_GAME VALUES('4번게임',to_date('2020/08/22','YYYY/MM/DD'),42,'img/game/4game.png','no4_Game.jsp');

SELECT * FROM G_GAME;

-- 데이터 입력 : 플레이로그
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,1,'카드게임',500);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,3,'랜덤게임',600);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,6,'1번게임',900);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'2번게임',700);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,1,'3번게임',400);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,3,'4번게임',500);

SELECT * FROM G_PLAYLOG;

-- 데이터 입력 : 뱃지
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',200,'/img/badge/grade-6.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',300,'/img/badge/grade-5.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',400,'/img/badge/grade-4.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',500,'/img/badge/grade-3.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',600,'/img/badge/grade-2.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'카드게임',700,'/img/badge/grade-1.png');

SELECT * FROM G_BADGE;


-- 데이터 입력 : 공지사항
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항1#', to_date('2021-01-20 06:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용1.......');
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항2#', to_date('2021-01-20 07:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용2.......');
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항3#', to_date('2021-01-20 08:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용3.......');
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항4#', to_date('2021-01-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용4.......');
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항5#', to_date('2021-01-20 10:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용5.......');
INSERT INTO G_NOTICE VALUES(g_notice_no_seq.nextval, '#공지사항6#', to_date('2021-01-20 11:00:00','YYYY-MM-DD HH24:MI:SS'), '공지내용6.......');

SELECT * FROM G_NOTICE;

-- 데이터 입력 : 자주묻는질문
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문1#', to_date('2021-01-21 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용1....');
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문2#', to_date('2021-01-22 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용2....');
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문3#', to_date('2021-01-23 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용3....');
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문4#', to_date('2021-01-24 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용4....');
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문5#', to_date('2021-01-25 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용5....');
INSERT INTO G_QUESTION VALUES(g_question_no_seq.nextval, '#자주묻는질문6#', to_date('2021-01-26 08:00:00','YYYY-MM-DD HH24:MI:SS'), '질문내용6....');

SELECT * FROM G_QUESTION;