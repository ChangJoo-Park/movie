<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 리스트</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
<h2 class="text-center">영화 목록</h2>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");

ArrayList<MovieEntity>list = moviedb.getMovieList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p class="text-center">조회된 영화는 <%= counter  %> 개 입니다.</p><hr>
<table class="table">
<thead>
<tr>
	<th><b>영화제목</b></th>
	<th><b>시놉시스</b></th>
	<th><b>장르</b></th>
	<th><b>개봉년도</b></th>
	<th><b>평점</b></th>
	<th><b>공식홈페이지</b></th>
	<th><b>사진</b></th>
	<th><b>상영시간</b></th>
</tr>
</thead>
<tbody>
<%
	for(MovieEntity movie : list){
%>

<tr>
	<td align="center"><%= movie.getTitle() %><a class="btn"href="editmovie.jsp?id=<%=movie.getId()%>">수정</a></td>
	<td align="center" width="300px"><%= movie.getDescription() %></td>
	<td align="center"><%= movie.getGenre() %></td>
	<td align="center"><%= movie.getYear() %></td>
	<td align="center"><%= movie.getRate() %></td>
	<td align="center"><a href="<%= movie.getOfficialSite() %>">공식홈페이지</a></td>
	<td align="center"><img src="<%= movie.getPhoto() %>"height="200" width="300"/></td>
	<td align="center"><%= movie.getPlay_time() %></td>
</tr>
<%
	}
	
}else{
%>
	<p>등록된 영화가 하나도 없습니다.</p>
<%
}
%>
</tbody>
</table>
<form name=form method=post action=editmovie.jsp>
	<input type=submit value="영화 등록">
</form>
	

</html>