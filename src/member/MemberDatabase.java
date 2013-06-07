package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDatabase {
	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	// 등록한 DBCP 데이터소스를 찾아 저장하는 생성자
	public MemberDatabase(){
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
	public ArrayList<MemberEntity>getMemberList(){
		connect();
		// 질의 결과를 저장할 ArrayList 선언
		ArrayList<MemberEntity>list = new ArrayList<MemberEntity>();
		
		String SQL = "select * from MOVIE_MEMBER";
		try{
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet의 결과에서 모든 행을 각각의 MovieEntity 객체에 저장
			while(rs.next()){
				// 한 회원의 정보를 저장할 빈즈 객체 생성
				MemberEntity member = new MemberEntity();
				
				// 한 행의 회원 정보를 자바빈즈 객체에 저장 get~ 안의 문자열은 칼럼명과 동일하게 해야한다.
				member.setId(rs.getString("ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setMail(rs.getString("MAIL"));
				member.setName(rs.getString("NAME"));
				member.setAddress(rs.getString("ADDRESS"));
				member.setFavorite_theater(rs.getString("FAVORITE_THEATER"));
				// ArrayList에 영화 정보 객체 MovieEntity를 추가
				list.add(member);
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
	public MemberEntity getMember(String id){
		connect();
		String SQL = "select * from MOVIE_MEMBER where id = ?";
		MemberEntity member = new MemberEntity();
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			member.setId(rs.getString("ID"));
			member.setPassword(rs.getString("PASSWORD"));
			member.setMail(rs.getString("MAIL"));
			member.setName(rs.getString("NAME"));
			member.setAddress(rs.getString("ADDRESS"));
			member.setFavorite_theater(rs.getString("FAVORITE_THEATER"));
			
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
		System.out.println(member.getId());
		connect();
		String SQL = "insert into Movie_member values(?,?,?,?,?,?)";
		try{
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getPassword());
			pstmt.setString(3,member.getMail());
			pstmt.setString(4,member.getName());
			pstmt.setString(5,member.getAddress());
			pstmt.setString(6,member.getFavorite_theater());
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
			pstmt.setString(1,member.getPassword());
			pstmt.setString(2,member.getMail());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getAddress());
			pstmt.setString(5,member.getFavorite_theater());
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
