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
<h2>Jakarta DBCP�� �̿��� DB ���� ���� ���α׷�</h2>
<% 
try{
	InitialContext ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
	Connection con = ds.getConnection();
	
	out.println("DB���� ����");
	con.close();
%>
<%
}catch(Exception e){
	out.println("����Ŭ �����ͺ��̽� ���ӿ� ������ �ֽ��ϴ�.<br>");
	out.println(e.getMessage());
	e.printStackTrace();
}	
finally{
}
%>
</body>
</html>