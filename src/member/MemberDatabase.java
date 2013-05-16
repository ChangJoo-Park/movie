package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDatabase {
	// �����ͺ��̽� ���� ���� ���� ����
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// ����� DBCP �����ͼҽ��� ã�� �����ϴ� ������
	public MemberDatabase(){
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
	public ArrayList<MemberEntity>getMemberList(){
		connect();
		// ���� ����� ������ ArrayList ����
		ArrayList<MemberEntity>list = new ArrayList<MemberEntity>();
		
		String SQL = "select * from MOVIE_MEMBER";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet�� ������� ��� ���� ������ MovieEntity ��ü�� ����
			while(rs.next()){
				// �� ȸ���� ������ ������ ���� ��ü ����
				MemberEntity member = new MemberEntity();
				
				// �� ���� ȸ�� ������ �ڹٺ��� ��ü�� ���� get~ ���� ���ڿ��� Į����� �����ϰ� �ؾ��Ѵ�.
				member.setId(rs.getString("ID"));
				member.setPw(rs.getString("PASSWORD"));
				member.setMail(rs.getString("MAIL"));
				member.setName(rs.getString("NAME"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setFa_theater(rs.getString("FAVORITE_THEATER"));
				// ArrayList�� ��ȭ ���� ��ü MovieEntity�� �߰�
				list.add(member);
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
	public MemberEntity getMember(String id){
		connect();
		String SQL = "select * from MOVIE where MOVIE_ID = ?";
		MemberEntity member = new MemberEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			member.setId(rs.getString("ID"));
			member.setPw(rs.getString("PASSWORD"));
			member.setMail(rs.getString("MAIL"));
			member.setName(rs.getString("NAME"));
			member.setAddress(rs.getString("ADDRESS"));
			member.setFa_theater(rs.getString("FAVORITE_THEATER"));
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disconnect();
		}
		return member;
	}
	public boolean insertDB(MemberEntity member){
		boolean success = false;
		connect();
		String SQL = "insert into Movie_member values(MOVIE_ID.nextval,?,?,?,?,?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3,member.getMail());
			pstmt.setString(4,member.getName());
			pstmt.setString(5,member.getAddress());
			pstmt.setString(6,member.getFa_theater());
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
	public boolean updateDB(MemberEntity member){
		boolean success = false;
		connect();
		String SQL = "update MOVIE_MEMBER SET PASSWORD=?,MAIL=?,NAME=?,ADDRESS=?,FAVORITE_THEATER=? where ID=?";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,member.getPw());
			pstmt.setString(2,member.getMail());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getAddress());
			pstmt.setString(5,member.getFa_theater());
			pstmt.setString(6,member.getId());
			
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
		String SQL = "delete from MOVIE_MEMBER where ID = ?";
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
