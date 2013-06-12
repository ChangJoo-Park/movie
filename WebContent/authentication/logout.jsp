<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session= "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Log out</title>
</head>
<%
   	Object LoginID = session.getAttribute("LoginID");
	
	session.invalidate();
%>
<script>
	window.top.location.href = "../movie/listmovies.jsp";
	alert("Logout");
</script>
<body>

</body>
</html>