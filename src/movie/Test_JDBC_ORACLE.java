package movie;
/**
 * title 		: String
 * year 		: int
 * description 	: String
 * genre 		: String
 * officialSite : String
 * photo 		: String
 * rate 		: int
 * play_time	: int
 */
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
			rs = stmt.executeQuery("select * from MOVIE");
			rs = stmt.executeQuery("insert into MOVIE(MOVIE_ID,TITLE,YEAR,DESCRIPTION,GENRE,OFFICIALSITE,PHOTO,RATE,PLAY_TIME) values(MOVIE_ID.nextval,'아이언맨3',2013,'d용','액션','주소','사진',3,123)");

			stmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
