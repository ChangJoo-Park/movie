<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�¼� ���</title>
<script src="assets/scripts/seatform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.seat.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	int seat_num		=	0;
	int	seat_bool		=	0;
	
	String	headline = "���";

	seat_num= Integer.parseInt(request.getParameter("room_id"));
	
	if (seat_num != 0){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		int idnum = seat_num;
		SeatDatabase seatdb = new SeatDatabase();
		SeatEntity seat	= seatdb.getSeat(idnum);
		seat_bool = seat.getSeat_bool();	
		
		headline = "���� ����";	
	};
%>
<h2> �¼� <%= headline %> ���α׷� </h2>
<form name=roomform method=post action="processseat.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->

<table>
<tr>
<td>�¼���ȣ : <input type=text name=seat_num value="<%= seat_num %>"/></td>
<td>�¼����ÿ��� : <input type=text name=seat_bool value="<%= seat_bool %>"></td>


</tr>
</table>
<% if (seat_num == 0){ %>
	<input type="button" value="���" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="����" onClick="updatecheck()"><input type="button" value="����" onClick="deletecheck()">
<% } %>
<input type="button" value="���" onClick="location.href='listseats.jsp'">

</form>
</body>
</html>