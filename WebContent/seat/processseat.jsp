<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="seat" class="theater.room.seat.SeatEntity" scope="page"></jsp:useBean>
<jsp:useBean id="seatdb" class="theater.room.seat.SeatDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	// menu 저장(등록, 수정, 삭제)
	String menu = request.getParameter("menu");
	if(menu.equals("delete") || menu.equals("update")){
		int seat_num = Integer.parseInt(request.getParameter("seat_num"));
		int seat_bool = Integer.parseInt(request.getParameter("seat_bool"));
		
		
		
		if(menu.equals("delete")){
			seatdb.deleteDB(seat_num);
		}else if(menu.equals("update")){
%>
		<jsp:setProperty property="*" name="seat"/>
<%			
			seatdb.updateDB(seat);
		}
		response.sendRedirect("listseats.jsp");	
	}else if(menu.equals("insert")){
%>
	<jsp:setProperty property="seat_num" name="seat"/>
	<jsp:setProperty property="seat_bool" name="seat"/>
	
	
	
<%
		seatdb.insertDB(seat);
		response.sendRedirect("listseats.jsp");
	}
	
%>
</body>
</html>