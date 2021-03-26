/*		회원테이블		*/
CREATE TABLE G_MEMBER (
	m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,
	m_id VARCHAR2(30) CONSTRAINT g_member_id_nn unique,
	m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,
	m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,
	m_email VARCHAR2(50) CONSTRAINT g_member_email_nn unique,
	m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL
);
CREATE SEQUENCE g_member_no_seq;

INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'aaaa','aa11','홍길동','aaa@naver.com', '1번이');
INSERT INTO G_MEMBER VALUES(1, 'bbbb','bb22','김길동','bbb@naver.com', '2번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'cccc','cc33','이길동','ccc@naver.com', '3번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'dddd','dd44','송길동','ddd@naver.com', '4번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'eeee','ee55','강길동','eee@naver.com', '5번이');
INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, 'ffff','ff66','원길동','fff@naver.com', '6번이');
SELECT * FROM G_MEMBER;


/*		게임테이블		*/
CREATE TABLE G_GAME (
	g_name VARCHAR2(30) CONSTRAINT g_game_pk PRIMARY KEY,
	g_date DATE CONSTRAINT g_game_date_nn NOT NULL,
	g_cnt NUMBER CONSTRAINT g_game_cnt_nn NOT NULL,
	g_imgPath VARCHAR2(100) CONSTRAINT g_game_imgPath_nn NOT NULL,
	g_link VARCHAR2(100) CONSTRAINT g_game_link_nn NOT NULL
);

INSERT INTO G_GAME VALUES('카드게임',to_date('2020/12/01','YYYY/MM/DD'),29,'img/game/card.png','integrate_Game.jsp');
INSERT INTO G_GAME VALUES('랜덤게임',to_date('2021/02/11','YYYY/MM/DD'),10,'img/game/random.png','random_Game.jsp');
INSERT INTO G_GAME VALUES('1번게임',to_date('2020/05/07','YYYY/MM/DD'),70,'img/game/1game.png','no1_Game.jsp');
INSERT INTO G_GAME VALUES('2번게임',to_date('2019/12/20','YYYY/MM/DD'),22,'img/game/2game.png','no2_Game.jsp');
INSERT INTO G_GAME VALUES('3번게임',to_date('2021/01/07','YYYY/MM/DD'),102,'img/game/3game.png','no3_Game.jsp');
INSERT INTO G_GAME VALUES('4번게임',to_date('2020/08/22','YYYY/MM/DD'),42,'img/game/4game.png','no4_Game.jsp');

SELECT * FROM g_game;

/*		플레이 기록테이블		*/
CREATE TABLE G_PLAYLOG (
	play_no NUMBER CONSTRAINT g_playLog_pk PRIMARY KEY,
	m_no NUMBER CONSTRAINT g_playLog_m_no_fk REFERENCES G_MEMBER(m_no) ON DELETE CASCADE ,
	g_name VARCHAR2(30) CONSTRAINT g_playLog_g_name_fk REFERENCES G_GAME(g_name) ON DELETE CASCADE,
	p_score NUMBER CONSTRAINT g_playLob_score_nn NOT NULL
);

CREATE SEQUENCE g_playlog_no_seq;

INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,1,'카드게임',500);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'랜덤게임',600);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,6,'1번게임',900);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'2번게임',700);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,1,'3번게임',400);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,3,'4번게임',500);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'카드게임',600);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'2048',600);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'음료통합게임',200);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'테트리스',600);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'퀴즈게임',1000);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'길찾기게임',800);
INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,2,'1번게임',800);

SELECT * FROM G_PLAYLOG;

/*		뱃지테이블		*/
CREATE TABLE G_BADGE (
	b_grade NUMBER CONSTRAINT g_badge_pk PRIMARY KEY,
	g_name VARCHAR2(30) CONSTRAINT g_badge_g_name_fk REFERENCES G_GAME(g_name) ON DELETE cascade,
	b_score NUMBER CONSTRAINT g_badge_score_nn NOT NULL,
	b_path VARCHAR2(100) CONSTRAINT g_badge_path_nn NOT NULL
);

CREATE SEQUENCE g_badge_no_seq;

INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',1000,'img/badge/grade-6.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',2000,'img/badge/grade-5.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',3000,'img/badge/grade-4.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',4000,'img/badge/grade-3.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',5000,'img/badge/grade-2.png');
INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',6000,'img/badge/grade-1.png');

SELECT * FROM G_BADGE;

-- 생성 : 게시글
CREATE TABLE G_ARTICLE (
   art_no NUMBER PRIMARY KEY, -- 게시글 고유 번호 
   art_cate varchar2(30) NOT NULL, -- 분류 : qna/ notice
   art_title varchar2(300) NOT NULL, -- 글 제목 
   art_content varchar2(4000) NOT NULL, -- 글 내용
   art_credte DATE NOT NULL -- 작성일
);
CREATE SEQUENCE g_article_no_seq; -- 게시글 고유번호 SEQUENCE
SELECT * FROM g_article;

INSERT INTO g_article values(g_article_no_seq.nextval, 'qna', '제목4', '내용4', sysdate);
INSERT INTO g_article values(g_article_no_seq.nextval, 'notice', '제목5', '내용5', sysdate);


DROP TABLE G_MEMBER;
DROP TABLE G_ARTICLE;
DROP TABLE G_GAME;
DROP TABLE G_PLAYLOG;
DROP TABLE G_BADGE;
DROP SEQUENCE g_member_no_seq;
DROP SEQUENCE g_playlog_no_seq;
DROP SEQUENCE g_badge_no_seq;
DROP SEQUENCE g_article_no_seq;
SELECT * FROM G_MEMBER;
SELECT * FROM G_ARTICLE;
SELECT * FROM G_GAME;
SELECT * FROM G_PLAYLOG;


SELECT * FROM G_BADGE;
