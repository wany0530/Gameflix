package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import gameflix.web.entity.Game;
import gameflix.web.entity.Member;

public class GameService {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "scott";
	private String pw = "tiger";
	
	private Connection conn;
	private PreparedStatement prst;
	private ResultSet rs;

	// DB연결
	private void setCon() {
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("접속성공");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게임 테이블 생성
	public void createTable(String name) {
		String sql = "";
		
		if(name.equals("G_MEMBER")) {
			sql = "CREATE TABLE G_MEMBER (\n"
					+ "	m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,\n"
					+ "	m_id VARCHAR2(30) CONSTRAINT g_member_id_nn NOT NULL,\n"
					+ "	m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,\n"
					+ "	m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,\n"
					+ "	m_email VARCHAR2(50) CONSTRAINT g_member_email_nn NOT NULL,\n"
					+ "	m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL\n"
					+ ")";
		} else if(name.equals("G_GAME")) {
			sql = "CREATE TABLE G_GAME (\n"
					+ "	g_name VARCHAR2(30) PRIMARY KEY,\n"
					+ "	g_date DATE NOT NULL,\n"
					+ "	g_cnt NUMBER NOT NULL,\n"
					+ "	g_imgPath VARCHAR2(100) NOT NULL,\n"
					+ "	g_link VARCHAR2(100) NOT NULL\n"
					+ ")";
		} else if(name.equals("G_BADGE")) {
			sql = "CREATE TABLE G_BADGE (\n"
					+ "	b_grade NUMBER PRIMARY KEY,\n"
					+ "	g_name VARCHAR2(30) REFERENCES G_GAME(g_name),\n"
					+ "	b_score NUMBER NOT NULL,\n"
					+ "	b_path VARCHAR2(100) NOT NULL\n"
					+ ")";
		} else if(name.equals("G_PLAYLOG")) {
			sql = "CREATE TABLE G_PLAYLOG (\n"
					+ "	play_no NUMBER PRIMARY KEY,\n"
					+ "	m_no NUMBER REFERENCES G_MEMBER(m_no),\n"
					+ "	g_name VARCHAR2(30) REFERENCES G_GAME(g_name),\n"
					+ "	p_score NUMBER NOT NULL\n"
					+ ")";
		}
		System.out.println(sql);
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 게임 뷰 생성
	public void createView(String name) {
		String	sql = "";
		if(name.equals("NEWGAME")) {
			sql = "CREATE VIEW NEWGAME\n"
					+ "AS\n"
					+ "SELECT * FROM ( \n"
					+ "	SELECT ROWNUM num, s.* FROM (\n"
					+ "		SELECT * FROM G_GAME ORDER BY G_DATE DESC\n"
					+ "		) s\n"
					+ ")";
		} else if(name.equals("HOTGAME")) {
			sql = "CREATE VIEW HOTGAME\n"
					+ "AS\n"
					+ "SELECT * FROM (\n"
					+ "	SELECT ROWNUM num, s.* FROM (\n"
					+ "		SELECT * FROM G_GAME ORDER BY g_cnt DESC\n"
					+ "	) s\n"
					+ ")";
		}
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게임 추가
	public void insertGame(Game game) {
		
		String sql = "INSERT INTO G_GAME VALUES(?,SYSDATE,0,?,?)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, game.getG_name());
			prst.setString(2, game.getG_imgPath());
			prst.setString(3, game.getG_link());
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 전체 게임 읽기
	public ArrayList<Game> getGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		
		String sql = "SELECT * FROM G_GAME ORDER BY g_date DESC";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 페이지별 게임 읽기
	public ArrayList<Game> getGameList(int page, int cnt) {
		ArrayList<Game> list = new ArrayList<Game>();
		
		int start = 1 + (page-1)*cnt; // 1 4 7 10
		int end = page * cnt; // 3 6 9 12 15
		String sql="SELECT * FROM ( \r\n"
				+ "	SELECT ROWNUM num, s.* FROM (\r\n"
				+ "		SELECT * FROM G_GAME ORDER BY G_DATE DESC\r\n"
				+ "		) s\r\n"
				+ ")\r\n"
				+ "WHERE num BETWEEN ? AND ?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 인기게임 3개
	public ArrayList<Game> getHotGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		String sql = "SELECT rownum, g.* FROM (\n"
				+ "	SELECT p.g_name, count(*) cnt, g.G_IMGPATH, g.G_LINK \n"
				+ "	  FROM G_PLAYLOG p, G_GAME g\n"
				+ "	 WHERE p.G_NAME = g.G_NAME\n"
				+ "	GROUP BY p.g_name, g.G_IMGPATH, g.G_LINK \n"
				+ "	ORDER BY cnt DESC\n"
				+ ") g\n"
				+ "WHERE rownum IN(1,2,3)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				int g_cnt = rs.getInt("CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 신규게임 3개
	public ArrayList<Game> getNewGameList() {
		ArrayList<Game> list = new ArrayList<Game>();
		String sql = "SELECT * FROM ( \r\n"
				+ "	SELECT ROWNUM num, s.* FROM (\r\n"
				+ "		SELECT * FROM G_GAME ORDER BY G_DATE DESC\r\n"
				+ "		) s\r\n"
				+ ")\r\n"
				+ "WHERE NUM IN(1,2,3)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				
				String g_name = rs.getString("G_NAME");
				Date g_date = rs.getDate("G_DATE");
				int g_cnt = rs.getInt("G_CNT");
				String g_imgPath = rs.getString("G_IMGPATH");
				String g_link = rs.getString("G_LINK");
				Game game = new Game(g_name, g_date, g_cnt, g_imgPath, g_link);
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 게임 검색
	public ArrayList<Game> getSearchList() {
		return getSearchList("",1);
	}
	public ArrayList<Game> getSearchList(int page) {
		return getSearchList("",page);
	}
	public ArrayList<Game> getSearchList(String query, int page) {
		ArrayList<Game> list = new ArrayList<Game>();
		String sql = "SELECT * FROM (\n"
				+ "SELECT ROWNUM num, g.* FROM(\n"
				+ "	SELECT * FROM G_GAME WHERE G_NAME LIKE ? ORDER BY G_DATE DESC\n"
				+ ") g)\n"
				+ "WHERE NUM BETWEEN ? AND ?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, "%"+query+"%");
			prst.setInt(2, 1+(page-1)*5);
			prst.setInt(3, page * 5);
			
			rs = prst.executeQuery();
			while(rs.next()) {
				Game game = new Game(rs.getInt("num"),
									 rs.getString("g_name"),
									 rs.getDate("g_date"),
									 rs.getInt("g_cnt"),
									 rs.getString("g_imgpath"),
									 rs.getString("g_link"));
				list.add(game);
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}	
	
	// 게임 갯수
	public int getCount() {
		return getCount("");
	}

	public int getCount(String query) {
		String sql = "SELECT COUNT(g_name) count FROM ( "
					+ "	SELECT * FROM G_GAME WHERE G_NAME LIKE ? "
					+ ")";
		int cnt=0;
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, "%"+query+"%");
			rs = prst.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 게임삭제
	public void deleteGame(String name) {
		String sql = "DELETE FROM G_GAME WHERE g_name = ?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, name);
			prst.execute();
			
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 유저랭킹 top 5
	public ArrayList<Member> getRangking() {
		ArrayList<Member> list = new ArrayList<Member>();
		
		String sql = "SELECT rownum, n.*\n"
				+ "  FROM (\n"
				+ "	SELECT m.m_name,g.m_no, sum(p_score) score\n"
				+ "		 FROM G_PLAYLOG g, G_MEMBER m\n"
				+ "		WHERE g.M_NO = m.M_NO\n"
				+ "		GROUP BY g.m_no, m.m_name\n"
				+ "		ORDER BY score desc\n"
				+ ") n\n"
				+ "WHERE rownum BETWEEN 1 AND 5";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				list.add(new Member(rs.getString("m_name"),rs.getInt("score")));
			}
			
			rs.close();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return list;
	}
	
	// 게임 로그 추가
	public void addPlayLog(int no, String game, int point) {
		String sql = "INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
				
			try {
				setCon();
				prst = conn.prepareStatement(sql);
				prst.setInt(1, no);
				prst.setString(2, game);
				prst.setInt(3, point);
				prst.executeUpdate();
				
				prst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
	}
	
	public static void main(String[] args) {
		GameService service = new GameService();
		int cnt = service.getCount();
		System.out.println(cnt);
	}
}
