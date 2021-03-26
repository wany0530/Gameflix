CREATE TABLE G_GAME (
	g_name VARCHAR2(30) CONSTRAINT game_pk PRIMARY KEY,
	g_date DATE CONSTRAINT game_date_nn NOT NULL,
	g_cnt NUMBER CONSTRAINT game_cnt_nn NOT NULL,
	g_imgPath VARCHAR2(100) CONSTRAINT game_imgPath_nn NOT NULL,
	g_link VARCHAR2(100) CONSTRAINT game_link_nn NOT NULL
);

INSERT INTO G_GAME VALUES('카드게임',to_date('2020/12/01','YYYY/MM/DD'),29,'img/game/card.png','integrate_Game.jsp');
INSERT INTO G_GAME VALUES('랜덤게임',to_date('2021/02/11','YYYY/MM/DD'),10,'img/game/random.png','random_Game.jsp');
INSERT INTO G_GAME VALUES('1번게임',to_date('2020/05/07','YYYY/MM/DD'),70,'img/game/1game.png','no1_Game.jsp');
INSERT INTO G_GAME VALUES('2번게임',to_date('2019/12/20','YYYY/MM/DD'),22,'img/game/2game.png','no2_Game.jsp');
INSERT INTO G_GAME VALUES('3번게임',to_date('2021/01/07','YYYY/MM/DD'),102,'img/game/3game.png','no3_Game.jsp');
INSERT INTO G_GAME VALUES('4번게임',to_date('2020/08/22','YYYY/MM/DD'),42,'img/game/4game.png','no4_Game.jsp');

SELECT * FROM G_GAME ORDER BY g_date DESC;
DROP TABLE g_game;
DROP TABLE G_BADGE ;
DROP TABLE G_PLAYLOG ;

-- 전체게임 조회(한 페이지에 10개씩 표시)
------------------------------------------------------------------------------
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
)
WHERE num BETWEEN 1 AND 10;



-- 뷰 생성
CREATE VIEW GAME_VIEW
AS
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
);


-- 뷰를 사용한 간단한 조회 가능
SELECT * FROM GAME_VIEW WHERE num BETWEEN 1 AND 3;
SELECT * FROM GAME_VIEW;

------------------------------------------------------------------------------


-- 인기게임 3개 가져오기
------------------------------------------------------------------------------
SELECT * FROM (
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY g_cnt DESC
	) s
)
WHERE NUM IN(1,2,3);

-- 뷰생성
CREATE VIEW HOTGAME
AS
SELECT * FROM (
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY g_cnt DESC
	) s
);
SELECT * FROM HOTGAME WHERE NUM IN(1,2,3);
------------------------------------------------------------------------------


-- 최신등록된 게임 3개 가져오기
------------------------------------------------------------------------------
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
)
WHERE num IN(1,2,3);

-- 뷰 생성
CREATE VIEW NEWGAME
AS
SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
);

-- 뷰를 사용한 간단한 조회 가능
SELECT * FROM NEWGAME WHERE NUM IN(1,2,3);

------------------------------------------------------------------------------
-- 전체게임갯수
SELECT count(*) cnt FROM G_GAME;

DROP table G_GAME;

------------------------------------------------------------------------------

-- 게임 지우기
DELETE FROM G_BADGE WHERE g_name = '3번게임';
DELETE FROM G_PLAYLOG WHERE g_name = '3번게임';
DELETE FROM G_GAME WHERE g_name = '3번게임';
------------------------------------------------------------------------------

-- insert
INSERT INTO G_GAME VALUES('4번게임',SYSDATE,0,'','');

DROP VIEW NEWGAME;
DROP VIEW HOTGAME;

DROP TABLE G_GAME;
DROP TABLE G_PLAYLOG ;
DROP TABLE G_BADGE;
SELECT * FROM G_GAME;
SELECT * FROM G_PLAYLOG;
SELECT * FROM G_BADGE;

SELECT g_name FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_GAME ORDER BY G_DATE DESC
		) s
);

SELECT * FROM ( 
	SELECT ROWNUM num, s.* FROM (
		SELECT * FROM G_NOTICE ORDER BY NTC_DATE DESC
		) s
) WHERE NUM BETWEEN 1 AND 10;

SELECT * FROM ( 
	SELECT ROWNUM num, q.* FROM (
		SELECT * FROM G_QUESTION ORDER BY QUE_DATE DESC
		) q
) WHERE NUM BETWEEN 1 AND 10;


SELECT * FROM G_NOTICE;
SELECT * FROM G_QUESTION;
SELECT * FROM G_MEMBER;
SELECT * FROM G_PLAYLOG;

-- top5 유저 읽어오기
SELECT ROWNUM, top.* FROM (
	SELECT M_NO, SUM(P_SCORE) AS point FROM G_PLAYLOG
		GROUP BY M_NO
		ORDER BY point DESC
) top
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT M_NO, SUM(P_SCORE) AS point FROM G_PLAYLOG 
		GROUP BY M_NO
		ORDER BY point DESC;
		
-- 게임 점수 변경
UPDATE G_PLAYLOG
   SET P_SCORE = 1000
 WHERE G_NAME = '1번게임'
   AND M_NO = '1';

-- 해당데이터 없으면 INSERT문 실행
INSERT INTO G_PLAYLOG 
VALUES(g_playlog_no_seq.nextval,1,'1번게임',500);
  
  
-- 점수 비교를 위해, 해당 회원의 해당게임 점수 읽어오기
SELECT P_SCORE FROM G_PLAYLOG
WHERE G_NAME = '3번게임'
  AND M_NO = 1;
  
SELECT * FROM G_MEMBER;
SELECT * FROM G_GAME;
SELECT * FROM G_PLAYLOG;
SELECT * FROM G_BADGE;

SELECT * FROM NEWGAME;
SELECT * FROM HOTGAME;


DROP TABLE G_MEMBER;
DROP TABLE G_GAME;
DROP TABLE G_PLAYLOG;
DROP TABLE G_BADGE;

DROP VIEW NEWGAME;
DROP VIEW HOTGAME;

SELECT * FROM (
SELECT ROWNUM num, g.* FROM(
	SELECT * FROM G_GAME WHERE G_NAME LIKE '%%' ORDER BY G_DATE DESC
) g)
WHERE NUM BETWEEN 1 AND 10;

SELECT * FROM G_MEMBER;
SELECT * FROM G_PLAYLOG;
SELECT * FROM G_GAME;

CREATE SEQUENCE G_PLAYLOG_SEQ;

INSERT INTO G_PLAYLOG
VALUES(g_playlog_seq.nextval,7,'음료게임',100);
INSERT INTO G_PLAYLOG
VALUES(g_playlog_seq.nextval,7,'4번게임',100);
INSERT INTO G_PLAYLOG
VALUES(g_playlog_seq.nextval,7,'카드게임',100);
INSERT INTO G_PLAYLOG
VALUES(g_playlog_seq.nextval,7,'퀴즈게임',100);


SELECT m_id
  FROM G_MEMBER
  
  
SELECT m.M_NAME, m.M_NO, SUM(P_SCORE)
  FROM G_PLAYLOG g, G_MEMBER m
GROUP BY m.M_NO, m_name;

SELECT m.m_name
  FROM G_PLAYLOG g, G_MEMBER m
 HAVING m.m_no = (
	SELECT m_no, sum(p_score)
	 FROM G_PLAYLOG
	GROUP BY m_no 
 );
SELECT rownum, n.*
  FROM (
	SELECT m.m_name,g.m_no, sum(p_score) s
		 FROM G_PLAYLOG g, G_MEMBER m
		WHERE g.M_NO = m.M_NO
		GROUP BY g.m_no, m.m_name
		ORDER BY s desc
) n
WHERE rownum BETWEEN 1 AND 5;

SELECT * FROM G_PLAYLOG ;
SELECT rownum, n.*
  FROM (
	SELECT m.m_name,g.m_no, sum(p_score) score
		 FROM G_PLAYLOG g, G_MEMBER m
		WHERE g.M_NO = m.M_NO
		GROUP BY g.m_no, m.m_name
		ORDER BY score desc
) n
WHERE rownum BETWEEN 1 AND 5;

SELECT * FROM G_PLAYLOG;

SELECT g_name, count(*)
 FROM G_PLAYLOG
GROUP BY g_name;


SELECT rownum, g.* FROM (
	SELECT p.g_name, count(*) cnt, g.G_IMGPATH, g.G_LINK 
	  FROM G_PLAYLOG p, G_GAME g
	 WHERE p.G_NAME = g.G_NAME
	GROUP BY p.g_name, g.G_IMGPATH, g.G_LINK 
	ORDER BY cnt DESC
) g;
SELECT * FROM G_GAME;
WHERE rownum IN(1,2,3);
SELECT COUNT(g_name) count FROM ( 
	SELECT * FROM G_GAME WHERE G_NAME LIKE '%%'
);