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
String sql = "select * from theater_seat where seat_num like ?";
String seatname = "%" + request.getParameter("seatname") + "%";
int rowCount = 0 ;

try{
	Class.forName(driverName);
	conn = DriverManager.getConnection(dbURL,"hotsun0428","rudah0428");
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(seatname));
	ResultSet result = pstmt.executeQuery();
%>
<table>
<thead>
<tr>
	<th><b>�¼���ȣ</b></th>
	<th><b>�¼����ÿ���</b></th>
	

</tr>
</thead>
<tbody>
<%
	while(result.next()){
		rowCount++;
%>
<tr>
	<td><%=result.getInt(1) %></td>
	<td><%=result.getInt(2) %></td>
	
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