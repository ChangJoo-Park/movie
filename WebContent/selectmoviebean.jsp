<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ����Ʈ</title>
</head>
<body>
<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
<h2>�ڹ� ���� MovieDatabase�� �̿��� ���̺� MOVIE_TEST ��ȸ</h2>
<hr>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
ArrayList<MovieEntity>list = moviedb.getMovieList();
int counter = list.size();
if(counter > 0 ){
%>
<table>
<tr>
	<th><b>��ȭ����</b></th>
	<th><b>�ó�ý�</b></th>
	<th><b>�帣</b></th>
	<th><b>�����⵵</b></th>
	<th><b>����</b></th>
	<th><b>����Ȩ������</b></th>
	<th><b>����</b></th>
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
<p><hr>��ȸ�� ��ȭ�� <%= counter  %>�� �Դϴ�.	
</body>
</html>