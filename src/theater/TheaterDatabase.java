package theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TheaterDatabase {
	// �����ͺ��̽� ���� ���� ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// ����� DBCP �����ͼҽ��� ã�� �����ϴ� ������
	public TheaterDatabase(){
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
	public ArrayList<TheaterEntity>getTheaterList(){
		connect();
		// ���� ����� ������ ArrayList ����
		// ArrayList ���ο��� �л������� ������ MovieEntity�� ���Ե�.
		ArrayList<TheaterEntity>list = new ArrayList<TheaterEntity>();
		
		String SQL = "select * from THEATER";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ MovieEntity ��ü�� ����
			while(rs.next()){
				// �� ��ȭ�� ������ ������ ���� ��ü ����
				TheaterEntity theater = new TheaterEntity();
				
				// �� ���� ��ȭ ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				
				theater.setLocation(rs.getString("LOCATION"));
				theater.setAddress(rs.getString("ADDRESS"));
				theater.setRoom_num(rs.getString("ROOM_NUM"));
				theater.setSeat(rs.getString("SEAT"));
				theater.setTime_schedule(rs.getString("TIME_SCHEDULE"));
			
				// ArrayList�� ��ȭ ���� ��ü MovieEntity�� �߰�
				list.add(theater);
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
	public TheaterEntity getTheater(int id){
		connect();
		String SQL = "select * from THEATER where THEATER_ID = ?";
		TheaterEntity theater = new TheaterEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			theater.setId(rs.getInt("THEATER_ID"));
			theater.setLocation(rs.getString("LOCATION"));
			theater.setAddress(rs.getString("ADDRESS"));
			theater.setRoom_num(rs.getString("ROOM_NUM"));
			theater.setSeat(rs.getString("SEAT"));
			theater.setTime_schedule(rs.getString("TIME_SCHEDULE"));
			
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
		String SQL = "insert into THEATER values(THEATER_ID.nextval,?,?,?,?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,theater.getAddress());
			pstmt.setString(2, theater.getLocation());
			pstmt.setString(3,theater.getRoom_num());
			pstmt.setString(4,theater.getSeat());
			pstmt.setString(5,theater.getTime_schedule());
			
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
		String SQL = "update THEATER SET LOCATION=?,ADDRESS=?,ROOM_NUM=?,SEAT=?,TIME_SCHEDULE=? where THEATER_ID=?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,theater.getLocation());
			pstmt.setString(2, theater.getAddress());
			pstmt.setString(3,theater.getRoom_num());
			pstmt.setString(4,theater.getSeat());
			pstmt.setString(5,theater.getTime_schedule());
			pstmt.setInt(6,theater.getId());
			
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
}
