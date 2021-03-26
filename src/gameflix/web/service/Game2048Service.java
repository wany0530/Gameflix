package gameflix.web.service;

import java.sql.*;
import java.util.ArrayList;
import gameflix.web.entity.PlayLog;


public class Game2048Service {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
	      // 1. driver 메모리 로딩
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	      String info="jdbc:oracle:thin:@localhost:1521:xe";
	      con=DriverManager.getConnection(info, "scott", "tiger");
	      System.out.println("접속 성공");
	   }
	
	// 플레이로그번호 시퀀스 생성
	public void createPlaySeq() {	
		try {
			setCon();
			String sql="CREATE SEQUENCE g_playlog_no_seq\r\n"
					+ "	INCREMENT BY 1\r\n"
					+ "	START WITH 1\r\n"
					+ "	MINVALUE 1\r\n"
					+ "	MAXVALUE 10000\r\n"
					+ "	nocache";
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
	
	// 플레이로그 전체 리스트
	public ArrayList<PlayLog> plList(){
		ArrayList<PlayLog> plist = new ArrayList<PlayLog>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT * FROM G_PLAYLOG ORDER BY p_score DESC ";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				plist.add(new PlayLog(rs.getInt(1),rs.getInt(2),
								rs.getString(3),rs.getInt(4)));
			}
			rs.close();
			stmt.close();
			con.close();			
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("##DB예외발생 : "+e.getMessage());
		} catch (Exception e) {
			System.out.println("##일반예외발생 : "+e.getMessage());
		}
		
		return plist;
	}
	// insert
	public void insertPlayLog(int m_no, String g_name, int p_score) {		
		try {			
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
					
			pstmt = con.prepareStatement(sql);		
			pstmt.setInt(1,m_no);
			pstmt.setString(2, g_name);
			pstmt.setInt(3, p_score);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();			
			
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("## DB처리 에러 ##"+e.getMessage());
				try {
					con.rollback();
					System.out.println("에러 발생으로 원복처리");
				
				} catch (SQLException e1) {
					e1.printStackTrace();
					System.out.println("rollback에 문제발생"+e1.getMessage());
				} catch(Exception e2) {
					System.out.println("## 일반 에러 ##"+e2.getMessage());
				
			}
		}
	}

	public void create2048BadgeSeq() {	
		try {
			setCon();
			String sql="CREATE SEQUENCE g_badge_no_seq\r\n"
					+ "	INCREMENT BY 1\r\n"
					+ "	START WITH 1\r\n"
					+ "	MINVALUE 1\r\n"
					+ "	MAXVALUE 6\r\n"
					+ "	nocache";
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

	public void game2048Badge(String g_name) {
		
		String[] sql= {
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',0,200,'img/badge/grade-6.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',201,400,'img/badge/grade-5.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',401,600,'img/badge/grade-4.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',601,800,'img/badge/grade-3.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',801,1000,'img/badge/grade-2.png')",
			"INSERT INTO G_BADGE VALUES(g_badge_no_seq.nextval,'"+g_name+"',1001,1200,'img/badge/grade-1.png')"
		};
		
		try {
			setCon();
			for(int idx=0;idx<sql.length;idx++) {
				pstmt=con.prepareStatement(sql[idx]);
				pstmt.executeUpdate();
			}
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
	
	public String selectbadge(int m_no) {
        String badge="";
        try {
           setCon();
           String sql="SELECT DISTINCT b.b_path\r\n"
           		+ "FROM G_PLAYLOG p, G_BADGE b\r\n"
           		+ "WHERE (SELECT max(p_score) FROM G_PLAYLOG WHERE g_name='2048게임' and m_no=?)\r\n"
           		+ "BETWEEN b.b_minscore AND b.b_maxscore";
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1,m_no);
           rs = pstmt.executeQuery();
           if(rs.next()) {
        	   badge=rs.getString(1);
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
        return badge;
	}

	public String selectGname(String link) {
        String g_name="";
        try {
           setCon();
           String sql="SELECT g_name from G_GAME where g_link=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1,link);
           rs = pstmt.executeQuery();
           if(rs.next()) {
        	   g_name=rs.getString(1);
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
        return g_name;
	}

	
	public static void main(String[] args) {
		Game2048Service service = new Game2048Service();
	}
		
}
