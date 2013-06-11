<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>극장 등록</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<script src="assets/scripts/theaterform.js"></script>

</head>
<body>
<%@ page import="java.util.ArrayList, theater.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String	theater_name	=	"";
	String  address     =   "";
	
	String	headline = "등록";

	String theater_id= request.getParameter("theater_id");
	
	if (theater_id != null){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		int idnum = Integer.parseInt(theater_id);
		TheaterDatabase theaterdb = new TheaterDatabase();
		TheaterEntity theater = theaterdb.getTheater(idnum);
		theater_name = theater.getTheater_name();
		address=theater.getAddress();
		
		headline = "수정 삭제";	
	};
%>
<h2> 극장 <%= headline %> 프로그램 </h2>
<form name=theaterform method=post action="processtheater.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->
<input type=hidden name="id" value="<%= theater_id %>">
<table border="1">
<tr>
<td align="center">이름 : <input type=text name=theater_name value="<%= theater_name %>"></td>
<td align="center">주소 : <input type=text name=address value="<%= address %>"/></td>



</tr>
</table>
<% if (theater_id == null){ %>
	<input type="button" value="등록" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="수정" onClick="updatecheck()"><input type="button" value="삭제" onClick="deletecheck()">
<% } %>
<input type="button" value="목록" onClick="location.href='listtheaters.jsp'">

</form>
</body>
</html>