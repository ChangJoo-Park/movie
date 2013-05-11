<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="movie" class="movie.MovieEntity" scope="page"></jsp:useBean>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	String title = request.getParameter("title");
	String year = request.getParameter("year");
	String description = request.getParameter("description");
	String genre = request.getParameter("genre");
	String officialSite = request.getParameter("officialSite");
	String photo = request.getParameter("photo");
	String rate = request.getParameter("rate");
	String playTime = request.getParameter("play_time");
%>

<jsp:setProperty property="*" name="movie"/>

<%
	moviedb.insertDB(movie);
	response.sendRedirect("listmovies.jsp");
%>
</body>
</html>