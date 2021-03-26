package gameflix.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import gameflix.web.entity.Article;
import gameflix.web.entity.Game;
import gameflix.web.qna.Board;

public class ArticleService {
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
	
	// 게시글 작성
	public void insertArticle(Article art) {
		String sql ="INSERT INTO g_article values(g_article_no_seq.nextval, LOWER(?), ?, ?, sysdate)";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, art.getCate());
			prst.setString(2, art.getTitle());
			prst.setString(3, art.getContent());
			System.out.println(sql);
			prst.execute();

			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 게시글 수정
	public void updateArticle(Article art) {
		try {
			setCon();
			conn.setAutoCommit(false);
			String sql = "UPDATE G_ARTICLE \r\n"
					+ "SET art_title=?,\r\n"
					+ "	art_content=?\r\n"
					+ "WHERE art_no=?";
			prst = conn.prepareStatement(sql);
			prst.setString(1, art.getTitle());
			prst.setString(2, art.getContent());
			prst.setInt(3, art.getNo());
			prst.executeUpdate();
			conn.commit();
			
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("일반에러");
		}
	}
	
	// 게시글 삭제
	public void deleteArticle(int no) {
		try {
			setCon();
			conn.setAutoCommit(false);
			String sql = "DELETE FROM G_ARTICLE WHERE ART_NO = ?";
			prst = conn.prepareStatement(sql);
			prst.setInt(1, no);
			prst.executeUpdate();
			conn.commit();
			prst.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("일반에러");
		}
	}
	
	// 분류별 게시글 조회
	public ArrayList<Article> getArticle(String cate){
		ArrayList<Article> list = new ArrayList<Article>();
		try {
			setCon();
			String sql = "SELECT * FROM g_article WHERE art_cate=? ORDER BY art_credte DESC";
			prst = conn.prepareStatement(sql);
			prst.setString(1, cate);
			rs = prst.executeQuery();
			while(rs.next()) {
				Article art = new Article(rs.getInt("art_no"), rs.getString("art_cate"),
						rs.getString("art_title"), rs.getString("art_content"), rs.getDate("art_credte"));
				list.add(art);
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
	
	// 특정 게시글 조회
	public Article getAricle (int no){
		Article art=null;
		try {
			setCon();
			String sql = "SELECT * FROM g_article WHERE art_no=?";
			prst = conn.prepareStatement(sql);
			prst.setInt(1, no);
			rs = prst.executeQuery();
			if(rs.next()) {
			//  Article(int no, String cate, String title, String content, Date credte)
				art=new Article(rs.getInt("art_no"),
						rs.getString("art_cate"),rs.getString("art_title"),
						rs.getString("art_content"),rs.getDate("art_credte"));
			}
			rs.close();
			prst.close();
			conn.close();  
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return art;
	}
	
	// 게시글 페이지별 조회
	public ArrayList<Article> getArticlePage(String cate, int pageNum){
		ArrayList<Article> list = new ArrayList<Article>();
		String sql="SELECT *\r\n"
				+ "FROM (SELECT ROW_NUMBER() over(ORDER BY art_credte desc) AS rnum,\r\n"
				+ "		ga.*\r\n"
				+ "		FROM G_ARTICLE ga\r\n"
				+ "		WHERE art_cate=?)\r\n"
				+ "WHERE rnum BETWEEN ? AND ?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, cate);
			prst.setInt(2, pageNum*10-9);
			prst.setInt(3, pageNum*10);
			rs = prst.executeQuery();
			
			while(rs.next()) {
				Article art = new Article(rs.getInt("art_no"), rs.getString("art_cate"),
						rs.getString("art_title"), rs.getString("art_content"), rs.getDate("art_credte"));
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}
	
	// 게시글 분류별 전체 페이지 수
	public int getPageCnt(String cate) {
		String sql="SELECT count(*)\r\n"
				+ "FROM G_ARTICLE\r\n"
				+ "WHERE art_cate=?";
		try {
			setCon();
			prst = conn.prepareStatement(sql);
			prst.setString(1, cate);
			rs = prst.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	//	ArticleService as = new ArticleService();
	//	System.out.println(as.getArticle("notice").size());
	//	System.out.println(as.getNoticePage(1).size());
	}
}
