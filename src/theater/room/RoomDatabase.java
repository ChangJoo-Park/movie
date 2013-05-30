package theater.room;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class RoomDatabase {
	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// 등록한 DBCP 데이터소스를 찾아 저장하는 생성자
	public RoomDatabase(){
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
	public ArrayList<RoomEntity>getRoomList(){
		connect();
		// 질의 결과를 저장할 ArrayList 선언
		ArrayList<RoomEntity>list = new ArrayList<RoomEntity>();
		
		String SQL = "select * from THEATER_ROOM";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 MovieEntity 객체에 저장
			while(rs.next()){
				// 한 회원의 정보를 저장할 빈즈 객체 생성
				RoomEntity room = new RoomEntity();
				
				// 한 행의 회원 정보를 자바빈즈 객체에 저장 get~ 안의 문자열은 칼럼명과 동일하게 해야한다.
				room.setRoom_id(rs.getString("ROOM_ID"));
				room.setRoom_seat_num(rs.getInt("ROOM_SEAT_NUM"));
				
				// ArrayList에 영화 정보 객체 MovieEntity를 추가
				list.add(room);
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
	public RoomEntity getRoom(String id){
		connect();
		String SQL = "select * from THEATER_ROOM where room_id = ?";
		RoomEntity room = new RoomEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			room.setRoom_id(rs.getString("ROOM_ID"));
			room.setRoom_seat_num(rs.getInt("ROOM_SEAT_NUM"));			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return room;
	}
	public boolean insertDB(RoomEntity room){
		boolean success = false;
		System.out.println(room.getRoom_id());
		connect();
		String SQL = "insert into THEATER_ROOM values(?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,room.getRoom_id());
			pstmt.setInt(2,room.getRoom_seat_num());
		
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
	public boolean updateDB(RoomEntity room){
		boolean success = false;
		connect();
		String SQL = "update THEATER_ROOM SET ROOM_ID=?,ROOM_SEAT_NUM=? where ROOM_ID=?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,room.getRoom_id());
			pstmt.setInt(2,room.getRoom_seat_num());
			pstmt.setString(3, room.getRoom_id());
			
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
	public boolean deleteDB(String id){
		boolean success = false;
		connect();
		String SQL = "delete from THEATER_ROOM where ROOM_ID = ?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,id);
			
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
