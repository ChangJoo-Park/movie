package movie;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Test_JDBC_ORACLE {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		java.sql.Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		String url = null;
		String id = "hotsun0428";
		String pwd = "rudah0428";
/**
 * 경모형 cafe24 데이터베이스에 있는 oracle db의 MOVIE_TEST 테이블을 이용함
 * MOVIE_TEST
 * title 		: String
 * description 	: String
 * release_year : int
 * genre 		: String
 * rate 		: int
 * officialSite : String
 * photo 		: String
 */
		try {
			url = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB connection complete");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from MOVIE_TEST");
			
			while(rs.next()){
				String title = rs.getString(1);
				String description = rs.getString(2);
				int release_year  = rs.getInt(3);
				String genre = rs.getString(4);
				int rate = rs.getInt(5);
				String officialSite = rs.getString(6);
				String photo = rs.getString(7);
				
				System.out.println("영화명 : "+title);
				System.out.println("개봉시기 : "+release_year);
				System.out.println("장르 : " + genre);
				System.out.println("시놉시스 : " + description);
				System.out.println("평점 : "+ rate);
				System.out.println("공식홈페이지 : "+ officialSite);
				System.out.println("사진"+photo);
				System.out.println();
			}
			
			stmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
