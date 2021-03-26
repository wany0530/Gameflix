package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import gameflix.web.entity.Badge;
import gameflix.web.entity.Member;
import gameflix.web.entity.PlayLog;

public class Gameflix_DAO {
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
	
	
	//회원 정보 가져오기.
	public Member m_getinfo(String m_id, String m_pw) {
		Member m = null;
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "SELECT * FROM G_MEMBER WHERE M_ID =? AND M_PW =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_pw"), rs.getString("m_name"), rs.getString("m_email"), rs.getString("m_nickname"));
			}
			//sql이 올바르면 아이디가 출력될것이다.
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return m;
	}
	// 회원 정보 업데이트
	public void uptMember(Member m1) {
		try {
			setCon();
			String sql ="UPDATE G_MEMBER\r\n"
					+ "	SET m_pw = ?,\r\n"
					+ "		m_name = ?,\r\n"
					+ "		m_email = ?,\r\n"
					+ "		M_NICKNAME =?\r\n"
					+ "	WHERE m_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m1.getM_pw());
			pstmt.setString(2, m1.getM_name());
			pstmt.setString(3, m1.getM_email());
			pstmt.setString(4, m1.getM_nickname());
			pstmt.setInt(5, m1.getM_no());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB문제");
			e.printStackTrace();
			e.getMessage();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e2) {
			e2.printStackTrace();
			e2.getMessage();
		}
	}
	// 회원이 플레이한 상위6개 정보(게임명, 점수)
	public ArrayList<PlayLog> bestGameInfo(int m_no) {
		ArrayList<PlayLog> bgilist = new ArrayList<PlayLog>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "SELECT  G_NAME, max(P_SCORE) P_SCORE \r\n"
					+ "FROM G_PLAYLOG \r\n"
					+ "WHERE M_NO = ?\r\n"
					+ "GROUP BY g_name \r\n"
					+ "ORDER BY p_score desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PlayLog p = new PlayLog(rs.getString("g_name"), rs.getInt("p_score"));
				bgilist.add(p);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("##DB 관련 에러##");
			e.printStackTrace();
			e.getMessage();
		}catch (Exception e) {
			System.out.println("##기타 관련 에러##");
			e.printStackTrace();
			e.getMessage();
		}
		return bgilist;
	}
	
	// 뱃지 이미지명 ( 진행한 게임들중 상위 6개의 게임들 중 각각의 최고점수를 가져와 
	//				일일이 비교해 뱃지이미지명을 가져와야되기때문에 
	//				ArrayList를 활용하지 못하고 객체 하나씩을 불러와야한다.) 
		public Badge getbadge(int m_no, String g_name) {
			Badge path = null;
			try {
				setCon();
				stmt = con.createStatement();
				String sql = "SELECT b_path\r\n"
						+ "FROM G_BADGE gb\r\n"
						+ "WHERE B_SCORE in(\r\n"
						+ "	SELECT \r\n"
						+ "		CASE WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 6000 THEN 6000\r\n"
						+ "			WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 5000 THEN 5000\r\n"
						+ "			WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 4000 THEN 4000\r\n"
						+ "			WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 3000 THEN 3000\r\n"
						+ "			WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 2000 THEN 2000\r\n"
						+ "			WHEN (SELECT max(P_SCORE) FROM G_PLAYLOG WHERE M_NO = '"+m_no+"' AND G_NAME ='"+g_name+"') > 0 THEN 1000\r\n"
						+ "		END P_SCORE\r\n"
						+ "	FROM G_PLAYLOG\r\n"
						+ "	WHERE G_NAME = '"+g_name+"' AND M_NO  = '"+m_no+"' AND rownum=1)";
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					path = new Badge(rs.getString("B_path"));
				}
				System.out.println(path.getB_Path());
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("##DB 관련 에러##");
				e.printStackTrace();
				e.getMessage();
			}catch (Exception e) {
				System.out.println("##기타 관련 에러##");
				e.printStackTrace();
				e.getMessage();
			}
			return path;
		}
		// 최고점수 (게임별 최고점수에 만족하는 인원의 정보를 가져오는 목적)
		// ArrayList를 쓰지못하는 이유는 동점자 발생으로 정보를 색출하기 힘들기 떄문에 일일이 하나씩 해야한다.
	public PlayLog bestScoreUserInfo(String g_name) {
		PlayLog phs = null;
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "SELECT * \r\n"
					+ "FROM G_PLAYLOG\r\n"
					+ "WHERE P_SCORE in (\r\n"
					+ "	SELECT max(P_SCORE) \r\n"
					+ "	FROM G_PLAYLOG\r\n"
					+ "	GROUP BY G_NAME\r\n"
					+ ") and g_name = ? AND rownum=1\r\n"
					+ "ORDER BY PLAY_NO";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, g_name);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							phs = new PlayLog(rs.getInt("play_no"),
									rs.getInt("m_no"), rs.getString("g_name"),rs.getInt("p_score")
									);
						}
						rs.close();
						pstmt.close();
						con.close();
					} catch (SQLException e) {
						System.out.println("##DB 관련 에러##");
						e.printStackTrace();
						e.getMessage();
					}catch (Exception e) {
						System.out.println("##기타 관련 에러##");
						e.printStackTrace();
						e.getMessage();
					}
					return phs;
				}
	// 최고점수를 가진 플레이어의 닉네임 ( 위 최고점수와 마찬가지로 동점자 발생시 6개 초과)
	  public Member HighestPlayerNick(int m_no) { 
		  Member php = null; 
		  try {
			  setCon(); 
			  con.setAutoCommit(false); 
			  String sql = "SELECT * FROM G_MEMBER WHERE m_no = ?";
			  pstmt = con.prepareStatement(sql); 
			  pstmt.setInt(1, m_no); 
			  rs = pstmt.executeQuery(); 
			  while(rs.next()) { 
				  php = new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_pw"), rs.getString("m_name"), rs.getString("m_email"), rs.getString("m_nickname"));
	
			  }
			  System.out.println(php.getM_nickname()); 
			  rs.close(); 
			  pstmt.close();
			  con.close(); 
			  } 
		  catch (SQLException e) { 
			  System.out.println("##DB 관련 에러##");
			  e.printStackTrace(); 
			  e.getMessage(); 
		  }catch (Exception e) {
		  		System.out.println("##기타 관련 에러##"); 
		  		e.printStackTrace(); 
		  		e.getMessage(); 
		  }
		  return php; 
	  }
	// 테트리스 점수 playlog에 삽입
	  public void playlogInsert(PlayLog pl) {
		  try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO G_PLAYLOG values(\r\n"
					+ "	g_playlog_no_seq.nextval, ?, ?, ?\r\n"
					+ ")";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pl.getM_no());
			pstmt.setString(2, pl.getG_name());
			pstmt.setInt(3, pl.getP_score());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB오류");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	  }
	  public void delUser(Member m) {
		  try {
			setCon();
			con.setAutoCommit(false);
			String sql="DELETE\r\n"
					+ "FROM G_MEMBER\r\n"
					+ "WHERE m_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m.getM_no());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("DB문제");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				e1.getMessage();
				System.out.println("rollback 문제");
			}
		}catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			System.out.println("기타문제");
		}
	  }
	public static void main(String[] args) {
		Gameflix_DAO dao = new Gameflix_DAO();
	//	dao.insertMember(new Member(0,"a","1","홍길동","abc@naver.com","닉네임1"));
	//	dao.bestGameInfo(0).get(0).getP_score();
	//	dao.m_getinfo("bbbb", "zxcv123");
	//	dao.bestGameInfo(3).size();
	//	dao.HighestScore("랜덤게임");
	dao.playlogInsert(new PlayLog(0,1,"1번게임", 5000));
	
	}
}
