package theater.room;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class RoomDatabase {
	// �����ͺ��̽� ���� ���� ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// ����� DBCP �����ͼҽ��� ã�� �����ϴ� ������
	public RoomDatabase(){
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
	public ArrayList<RoomEntity>getRoomList(){
		connect();
		// ���� ����� ������ ArrayList ����
		ArrayList<RoomEntity>list = new ArrayList<RoomEntity>();
		
		String SQL = "select * from THEATER_ROOM";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ MovieEntity ��ü�� ����
			while(rs.next()){
				// �� ȸ���� ������ ������ ���� ��ü ����
				RoomEntity room = new RoomEntity();
				
				// �� ���� ȸ�� ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				room.setRoom_id(rs.getString("ROOM_ID"));
				room.setRoom_seat_num(rs.getInt("ROOM_SEAT_NUM"));
				
				// ArrayList�� ��ȭ ���� ��ü MovieEntity�� �߰�
				list.add(room);
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
