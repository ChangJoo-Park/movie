package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDatabase {
	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// 등록한 DBCP 데이터소스를 찾아 저장하는 생성자
	public MovieDatabase(){
		try{
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	// 데이터 소스를 통해 데이터베이스 연결, Connection 객체에 저장하는 메소드
	public void connect(){
		try{
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	// DB연결 해제 메소드
	public void disconnect(){
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	// 모든 레코드를 반환하는 메소드
	public ArrayList<MovieEntity>getMovieList(){
		connect();
		// 질의 결과를 저장할 ArrayList 선언
		// ArrayList 내부에는 학생정보를 저장한 MovieEntity가 삽입됨.
		ArrayList<MovieEntity>list = new ArrayList<MovieEntity>();
		
		String SQL = "select * from MOVIE";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 MovieEntity 객체에 저장
			while(rs.next()){
				// 한 영화의 정보를 저장할 빈즈 객체 생성
				MovieEntity movie = new MovieEntity();
				
				// 한 행의 영화 정보를 자바빈즈 객체에 저장 get~ 안의 문자열은 칼럼명과 동일하게 해야한다.
				movie.setTitle(rs.getString("TITLE"));
				movie.setYear(rs.getInt("YEAR"));
				movie.setDescription(rs.getString("DESCRIPTION"));
				movie.setGenre(rs.getString("GENRE"));
				movie.setOfficialSite(rs.getString("OFFICIALSITE"));
				movie.setRate(rs.getInt("RATE"));
				movie.setPhoto(rs.getString("PHOTO"));
				movie.setPlay_time(rs.getInt("PLAY_TIME"));
				// ArrayList에 영화 정보 객체 MovieEntity를 추가
				list.add(movie);
			}
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		// 완성된 ArrayList 객체를 반환
		return list;
	}
	public MovieEntity getMovie(String title){
		connect();
		String SQL = "select * from MOVIE where TITLE = ?";
		MovieEntity movie = new MovieEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, title);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			movie.setTitle(rs.getString("TITLE"));
			movie.setYear(rs.getInt("YEAR"));
			movie.setDescription(rs.getString("DESCRIPTION"));
			movie.setGenre(rs.getString("GENRE"));
			movie.setOfficialSite(rs.getString("OFFICIALSITE"));
			movie.setRate(rs.getInt("RATE"));
			movie.setPhoto(rs.getString("PHOTO"));
			movie.setPlay_time(rs.getInt("PLAY_TIME"));
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return movie;
	}
	public boolean insertDB(MovieEntity movie){
		boolean success = false;
		connect();
		String SQL = "insert into MOVIE values(?,?,?,?,?,?,?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,movie.getTitle());
			pstmt.setInt(2, movie.getYear());
			pstmt.setString(3,movie.getDescription());
			pstmt.setString(4,movie.getGenre());
			pstmt.setString(5,movie.getOfficialSite());
			pstmt.setString(6,movie.getPhoto());
			pstmt.setInt(7, movie.getRate());
			pstmt.setInt(8, movie.getPlay_time());
			pstmt.executeUpdate();
			success = true;
		}catch(Exception e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}
		return success;
	}
	public boolean updateDB(MovieEntity movie){
		boolean success = false;
		connect();
		String SQL = "update MOVIE set TITLE=?, DESCRIPTION=?,GENRE=?, RELEASE_YEAR=?, RATE=?, OFFICIALSITE=?, PHOTO=? where TITLE=? ";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,movie.getTitle());
			pstmt.setInt(2, movie.getYear());
			pstmt.setString(3,movie.getDescription());
			pstmt.setString(4,movie.getGenre());
			pstmt.setString(5,movie.getOfficialSite());
			pstmt.setString(6,movie.getPhoto());
			pstmt.setInt(7, movie.getRate());
			pstmt.setInt(8, movie.getPlay_time());
			int rowUdt = pstmt.executeUpdate(); 
			if(rowUdt == 1 ) success = true;
		}catch(Exception e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}
		return success;
	}
	public boolean deleteDB(String title){
		boolean success = false;
		connect();
		String SQL = "delete from MOVIE where TITLE = ?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,title);
			pstmt.executeUpdate();
			success = true;
		}catch(Exception e){
			e.printStackTrace();
			return success;
		}finally{
			disconnect();
		}
		return success;
	}
}
