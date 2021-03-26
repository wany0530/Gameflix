package gameflix.web.service;
import java.sql.*;
import java.util.ArrayList;
import gameflix.web.entity.*;


public class RankingService {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() throws SQLException {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	      String info="jdbc:oracle:thin:@localhost:1521:xe";
	      con=DriverManager.getConnection(info, "scott", "tiger");
	      System.out.println("접속 성공");
	   }
	
	
	public ArrayList<Ranking> rankList1(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='카드게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public ArrayList<Ranking> rankList2(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='퀴즈게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public ArrayList<Ranking> rankList3(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='2048게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public ArrayList<Ranking> rankList4(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='테트리스게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public ArrayList<Ranking> rankList5(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='음료통합게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public ArrayList<Ranking> rankList6(){
		ArrayList<Ranking> rlist = new ArrayList<Ranking>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = " SELECT DISTINCT m.m_nickname, p.p_score\r\n"
					+ "FROM G_MEMBER m, G_PLAYLOG p\r\n"
					+ "WHERE m.m_no = p.m_no AND g_name='길찾기게임'\r\n"
					+ "ORDER BY p_score desc";	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rlist.add(new Ranking( rs.getString(1), rs.getInt(2)));
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
		
		return rlist;
	}
	
	public static void main(String[] args) {
		 
	}

}
