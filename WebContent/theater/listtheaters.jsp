<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ����Ʈ</title>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
<h2>�ڹ� ���� MovieDatabase�� �̿��� ���̺� MOVIE ��ȸ</h2>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<TheaterEntity>list = theaterdb.getTheaterList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� ������ <%= counter  %> �� �Դϴ�.</p><hr>
<table>
<tr>
	<th><b>��ġ</b></th>
	<th><b>�ּ�</b></th>
	<th><b>��</b></th>
	<th><b>�¼�</b></th>
	<th><b>�󿵽ð�</b></th>
	
</tr>
<%
	for(TheaterEntity theater : list){
%>
<tr>
	<td><%= theater.getLocation() %><a href="edittheater.jsp?id=<%=theater.getId()%>">����</a></td>
	<td><%= theater.getAddress() %></td>
	<td><%= theater.getRoom_num() %></td>
	<td><%= theater.getSeat() %></td>
	<td><%= theater.getTime_schedule() %></td>
		
</tr>
</table>
<%
	}
	
}else{
%>
	<p>��ϵ� ��ȭ�� �ϳ��� �����ϴ�.</p>
<%
}
%>
<form name=form method=post action=edittheater.jsp>
	<input type=submit value="��ȭ ���">
</form>
	

</html>