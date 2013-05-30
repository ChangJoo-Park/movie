<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 리스트</title>
</head>
<body>
<%@ page import="java.util.ArrayList,theater.room.RoomEntity" %>
<h2>자바 빈즈 MemberDatabase를 이용한 테이블 MEMBER 조회</h2>
<jsp:useBean id="roomdb" class="theater.room.RoomDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<RoomEntity>list = roomdb.getRoomList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 관은 <%= counter  %> 개 입니다.</p><hr>
<table>
<tr>
	<th><b>관 id</b></th>
	<th><b>관 좌석 번호</b></th>
	
</tr>
<%
	for(RoomEntity room : list){
%>
<tr>
	<td><%=room.getRoom_id() %><a href="editroom.jsp?id=<%=room.getRoom_id()%>">수정</a></td>
	<td><%= room.getRoom_seat_num() %></td>
	
</tr>
</table>
<%
	}
	
}else{
%>
	<p>등록된 관이 없습니다.</p>
<%
}
%>
<form name=form method=post action=editroom.jsp>
	<input type=submit value="관 등록">
</form>
	

</html>