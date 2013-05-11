<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화 리스트</title>
</head>
<body>
<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
<h2>자바 빈즈 MovieDatabase를 이용한 테이블 MOVIE 조회</h2>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<MovieEntity>list = moviedb.getMovieList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 영화는 <%= counter  %> 개 입니다.</p><hr>
<table>
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
<%
	for(MovieEntity movie : list){
%>
<tr>
	<td><%= movie.getTitle() %><a href="editmovie.jsp?id=<%=movie.getId()%>">수정</a></td>
	<td><%= movie.getDescription() %></td>
	<td><%= movie.getGenre() %></td>
	<td><%= movie.getYear() %></td>
	<td><%= movie.getRate() %></td>
	<td><a href="<%= movie.getOfficialSite() %>">공식홈페이지</a></td>
	<td><img src="<%= movie.getPhoto() %>"/></td>
	<td><%= movie.getPlay_time() %></td>
</tr>
</table>
<%
	}
	
}else{
%>
	<p>등록된 영화가 하나도 없습니다.</p>
<%
}
%>
<form name=form method=post action=editmovie.jsp>
	<input type=submit value="영화 등록">
</form>
	

</html>