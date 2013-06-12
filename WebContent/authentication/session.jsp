<%@ page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session Page</title>
</head>

<%
   	Object LoginID = session.getAttribute("LoginID");
	
	if(LoginID != null)
	{
		response.sendRedirect("../movie/listmovies.jsp");
	}
	else
	{
		%>
		<script>
			alert("Please Login");
		</script>
		<%
		session.setAttribute("LoginID", null);
		response.sendRedirect("../authentication/login.jsp");
	}
 %>

<body>

</body>
</html>