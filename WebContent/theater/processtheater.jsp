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
		String location = request.getParameter("theater_name");
		String address = request.getParameter("address");
		String room_num = request.getParameter("theater_room_id");
		

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
	<jsp:setProperty property="theater_name" name="theater"/>
	<jsp:setProperty property="address" name="theater"/>
	<jsp:setProperty property="theater_room_id" name="theater"/>
	
	
<%
		theaterdb.insertDB(theater);
		response.sendRedirect("listtheaters.jsp");
	}
	
%>
</body>
</html>