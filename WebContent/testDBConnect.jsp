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

<h2>�����ͺ��̽� ����̹��� DB Movie_Test ���� ���� ���α׷�</h2>
<%
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String dbURL = "jdbc:oracle:thin:@oracle.hotsun0428.cafe24.com:1521:orcl";
	
	Class.forName(driverName);
	Connection conn = DriverManager.getConnection(dbURL,"hotsun0428","rudah0428");
	out.println("Oracle �����ͺ��̽��� �����Ͽ����ϴ�.");
	conn.close();
}catch(Exception e){
	out.println("�����ͺ��̽� ���ӿ� ������ �ֽ��ϴ�.");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>