<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<jsp:useBean id="member" class="member.MemberEntity" scope="page"></jsp:useBean>
<jsp:useBean id="memberdb" class="member.MemberDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	// menu 저장(등록, 수정, 삭제)
	String menu = request.getParameter("menu");
	if(menu.equals("delete") || menu.equals("update")){
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String faverite_theater = request.getParameter("favorite_theater");
		
		
		if(menu.equals("delete")){
			memberdb.deleteDB(id);
		}else if(menu.equals("update")){
%>
		<jsp:setProperty property="*" name="member"/>
<%			
			memberdb.updateDB(member);
		}
		response.sendRedirect("listmembers.jsp");	
	}else if(menu.equals("insert")){
%>
	<jsp:setProperty property="id" name="member"/>
	<jsp:setProperty property="password" name="member"/>
	<jsp:setProperty property="mail" name="member"/>
	<jsp:setProperty property="name" name="member"/>
	<jsp:setProperty property="address" name="member"/>
	<jsp:setProperty property="favorite_theater" name="member"/>
	
<%
		memberdb.insertDB(member);
		response.sendRedirect("listmembers.jsp");
	}
	
%>
</body>
</html>