<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화 리스트</title>
</head>
<body>
<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
<h2>자바 빈즈 MovieDatabase를 이용한 테이블 MOVIE_TEST 조회</h2>
<hr>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
ArrayList<MovieEntity>list = moviedb.getMovieList();
int counter = list.size();
if(counter > 0 ){
%>
<table>
<tr>
	<th><b>영화제목</b></th>
	<th><b>시놉시스</b></th>
	<th><b>장르</b></th>
	<th><b>개봉년도</b></th>
	<th><b>평점</b></th>
	<th><b>공식홈페이지</b></th>
	<th><b>사진</b></th>
</tr>
<%
	for(MovieEntity movie : list){
%>
<tr>
	<td><%= movie.getTitle() %></td>
	<td><%= movie.getDescription() %></td>
	<td><%= movie.getGenre() %></td>
	<td><%= movie.getRelease_year() %></td>
	<td><%= movie.getRate() %></td>
	<td><%= movie.getOfficialSite() %></td>
	<td><%= movie.getPhoto() %></td>
</tr>
<%
	}
}
%>
</table>
<p><hr>조회된 영화는 <%= counter  %>개 입니다.	
</body>
</html>