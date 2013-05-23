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
		java.sql.Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		String url = null;
		String id = "hotsun0428";
		String pwd = "rudah0428";
/**
 * ����� cafe24 �����ͺ��̽��� �ִ� oracle db�� MOVIE_TEST ���̺��� �̿���
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
			rs = stmt.executeQuery("insert into MOVIE(MOVIE_ID,TITLE,YEAR,DESCRIPTION,GENRE,OFFICIALSITE,PHOTO,RATE,PLAY_TIME) values(MOVIE_ID.nextval,'���̾��3',2013,'d��','�׼�','�ּ�','����',3,123)");

			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
