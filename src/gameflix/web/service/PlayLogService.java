package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gameflix.web.entity.PlayLog;

public class PlayLogService {
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
	
	public void insertPlayLog(PlayLog pl) {
		String sql ="INSERT INTO G_PLAYLOG VALUES(g_playlog_no_seq.nextval,?,?,?)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, pl.getM_no());
			prst.setString(2, pl.getG_name());
			prst.setInt(3, pl.getP_score());
			System.out.println(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
