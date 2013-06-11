<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 극장 리스트</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<link rel="stylesheet" href="../assets/css/custom.css">

</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
<h2>영화관 목록</h2>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<TheaterEntity>list = theaterdb.getTheaterList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 극장은 <%= counter  %> 개 입니다.</p><hr>
<table border=1>
<tr>
	<th><b>이름</b></th>
	<th><b>주소</b></th>
	
</tr>
<%
	for(TheaterEntity theater : list){
%>
<tr>
	<td align=center><%= theater.getTheater_name()%><a href="edittheater.jsp?id=<%=theater.getTheater_id()%>">수정</a></td>
	<td align=center><%= theater.getAddress()%></td>
</tr>

<%
	}
%>
	</table>
	<%
}else{
%>
	<p>등록된 극장이 하나도 없습니다.</p>
<%
}
%>
<form name=form method=post action=edittheater.jsp>
	<input type=submit value="극장 등록">
</form>
	

</html>