<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�¼� ����Ʈ</title>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.seat.SeatEntity" %>
<h2>�ڹ� ���� SeatDatabase�� �̿��� ���̺� SEAT ��ȸ</h2>
<jsp:useBean id="seatdb" class="theater.room.seat.SeatDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<SeatEntity>list = seatdb.getSeatList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� �¼��� <%= counter  %> �� �Դϴ�.</p><hr>
<table>
<tr>
	<th><b>�¼���ȣ</b></th>
	<th><b>�¼����ÿ���</b></th>
	
</tr>
<%
	for(SeatEntity seat : list){
%>
<tr>
	<td><%= seat.getSeat_num()%><a href="editseat.jsp?id=<%=seat.getSeat_num()%>">����</a></td>
	<td><%= seat.getSeat_bool() %></td>
	
</tr>
</table>
<%
	}
	
}else{
%>
	<p>��ϵ� �¼��� �����ϴ�.</p>
<%
}
%>
<form name=form method=post action=editseat.jsp>
	<input type=submit value="�¼� ���">
</form>
	

</html>