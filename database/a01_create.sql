
-- 생성 : 회원
CREATE TABLE G_MEMBER (
	m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,
	m_id VARCHAR2(30) CONSTRAINT g_member_id_nn NOT NULL,
	m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,
	m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,
	m_email VARCHAR2(50) CONSTRAINT g_member_email_nn NOT NULL,
	m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL
);

CREATE SEQUENCE g_member_no_seq;
SELECT * FROM G_MEMBER;

-- 생성 : 게임
CREATE TABLE G_GAME (
	g_name VARCHAR2(30) CONSTRAINT g_game_pk PRIMARY KEY,
	g_date DATE CONSTRAINT g_game_date_nn NOT NULL,
	g_cnt NUMBER CONSTRAINT g_game_cnt_nn NOT NULL,
	g_imgPath VARCHAR2(100) CONSTRAINT g_game_imgPath_nn NOT NULL,
	g_link VARCHAR2(100) CONSTRAINT g_game_link_nn NOT NULL
);
SELECT * FROM G_GAME;

-- 생성 : 플레이로그
CREATE TABLE G_PLAYLOG (
	play_no NUMBER CONSTRAINT g_playLog_pk PRIMARY KEY,
	m_no NUMBER CONSTRAINT g_playLog_m_no_fk REFERENCES G_MEMBER(m_no),
	g_name VARCHAR2(30) CONSTRAINT g_playLog_g_name_fk REFERENCES G_GAME(g_name),
	p_score NUMBER CONSTRAINT g_playLob_score_nn NOT NULL
);
CREATE SEQUENCE g_playlog_no_seq;
SELECT * FROM G_PLAYLOG;
SELECT g_playlog_no_seq.nextval FROM DUAL;
-- 생성 : 뱃지
CREATE TABLE G_BADGE (
	b_grade NUMBER CONSTRAINT g_badge_pk PRIMARY KEY,
	g_name VARCHAR2(30) CONSTRAINT g_badge_g_name_fk REFERENCES G_GAME(g_name),
	b_score NUMBER CONSTRAINT g_badge_score_nn NOT NULL,
	b_path VARCHAR2(100) CONSTRAINT g_badge_path_nn NOT NULL
);
CREATE SEQUENCE g_badge_no_seq;
SELECT * FROM G_BADGE;


-- 생성 : 공지사항
CREATE TABLE G_NOTICE (
	ntc_no NUMBER CONSTRAINT g_notice_pk PRIMARY KEY,
	ntc_title VARCHAR(100) CONSTRAINT g_notice_title_nn NOT NULL,
	ntc_date DATE CONSTRAINT g_notice_date_nn NOT NULL,
	ntc_content VARCHAR(200) CONSTRAINT g_notice_content_nn NOT NULL
);
CREATE SEQUENCE g_notice_no_seq;
SELECT * FROM G_NOTICE;

-- 생성 : 자주묻는질문
CREATE TABLE G_QUESTION (
	que_no NUMBER CONSTRAINT g_question_pk PRIMARY KEY,
	que_title VARCHAR(100) CONSTRAINT g_question_title_nn NOT NULL,
	que_date DATE CONSTRAINT g_question_date_nn NOT NULL,
	que_content VARCHAR(200) CONSTRAINT g_question_content_nn NOT NULL
);
CREATE SEQUENCE g_question_no_seq;
SELECT * FROM G_QUESTION;
