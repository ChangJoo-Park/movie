<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>

<h2>데이터베이스 드라이버와 DB Movie_Test 연결 점검 프로그램</h2>
<%
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";
	
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL,"hotsun0428","rudah0428");
	out.println("Oracle 데이터베이스에 접속하였습니다.");
	conn.close();
}catch(Exception e){
	out.println("데이터베이스 접속에 문제가 있습니다.");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>