package gameflix.web.qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import gameflix.web.qna.A01_Dao;

public class A01_Dao {

	//공통 필드 선언
	private Connection con;
	// 2. 대화
	private Statement stmt;
	private PreparedStatement pstmt;
	// 3. 결과값 받는 객체
	private ResultSet rs;

	// # 연결 처리 기능 메서드
	public void setCon() throws SQLException {
	      // 1. driver 메모리 로딩
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	      // 2. 특정 서버
	      // - 접속 정보: 드라이버명:@ip:port:sid
	      String info = "jdbc:oracle:thin:@localhost:1521:xe";
	      //드라이버 매니저 객체를 통해서 Connection 객체를 생성
	      con = DriverManager.getConnection(info, "scott", "tiger");
	      System.out.println("접속 성공");
	   }	   

	public Board getBoard (int no){
		Board board=null;
		try {
			setCon();
			String sql = "SELECT * FROM g_article WHERE art_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				/*Board(int no, String cate, String title, String content, Date credte)*/
				board=new Board(rs.getInt("art_no"),
						rs.getString("art_cate"),rs.getString("art_title"),
						rs.getString("art_content"),rs.getDate("art_credte"));
			}
			rs.close();
			pstmt.close();
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return board;
	}
	
	public void updateBoard(Board board) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "UPDATE G_ARTICLE \r\n"
					+ "SET art_title=?,\r\n"
					+ "	art_content=?\r\n"
					+ "WHERE art_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			
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
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			System.out.println("일반에러");
		}
	}
	 public void deleteBoard (int no) {
         try {
         setCon();
         con.setAutoCommit(false);
         String sql="DELETE FROM g_article WHERE art_no=?";
         System.out.println(sql);
         
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1,no);
         pstmt.executeUpdate();
         con.commit();
         pstmt.close();
         con.close();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("입력 에러:"+e.getMessage());
         try {
            con.rollback();
         }catch(SQLException e1) {
            e1.printStackTrace();
         }
      }catch(Exception e) {
         System.out.println("일반 에러:"+e.getMessage());
      }
      }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	A01_Dao dao=new A01_Dao();
	dao.getBoard(1);
	System.out.println();
	
	}

}
