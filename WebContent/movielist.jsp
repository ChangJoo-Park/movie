<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% 
Connection conn = null;
Statement stmt = null;
String driverName = "oracle.jdbc.driver.OracleDriver";
String dbURL = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";

try{
	Class.forName(driverName);
	conn = DriverManager.getConnection(dbURL,"hotsun0428","rudah0428");
	stmt = conn.createStatement();
	ResultSet result = stmt.executeQuery("select * from MOVIE_TEST"); 
%>
<table class="table table-hover">
<thead>
<tr>
	<th><b>영화제목</b></th>
	<th><b>시놉시스</b></th>
	<th><b>개봉년도</b></th>
	<th><b>장르</b></th>
	<th><b>평점</b></th>
	<th><b>공식홈페이지</b></th>
	<th><b>사진</b></th>
</tr>
</thead>
<%
	while(result.next()){
%>
<tbody>
<tr>
	<td><%=result.getString(1) %></td>
	<td><%=result.getString(2) %></td>
	<td><%=result.getInt(3) %></td>
	<td><%=result.getString(4) %></td>
	<td><%=result.getInt(5) %></td>
	<td><%=result.getString(6) %></td>
	<td><%=result.getString(7) %></td>
</tr>
</tbody>
<%
	}
	result.close();
}catch(Exception e){
	out.println("데이터베이스 접속에 문제가 있습니다.");
	out.println(e.toString());
	e.printStackTrace();
}
finally{
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
}
%>
</table>
</body>
</html>