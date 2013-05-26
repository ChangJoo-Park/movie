package theater.room.seat;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SeatDatabase {
	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// 등록한 DBCP 데이터소스를 찾아 저장하는 생성자
	public SeatDatabase(){
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
	public ArrayList<SeatEntity>getSeatList(){
		connect();
		// 질의 결과를 저장할 ArrayList 선언
		ArrayList<SeatEntity>list = new ArrayList<SeatEntity>();
		
		String SQL = "select * from THEATER_SEAT";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 MovieEntity 객체에 저장
			while(rs.next()){
				// 한 회원의 정보를 저장할 빈즈 객체 생성
				SeatEntity seat = new SeatEntity();
				
				// 한 행의 회원 정보를 자바빈즈 객체에 저장 get~ 안의 문자열은 칼럼명과 동일하게 해야한다.
				
				seat.setSeat_num(rs.getInt("SEAT_BOOl"));
				seat.setSeat_bool(rs.getInt("SEAT_NUM"));
				// ArrayList에 영화 정보 객체 MovieEntity를 추가
				list.add(seat);
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
	public SeatEntity getSeat(int id){
		connect();
		String SQL = "select * from THEATER_SEAT where seat_num = ?";
		SeatEntity room = new SeatEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			room.setSeat_num(rs.getInt("SEAT_NUM"));
			
			room.setSeat_bool(rs.getInt("SEAT_BOOL"));			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return room;
	}
	public boolean insertDB(SeatEntity seat){
		boolean success = false;
		System.out.println(seat.getSeat_num());
		connect();
		String SQL = "insert into THEATER_SEAT values(?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,seat.getSeat_num());
			pstmt.setInt(2,seat.getSeat_bool());
		
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
	public boolean updateDB(SeatEntity seat){
		boolean success = false;
		connect();
		String SQL = "update THEATER_SEAT SET SEAT_NUM=?,SEAT_BOOL=? where SEAT_NUM=?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,seat.getSeat_num());
			pstmt.setInt(2,seat.getSeat_bool());
			
			
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
		String SQL = "delete from THEATER_SEAT where SEAT_NUM = ?";
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
