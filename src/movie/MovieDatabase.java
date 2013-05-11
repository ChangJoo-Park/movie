package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDatabase {
	// �����ͺ��̽� ���� ���� ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// ����� DBCP �����ͼҽ��� ã�� �����ϴ� ������
	public MovieDatabase(){
		try{
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	// ������ �ҽ��� ���� �����ͺ��̽� ����, Connection ��ü�� �����ϴ� �޼ҵ�
	public void connect(){
		try{
			con = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	// DB���� ���� �޼ҵ�
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
	// ��� ���ڵ带 ��ȯ�ϴ� �޼ҵ�
	public ArrayList<MovieEntity>getMovieList(){
		connect();
		// ���� ����� ������ ArrayList ����
		// ArrayList ���ο��� �л������� ������ MovieEntity�� ���Ե�.
		ArrayList<MovieEntity>list = new ArrayList<MovieEntity>();
		
		String SQL = "select * from MOVIE";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ MovieEntity ��ü�� ����
			while(rs.next()){
				// �� ��ȭ�� ������ ������ ���� ��ü ����
				MovieEntity movie = new MovieEntity();
				
				// �� ���� ��ȭ ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				movie.setId(rs.getInt("MOVIE_ID"));
				movie.setTitle(rs.getString("TITLE"));
				movie.setYear(rs.getInt("YEAR"));
				movie.setDescription(rs.getString("DESCRIPTION"));
				movie.setGenre(rs.getString("GENRE"));
				movie.setOfficialSite(rs.getString("OFFICIALSITE"));
				movie.setRate(rs.getInt("RATE"));
				movie.setPhoto(rs.getString("PHOTO"));
				movie.setPlay_time(rs.getInt("PLAY_TIME"));
				// ArrayList�� ��ȭ ���� ��ü MovieEntity�� �߰�
				list.add(movie);
			}
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		// �ϼ��� ArrayList ��ü�� ��ȯ
		return list;
	}
	public MovieEntity getMovie(int id){
		connect();
		String SQL = "select * from MOVIE where MOVIE_ID = ?";
		MovieEntity movie = new MovieEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			movie.setId(rs.getInt("MOVIE_ID"));
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
		String SQL = "insert into MOVIE values(MOVIE_ID.nextval,?,?,?,?,?,?,?,?)";
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
		String SQL = "update MOVIE SET (TITLE, YEAR, DESCRIPTION, GENRE, OFFICIALSITE, PHOTO, RATE, PLAY_TIME) = (?,?,?,?,?,?,?,?) WHERE MOVIE_ID=? ";
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
			pstmt.setInt(9, movie.getId());
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
	public boolean deleteDB(int id){
		boolean success = false;
		connect();
		String SQL = "delete from MOVIE where MOVIE_ID = ?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,id);
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
