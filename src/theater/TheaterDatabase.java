package theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TheaterDatabase {
	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// 등록한 DBCP 데이터소스를 찾아 저장하는 생성자
	public TheaterDatabase(){
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
	public ArrayList<TheaterEntity>getTheaterList(){
		connect();
		// 질의 결과를 저장할 ArrayList 선언
		// ArrayList 내부에는 학생정보를 저장한 TheaterEntity가 삽입됨.
		ArrayList<TheaterEntity>list = new ArrayList<TheaterEntity>();
		
		String SQL = "select * from THEATER";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 TheaterEntity 객체에 저장
			while(rs.next()){
				// 한 영화의 정보를 저장할 빈즈 객체 생성
				TheaterEntity theater = new TheaterEntity();
				
				// 한 행의 영화 정보를 자바빈즈 객체에 저장 get~ 안의 문자열은 칼럼명과 동일하게 해야한다.
				
				theater.setTheater_id(rs.getInt("THEATER_ID"));
				theater.setTheater_name(rs.getString("THEATER_NAME"));
				theater.setAddress(rs.getString("ADDRESS"));
				// ArrayList에 영화 정보 객체 TheaterEntity를 추가
				list.add(theater);
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
	public TheaterEntity getTheater(int id){
		connect();
		String SQL = "select * from THEATER where THEATER_ID = ?";
		TheaterEntity theater = new TheaterEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			theater.setTheater_id(rs.getInt("THEATER_ID"));
			theater.setTheater_name(rs.getString("THEATER_NAME"));
			theater.setAddress(rs.getString("ADDRESS"));
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return theater;
	}
	public boolean insertDB(TheaterEntity theater){
		boolean success = false;
		connect();
		String SQL = "insert into THEATER values(THEATER_ID.nextval,?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
	
			pstmt.setInt(1, theater.getTheater_id());
			pstmt.setString(2, theater.getTheater_name());
			pstmt.setString(3, theater.getAddress());
			
			
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
	public boolean updateDB(TheaterEntity theater){
		boolean success = false;
		connect();
		String SQL = "update THEATER SET THEATER_NAME=?,ADDRESS=? where THEATER_ID=?";
		try{
			pstmt = con.prepareStatement(SQL);
			
			pstmt.setInt(1, theater.getTheater_id());
			pstmt.setString(2, theater.getTheater_name());
			pstmt.setString(3, theater.getAddress());
			
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
		String SQL = "delete from THEATER where THEATER_ID = ?";
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
	public ArrayList<Integer> getTheaterRoomDB(String theater_name){
		ArrayList<Integer>list = new ArrayList<Integer>();
		// 영화관 이름을 통해서 관의 정보를 가져오려고 하는중
		connect();
		// 영화관 이름으로 영화관 정보를 얻어옴 일단은 전체 다 가져오는거로
		String SQL = "select * from THEATER where THEATER_NAME = ?";
		int theater_id = 0;
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,theater_name);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			// 영화관 아이디를 받음 (잘 실행됨)
			theater_id = rs.getInt("THEATER_ID");
			// 영화관의 아이디를 이용해서 가지고 있는 관의 내용을 받아온다.
			SQL = "select ROOM_NUMBER from THEATER_ROOM where THEATER_ID = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, theater_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				// theater_id에 해당하는 관의 개수를 받아옴
				int room  = 0;
				room = rs.getInt("ROOM_NUMBER");
				list.add(room);
			}
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return list;
	}
}
