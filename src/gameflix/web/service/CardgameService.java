package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import gameflix.web.entity.Member;

public class CardgameService {

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
	

	
	public void CardPlayLog(int m_no,String g_name, int count) {
		
		try {
			setCon();
			String sql="INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,m_no);
			pstmt.setString(2, g_name);
			pstmt.setInt(3,count);
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

	public String selectbadge(int m_no, String g_name) {
        String badge="";
        try {
           setCon();
           String sql="SELECT b_path\r\n"
           		+ "FROM G_BADGE\r\n"
           		+ "WHERE B_SCORE in(\r\n"
           		+ "SELECT\r\n"
           		+ "CASE WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 6000 THEN 6000\r\n"
           		+ "	 WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 5000 THEN 5000\r\n"
           		+ "	 WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 4000 THEN 4000\r\n"
           		+ "	 WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 3000 THEN 3000\r\n"
           		+ "	 WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 2000 THEN 2000\r\n"
           		+ "	 WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO ='"+m_no+"' AND G_NAME ='"+g_name+"') > 0 THEN 1000\r\n"
           		+ "END P_SCORE\r\n"
           		+ "FROM G_PLAYLOG\r\n"
           		+ "WHERE G_NAME ='"+g_name+"' AND M_NO  = '"+m_no+"' AND rownum=1)";
   
           pstmt = con.prepareStatement(sql);
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
		// TODO Auto-generated method stub
		CardgameService dao=new CardgameService();
		dao.selectbadge(1,"2048게임");
		
		
	}

}
