<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
<script src="assets/scripts/roomform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	room_id		=	"";
	int	room_seat_num	=	0;
	
	String	headline = "���";

	room_id= request.getParameter("room_id");
	
	if (room_id != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		String idnum = room_id;
		RoomDatabase roomdb = new RoomDatabase();
		RoomEntity room	= roomdb.getRoom(idnum);
		room_seat_num = room.getRoom_seat_num();		
		
		headline = "���� ����";	
	};
%>
<h2> ȸ�� <%= headline %> ���α׷� </h2>
<form name=memberform method=post action="processroom.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->

<table>
<tr>
<td>�� id : <input type=text name=room_id value="<%= room_id %>"/></td>
<td>�� �¼� ��ȣ : <input type=text name=room_seat_num value="<%= room_seat_num %>"></td>


</tr>
</table>
<% if (room_id == null){ %>
	<input type="button" value="���" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="����" onClick="updatecheck()"><input type="button" value="����" onClick="deletecheck()">
<% } %>
<input type="button" value="���" onClick="location.href='listrooms.jsp'">

</form>
</body>
</html>