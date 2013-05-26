package theater.room.seat;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SeatDatabase {
	// �����ͺ��̽� ���� ���� ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// ����� DBCP �����ͼҽ��� ã�� �����ϴ� ������
	public SeatDatabase(){
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
	public ArrayList<SeatEntity>getSeatList(){
		connect();
		// ���� ����� ������ ArrayList ����
		ArrayList<SeatEntity>list = new ArrayList<SeatEntity>();
		
		String SQL = "select * from THEATER_SEAT";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ MovieEntity ��ü�� ����
			while(rs.next()){
				// �� ȸ���� ������ ������ ���� ��ü ����
				SeatEntity seat = new SeatEntity();
				
				// �� ���� ȸ�� ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				
				seat.setSeat_num(rs.getInt("SEAT_BOOl"));
				seat.setSeat_bool(rs.getInt("SEAT_NUM"));
				// ArrayList�� ��ȭ ���� ��ü MovieEntity�� �߰�
				list.add(seat);
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
