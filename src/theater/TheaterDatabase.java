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
		// ArrayList ���ο��� �л������� ������ TheaterEntity�� ���Ե�.
		ArrayList<TheaterEntity>list = new ArrayList<TheaterEntity>();
		
		String SQL = "select * from THEATER";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ TheaterEntity ��ü�� ����
			while(rs.next()){
				// �� ��ȭ�� ������ ������ ���� ��ü ����
				TheaterEntity theater = new TheaterEntity();
				
				// �� ���� ��ȭ ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				
				theater.setTheater_id(rs.getInt("THEATER_ID"));
				theater.setTheater_name(rs.getString("THEATER_NAME"));
				theater.setAddress(rs.getString("ADDRESS"));
				// ArrayList�� ��ȭ ���� ��ü TheaterEntity�� �߰�
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
		// ��ȭ�� �̸��� ���ؼ� ���� ������ ���������� �ϴ���
		connect();
		// ��ȭ�� �̸����� ��ȭ�� ������ ���� �ϴ��� ��ü �� �������°ŷ�
		String SQL = "select * from THEATER where THEATER_NAME = ?";
		int theater_id = 0;
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,theater_name);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			// ��ȭ�� ���̵� ���� (�� �����)
			theater_id = rs.getInt("THEATER_ID");
			// ��ȭ���� ���̵� �̿��ؼ� ������ �ִ� ���� ������ �޾ƿ´�.
			SQL = "select ROOM_NUMBER from THEATER_ROOM where THEATER_ID = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, theater_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				// theater_id�� �ش��ϴ� ���� ������ �޾ƿ�
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
