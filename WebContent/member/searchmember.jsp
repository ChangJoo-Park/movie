<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>search member</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% 
Connection conn = null;
PreparedStatement pstmt = null;
String driverName = "oracle.jdbc.driver.OracleDriver";
String dbURL = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";
String sql = "select * from movie_member where name like ?";
String membername = "%" + request.getParameter("membername") + "%";
int rowCount = 0 ;

try{
	Class.forName(driverName);
	conn = DriverManager.getConnection(dbURL,"hotsun0428","rudah0428");
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,membername);
	ResultSet result = pstmt.executeQuery();
%>
<table>
<thead>
<tr>
	<th><b>id</b></th>
	<th><b>password</b></th>
	<th><b>mail</b></th>
	<th><b>name</b></th>
	<th><b>address</b></th>
	<th><b>favorite_theater</b></th>
</tr>
</thead>
<tbody>
<%
	while(result.next()){
		rowCount++;
%>
<tr>
	<td><%=result.getString(1) %></td>
	<td><%=result.getString(2) %></td>
	<td><%=result.getString(3) %></td>
	<td><%=result.getString(4) %></td>
	<td><%=result.getString(5) %></td>
	<td><%=result.getString(6) %></td>
</tr>
</tbody>
<%
	}
if(rowCount == 0)
{
	out.println("��ȸ�� ����� �����ϴ�.");
}
else
{
	out.println("��ȸ�� �����"+rowCount+"�� �Դϴ�.");
}
	result.close();
}catch(Exception e){
	out.println("�����ͺ��̽� ���ӿ� ������ �ֽ��ϴ�.");
	out.println(e.toString());
	e.printStackTrace();
}
finally{
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>
</table>
</body>
</html>