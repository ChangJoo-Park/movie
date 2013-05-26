<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석 등록</title>
<script src="assets/scripts/seatform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, theater.room.seat.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	int seat_num		=	0;
	int	seat_bool		=	0;
	
	String	headline = "등록";

	seat_num= Integer.parseInt(request.getParameter("room_id"));
	
	if (seat_num != 0){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		int idnum = seat_num;
		SeatDatabase seatdb = new SeatDatabase();
		SeatEntity seat	= seatdb.getSeat(idnum);
		seat_bool = seat.getSeat_bool();	
		
		headline = "수정 삭제";	
	};
%>
<h2> 좌석 <%= headline %> 프로그램 </h2>
<form name=roomform method=post action="processseat.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->

<table>
<tr>
<td>좌석번호 : <input type=text name=seat_num value="<%= seat_num %>"/></td>
<td>좌석선택여부 : <input type=text name=seat_bool value="<%= seat_bool %>"></td>


</tr>
</table>
<% if (seat_num == 0){ %>
	<input type="button" value="등록" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="수정" onClick="updatecheck()"><input type="button" value="삭제" onClick="deletecheck()">
<% } %>
<input type="button" value="목록" onClick="location.href='listseats.jsp'">

</form>
</body>
</html>