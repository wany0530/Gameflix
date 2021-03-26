package gameflix.web.service;

import java.sql.*;
import java.util.ArrayList;

import gameflix.web.entity.Game;
import gameflix.web.entity.Member;

public class loginService {

   private Connection con;
   private Statement stmt;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public void setCon() throws SQLException {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      String info="jdbc:oracle:thin:@localhost:1521:xe";
      con=DriverManager.getConnection(info,"scott","tiger");
      System.out.println("접속 성공!");
   }
   
   public void join(Member ins) {
      
      try {
         setCon();
         String sql="INSERT INTO G_MEMBER VALUES(g_member_no_seq.nextval, ?,?,?,?,?)";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1,ins.getM_id());
         pstmt.setString(2,ins.getM_pw());
         pstmt.setString(3,ins.getM_name());
         pstmt.setString(4,ins.getM_email());
         pstmt.setString(5,ins.getM_nickname());
         pstmt.executeUpdate();
         con.commit(); 
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("db 처리 에러");
         System.out.println(e.getMessage());
         try {
            con.rollback();
         } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
         }
      } catch (Exception e) {
         System.out.println("일반 에러");
      }
      
   }
   
   public ArrayList<Member> memList(){
      ArrayList<Member> mlist=new ArrayList<Member>();
      try {
         setCon();
         String sql="SELECT * FROM g_member";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         while(rs.next()) {            
            mlist.add(new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
                  rs.getString(4),rs.getString(5),rs.getString(6)));
         }
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      return mlist;
   }
   
   /*
   public Member login(String id,String pass) {
      Member m=null;
      
      try {
         setCon();
         String sql="SELECT * FROM g_member WHERE m_id=? and m_pw=?";
         pstmt = con.prepareStatement(sql);   
         pstmt.setString(1,id);
         pstmt.setString(2,pass);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
                  rs.getString(4),rs.getString(5),rs.getString(6));
         }
         
         rs.close();
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("DB 관련 에러");
         System.out.println(e.getMessage());
      } catch(Exception e) {
         System.out.println("기타 에러");
         System.out.println(e.getMessage());
      }
      System.out.println(m);
      return m;
   }
   */
   public Member login(Member login) {
        Member m=null;
        try {
           setCon();
           String sql="SELECT * FROM g_member WHERE m_id=? and m_pw=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, login.getM_id());
           pstmt.setString(2, login.getM_pw());
           rs = pstmt.executeQuery();
           if(rs.next()) {
              m = new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
                  rs.getString(4),rs.getString(5),rs.getString(6));
           }
           rs.close();
           pstmt.close();
           con.close();
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           System.out.println("DB에러"+e.getMessage());
        }catch (Exception e) {
           // TODO Auto-generated catch block
           System.out.println("일반에러"+e.getMessage());
        }
        return m;
     }
    
    
   public Member idfind(String name,String email) {
      Member m=null;
      
      try {
         setCon();
         String sql="SELECT * FROM g_member WHERE m_name=? and m_email=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1,name);
         pstmt.setString(2,email);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
                  rs.getString(4),rs.getString(5),rs.getString(6));
         }
         
         rs.close();
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("DB 관련 에러");
         System.out.println(e.getMessage());
      } catch(Exception e) {
         System.out.println("기타 에러");
         System.out.println(e.getMessage());
      }
      //System.out.println(m.getM_id());
      return m;
   }
   
   public Member passfind(String id,String name,String email) {
      Member m=null;
      
      try {
         setCon();
         String sql="SELECT * FROM g_member WHERE m_id=? and m_name=? and m_email=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1,id);
         pstmt.setString(2,name);
         pstmt.setString(3,email);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            m=new Member(rs.getInt(1),rs.getString(2),rs.getString(3),
                  rs.getString(4),rs.getString(5),rs.getString(6));
         }
         
         rs.close();
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("DB 관련 에러");
         System.out.println(e.getMessage());
      } catch(Exception e) {
         System.out.println("기타 에러");
         System.out.println(e.getMessage());
      }
      //System.out.println(m.getM_id());
      return m;
   }
   
   public void updatePass(String id, String pass) {
      try {
         setCon();
         // 2. 대화
         con.setAutoCommit(false);
         String sql="UPDATE g_member SET m_pw=? WHERE m_id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, pass);
         pstmt.setString(2, id);
         pstmt.executeUpdate();
         con.commit();
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("db 처리 에러");
         try {
            con.rollback();
            System.out.println("에러 발생으로 원복 처리");
         } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
            System.out.println("rollback에 문제발생");
         }
      } catch (Exception e) {
         System.out.println("일반 에러");
      }
   }
   
   public void createMemberSeq() {   
      try {
         setCon();
         String sql="CREATE SEQUENCE g_member_no_seq\r\n"
               + "   INCREMENT BY 1\r\n"
               + "   START WITH 1\r\n"
               + "   MINVALUE 1\r\n"
               + "   MAXVALUE 10000\r\n"
               + "   nocache";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
   }
   
   
   public void createMemberTable() {   
      try {
         setCon();
         String sql="CREATE TABLE G_MEMBER (\r\n"
               + "   m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,\r\n"
               + "   m_id VARCHAR2(30) CONSTRAINT g_member_id_nn unique,\r\n"
               + "   m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,\r\n"
               + "   m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,\r\n"
               + "   m_email VARCHAR2(50) CONSTRAINT g_member_email_nn unique,\r\n"
               + "   m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL\r\n"
               + ")";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   
   public void createGameTable() {   
      try {
         setCon();
         String sql="CREATE TABLE G_GAME (\r\n"
               + "   g_name VARCHAR2(30) CONSTRAINT g_game_pk PRIMARY KEY,\r\n"
               + "   g_date DATE CONSTRAINT g_game_date_nn NOT NULL,\r\n"
               + "   g_cnt NUMBER CONSTRAINT g_game_cnt_nn NOT NULL,\r\n"
               + "   g_imgPath VARCHAR2(100) CONSTRAINT g_game_imgPath_nn NOT NULL,\r\n"
               + "   g_link VARCHAR2(100) CONSTRAINT g_game_link_nn NOT NULL\r\n"
               + ")";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   

   public void createPlaySeq() {   
      try {
         setCon();
         String sql="CREATE SEQUENCE g_playlog_no_seq\r\n"
               + "   INCREMENT BY 1\r\n"
               + "   START WITH 1\r\n"
               + "   MINVALUE 1\r\n"
               + "   MAXVALUE 10000\r\n"
               + "   nocache";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
   }
   
   public void createPlayLogTable() {   
      try {
         setCon();
         String sql="CREATE TABLE G_PLAYLOG (\r\n"
               + "   play_no NUMBER CONSTRAINT g_playLog_pk PRIMARY KEY,\r\n"
               + "   m_no NUMBER CONSTRAINT g_playLog_m_no_fk REFERENCES G_MEMBER(m_no) ON DELETE CASCADE ,\r\n"
               + "   g_name VARCHAR2(30) CONSTRAINT g_playLog_g_name_fk REFERENCES G_GAME(g_name) ON DELETE CASCADE,\r\n"
               + "   p_score NUMBER CONSTRAINT g_playLob_score_nn NOT NULL\r\n"
               + ")";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   
   public void createbadgeSeq() {   
      try {
         setCon();
         String sql="CREATE SEQUENCE g_badge_no_seq\r\n"
               + "   INCREMENT BY 1\r\n"
               + "   START WITH 1\r\n"
               + "   MINVALUE 1\r\n"
               + "   MAXVALUE 10000\r\n"
               + "   nocache";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
   }
   public void createbadgeTable() {   
      try {
         setCon();
         String sql="CREATE TABLE G_BADGE (\r\n"
               + "   b_grade NUMBER CONSTRAINT g_badge_pk PRIMARY KEY,\r\n"
               + "   g_name VARCHAR2(30) CONSTRAINT g_badge_g_name_fk REFERENCES G_GAME(g_name) ON DELETE cascade,\r\n"
               + "   b_score NUMBER CONSTRAINT g_badge_score_nn NOT NULL,\r\n"
               + "   b_path VARCHAR2(100) CONSTRAINT g_badge_path_nn NOT NULL\r\n"
               + ")";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }

   public boolean hasBadge() {
	      boolean b=false;
	      
	      try {
	         setCon();
	         String sql="SELECT * FROM G_BADGE";
	         pstmt = con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         b=rs.next();
	         rs.close();
	         pstmt.close();
	         con.close();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         System.out.println("DB 관련 에러");
	         System.out.println(e.getMessage());
	      } catch(Exception e) {
	         System.out.println("기타 에러");
	         System.out.println(e.getMessage());
	      }
	      //System.out.println(m.getM_id());
	      return b;
	  }

   /*
   public void insertBadge() {
		
		String[] sql = {"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',1000,'/img/badge/grade-6.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',2000,'/img/badge/grade-5.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',3000,'/img/badge/grade-4.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',4000,'/img/badge/grade-3.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',5000,'/img/badge/grade-2.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',6000,'/img/badge/grade-1.png')"};
		try {
			setCon();
			for(int i=0;i<sql.length;i++) {
				stmt = con.createStatement();
				stmt.executeUpdate(sql[i]);
			}
			con.commit(); 
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
   */
   
   public void insertBadge() {
		
		String[] sql = {"INSERT INTO G_GAME VALUES('1번게임',sysdate,0,'a','a')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',1000,'img/badge/grade-6.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',2000,'img/badge/grade-5.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',3000,'img/badge/grade-4.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',4000,'img/badge/grade-3.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',5000,'img/badge/grade-2.png')",
						"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'1번게임',6000,'img/badge/grade-1.png')"};
		try {
			setCon();
			for(int i=0;i<sql.length;i++) {
				stmt = con.createStatement();
				stmt.executeUpdate(sql[i]);
			}
			con.commit(); 
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러");
		}
	}
   public void createArticleSeq() {   
      try {
         setCon();
         String sql="CREATE SEQUENCE g_article_no_seq\r\n"
               + "   INCREMENT BY 1\r\n"
               + "   START WITH 1\r\n"
               + "   MINVALUE 1\r\n"
               + "   MAXVALUE 10000\r\n"
               + "   nocache";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      
   }
   public void createArticleTable() {   
      try {
         setCon();
         String sql="CREATE TABLE G_ARTICLE (\r\n"
               + "   art_no NUMBER PRIMARY KEY, \r\n"
               + "   art_cate varchar2(30) NOT NULL,\r\n"
               + "   art_title varchar2(300) NOT NULL, \r\n"
               + "   art_content varchar2(4000) NOT NULL,\r\n"
               + "   art_credte DATE NOT NULL\r\n"
               + ")";
         stmt= con.createStatement();
         rs=stmt.executeQuery(sql);
         rs.close();
         stmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
   
   public static void main(String[] args) {
      // TODO Auto-generated method stub
      loginService dao=new loginService();
      //Member ins=new Member(0,"gggg","ff66","원길동","fff@naver.com", "6번이");
      //dao.join(ins);
      //dao.login("bbbb", "22bb");
      //dao.login("dddd", "44dd");
      //dao.idfind("이길동", "ccc@naver.com");
      //dao.updatePass("himan", "1234");
     // dao.insertBadge();
   }
}