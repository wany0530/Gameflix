package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import gameflix.web.entity.Member;


public class GamequizService {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			e.getMessage();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("접속성공");
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

	
	//퀴즈 점수 INSERT로 삽입
	
	
	public void PlaylogInsert(int m_no, String g_name, int score) {		
		try {			
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
					
			pstmt = con.prepareStatement(sql);		
			pstmt.setInt(1,m_no);
			pstmt.setString(2,g_name);
			pstmt.setInt(3, score);
			
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

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       GamequizService dao=new GamequizService();
      
	}

}
