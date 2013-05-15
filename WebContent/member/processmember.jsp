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
	// menu 저장(등록, 수정, 삭제)
	String menu = request.getParameter("menu");
	if(menu.equals("delete") || menu.equals("update")){
		String movie_id = request.getParameter("id");
		int idnum = Integer.parseInt(movie_id);
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		String description = request.getParameter("description");
		String genre = request.getParameter("genre");
		String officialSite = request.getParameter("officialSite");
		String photo = request.getParameter("photo");
		String rate = request.getParameter("rate");
		String playTime = request.getParameter("play_time");
		
		if(menu.equals("delete")){
			moviedb.deleteDB(idnum);
		}else if(menu.equals("update")){
%>
		<jsp:setProperty property="*" name="movie"/>
<%			
			moviedb.updateDB(movie);
		}
		response.sendRedirect("listmovies.jsp");	
	}else if(menu.equals("insert")){
%>
	<jsp:setProperty property="title" name="movie"/>
	<jsp:setProperty property="year" name="movie"/>
	<jsp:setProperty property="description" name="movie"/>
	<jsp:setProperty property="genre" name="movie"/>
	<jsp:setProperty property="officialSite" name="movie"/>
	<jsp:setProperty property="photo" name="movie"/>
	<jsp:setProperty property="rate" name="movie"/>
	<jsp:setProperty property="play_time" name="movie"/>
<%
		moviedb.insertDB(movie);
		response.sendRedirect("listmovies.jsp");
	}
	
%>
</body>
</html>