<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����Ʈ</title>
</head>
<body>
<%@ page import="java.util.ArrayList,theater.room.RoomEntity" %>
<h2>�ڹ� ���� MemberDatabase�� �̿��� ���̺� MEMBER ��ȸ</h2>
<jsp:useBean id="roomdb" class="theater.room.RoomDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<RoomEntity>list = roomdb.getRoomList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� ���� <%= counter  %> �� �Դϴ�.</p><hr>
<table>
<tr>
	<th><b>�� id</b></th>
	<th><b>�� �¼� ��ȣ</b></th>
	
</tr>
<%
	for(RoomEntity room : list){
%>
<tr>
	<td><%=room.getRoom_id() %><a href="editroom.jsp?id=<%=room.getRoom_id()%>">����</a></td>
	<td><%= room.getRoom_seat_num() %></td>
	
</tr>
</table>
<%
	}
	
}else{
%>
	<p>��ϵ� ���� �����ϴ�.</p>
<%
}
%>
<form name=form method=post action=editroom.jsp>
	<input type=submit value="�� ���">
</form>
	

</html>