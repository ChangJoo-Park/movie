<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	title = title.toUpperCase();
	List<String> list = new ArrayList<String>();
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url,"hotsun0428","rudah0428");
		String sql = "select * from MOVIE where title LIKE ?";
		
		ps = con.prepareStatement(sql);
		ps.setString(1,title+"%");
		
		rs = ps.executeQuery();
		
		while(rs.next()){
			list.add(rs.getString("title"));				
		}
		rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{
				rs.close();
			}catch(Exception e){}
		}
		if(ps != null){
			try{
				ps.close();
			}catch(Exception e){}
		}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){}
		}
	}
	for(int i = 0 ; i<list.size(); i++){
		out.println(list.get(i)+", ");
	}
%>
