<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ���</title>
<script src="assets/scripts/theaterform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	location	=	"";
	String  address     =   "";
	String	room_num	=	"";
	String	seat	=	"";
	String	time_schedule	=	"";
	
	String	headline = "���";

	String theater_id= request.getParameter("id");
	
	if (theater_id != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		int idnum = Integer.parseInt(theater_id);
		TheaterDatabase theaterdb = new TheaterDatabase();
		TheaterEntity theater	= theaterdb.getTheater(idnum);
		
		location=theater.getLocation();
		address=theater.getAddress();
		room_num=theater.getRoom_num();
		seat=theater.getSeat();
		time_schedule=theater.getTime_schedule();
		
		headline = "���� ����";	
	};
%>
<h2> ���� <%= headline %> ���α׷� </h2>
<form name=theaterform method=post action="processthetaer.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->
<input type=hidden name="id" value="<%= theater_id %>">
<table>
<tr>
<td>��ġ : <input type=text name=location value="<%= location %>"></td>
<td>�ּ� : <input type=text name=address value="<%= address %>"/></td>
<td>�� : <input type=number name=room_num value="<%= room_num %>"></td>
<td>�¼� : <input type=text name=seat value="<%= seat %>"></td>
<td>�帣 : <input type=text name=time_schedule value="<%= time_schedule %>"></td>

</tr>
</table>
<% if (theater_id == null){ %>
	<input type="button" value="���" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="����" onClick="updatecheck()"><input type="button" value="����" onClick="deletecheck()">
<% } %>
<input type="button" value="���" onClick="location.href='listtheaters.jsp'">

</form>
</body>
</html>