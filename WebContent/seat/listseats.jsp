<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석 리스트</title>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.seat.SeatEntity" %>
<h2>자바 빈즈 SeatDatabase를 이용한 테이블 SEAT 조회</h2>
<jsp:useBean id="seatdb" class="theater.room.seat.SeatDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<SeatEntity>list = seatdb.getSeatList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 좌석은 <%= counter  %> 개 입니다.</p><hr>
<table>
<tr>
	<th><b>좌석번호</b></th>
	<th><b>좌석선택여부</b></th>
	
</tr>
<%
	for(SeatEntity seat : list){
%>
<tr>
	<td><%= seat.getSeat_num()%><a href="editseat.jsp?id=<%=seat.getSeat_num()%>">수정</a></td>
	<td><%= seat.getSeat_bool() %></td>
	
</tr>
</table>
<%
	}
	
}else{
%>
	<p>등록된 좌석이 없습니다.</p>
<%
}
%>
<form name=form method=post action=editseat.jsp>
	<input type=submit value="좌석 등록">
</form>
	

</html>