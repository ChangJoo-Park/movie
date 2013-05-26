<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="room" class="theater.room.RoomEntity" scope="page"></jsp:useBean>
<jsp:useBean id="roomdb" class="theater.room.RoomDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	// menu 저장(등록, 수정, 삭제)
	String menu = request.getParameter("menu");
	if(menu.equals("delete") || menu.equals("update")){
		String room_id = request.getParameter("room_id");
		int room_seat_num = Integer.parseInt(request.getParameter("room_seat_num"));
		
		
		
		if(menu.equals("delete")){
			roomdb.deleteDB(room_id);
		}else if(menu.equals("update")){
%>
		<jsp:setProperty property="*" name="room"/>
<%			
			roomdb.updateDB(room);
		}
		response.sendRedirect("listrooms.jsp");	
	}else if(menu.equals("insert")){
%>
	<jsp:setProperty property="room_id" name="room"/>
	<jsp:setProperty property="room_seat_num" name="room"/>
	
	
	
<%
		roomdb.insertDB(room);
		response.sendRedirect("listrooms.jsp");
	}
	
%>
</body>
</html>