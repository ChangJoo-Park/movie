<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="theater" class="theater.TheaterEntity" scope="page"></jsp:useBean>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	// menu 저장(등록, 수정, 삭제)
	String menu = request.getParameter("menu");
	if(menu.equals("delete") || menu.equals("update")){
		String theater_id = request.getParameter("id");
		int idnum = Integer.parseInt(theater_id);
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		String room_num = request.getParameter("room_num");
		String seat = request.getParameter("seat");
		String time_schedule = request.getParameter("time_schedule");

		if(menu.equals("delete")){
			theaterdb.deleteDB(idnum);
		}else if(menu.equals("update")){
%>
		<jsp:setProperty property="*" name="theater"/>
<%			
			theaterdb.updateDB(theater);
		}
		response.sendRedirect("listtheaters.jsp");	
	}else if(menu.equals("insert")){
%>
	<jsp:setProperty property="location" name="theater"/>
	<jsp:setProperty property="address" name="theater"/>
	<jsp:setProperty property="room_num" name="theater"/>
	<jsp:setProperty property="seat" name="theater"/>
	<jsp:setProperty property="time_schedule" name="theater"/>
	
<%
		theaterdb.insertDB(theater);
		response.sendRedirect("listtheaters.jsp");
	}
	
%>
</body>
</html>