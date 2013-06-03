<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���</title>
<script src="assets/scripts/theaterform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	theater_name	=	"";
	String  address     =   "";
	
	String	headline = "���";

	String theater_id= request.getParameter("theater_id");
	
	if (theater_id != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		int idnum = Integer.parseInt(theater_id);
		TheaterDatabase theaterdb = new TheaterDatabase();
		TheaterEntity theater = theaterdb.getTheater(idnum);
		theater_name = theater.getTheater_name();
		address=theater.getAddress();
		
		headline = "���� ����";	
	};
%>
<h2> ���� <%= headline %> ���α׷� </h2>
<form name=theaterform method=post action="processtheater.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->
<input type=hidden name="id" value="<%= theater_id %>">
<table border="1">
<tr>
<td align="center">�̸� : <input type=text name=theater_name value="<%= theater_name %>"></td>
<td align="center">�ּ� : <input type=text name=address value="<%= address %>"/></td>



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