<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 등록</title>
<script src="assets/scripts/roomform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	room_id		=	"";
	int	room_seat_num	=	0;
	
	String	headline = "등록";

	room_id= request.getParameter("room_id");
	
	if (room_id != null){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		String idnum = room_id;
		RoomDatabase roomdb = new RoomDatabase();
		RoomEntity room	= roomdb.getRoom(idnum);
		room_seat_num = room.getRoom_seat_num();		
		
		headline = "수정 삭제";	
	};
%>
<h2> 회원 <%= headline %> 프로그램 </h2>
<form name=memberform method=post action="processroom.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->

<table>
<tr>
<td>관 id : <input type=text name=room_id value="<%= room_id %>"/></td>
<td>관 좌석 번호 : <input type=text name=room_seat_num value="<%= room_seat_num %>"></td>


</tr>
</table>
<% if (room_id == null){ %>
	<input type="button" value="등록" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="수정" onClick="updatecheck()"><input type="button" value="삭제" onClick="deletecheck()">
<% } %>
<input type="button" value="목록" onClick="location.href='listrooms.jsp'">

</form>
</body>
</html>