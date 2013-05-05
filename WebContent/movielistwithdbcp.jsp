<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<h2>Jakarta DBCP를 이용한 DB 연결 점검 프로그램</h2>
<% 
try{
	InitialContext ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
	Connection con = ds.getConnection();
	
	out.println("DB접속 성공");
	con.close();
%>
<%
}catch(Exception e){
	out.println("오라클 데이터베이스 접속에 문제가 있습니다.<br>");
	out.println(e.getMessage());
	e.printStackTrace();
}	
finally{
}
%>
</body>
</html>