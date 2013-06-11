<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ���� ����Ʈ</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<link rel="stylesheet" href="../assets/css/custom.css">

</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
<h2>��ȭ�� ���</h2>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<TheaterEntity>list = theaterdb.getTheaterList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� ������ <%= counter  %> �� �Դϴ�.</p><hr>
<table border=1>
<tr>
	<th><b>�̸�</b></th>
	<th><b>�ּ�</b></th>
	
</tr>
<%
	for(TheaterEntity theater : list){
%>
<tr>
	<td align=center><%= theater.getTheater_name()%><a href="edittheater.jsp?id=<%=theater.getTheater_id()%>">����</a></td>
	<td align=center><%= theater.getAddress()%></td>
</tr>

<%
	}
%>
	</table>
	<%
}else{
%>
	<p>��ϵ� ������ �ϳ��� �����ϴ�.</p>
<%
}
%>
<form name=form method=post action=edittheater.jsp>
	<input type=submit value="���� ���">
</form>
	

</html>