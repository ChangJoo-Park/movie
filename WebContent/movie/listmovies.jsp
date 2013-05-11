<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ����Ʈ</title>
</head>
<body>
<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
<h2>�ڹ� ���� MovieDatabase�� �̿��� ���̺� MOVIE ��ȸ</h2>
<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<MovieEntity>list = moviedb.getMovieList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� ��ȭ�� <%= counter  %> �� �Դϴ�.</p><hr>
<table>
<tr>
	<th><b>��ȭ����</b></th>
	<th><b>�ó�ý�</b></th>
	<th><b>�帣</b></th>
	<th><b>�����⵵</b></th>
	<th><b>����</b></th>
	<th><b>����Ȩ������</b></th>
	<th><b>����</b></th>
	<th><b>�󿵽ð�</b></th>
</tr>
<%
	for(MovieEntity movie : list){
%>
<tr>
	<td><%= movie.getTitle() %><a href="editmovie.jsp?id=<%=movie.getId()%>">����</a></td>
	<td><%= movie.getDescription() %></td>
	<td><%= movie.getGenre() %></td>
	<td><%= movie.getYear() %></td>
	<td><%= movie.getRate() %></td>
	<td><a href="<%= movie.getOfficialSite() %>">����Ȩ������</a></td>
	<td><img src="<%= movie.getPhoto() %>"/></td>
	<td><%= movie.getPlay_time() %></td>
</tr>
</table>
<%
	}
	
}else{
%>
	<p>��ϵ� ��ȭ�� �ϳ��� �����ϴ�.</p>
<%
}
%>
<form name=form method=post action=editmovie.jsp>
	<input type=submit value="��ȭ ���">
</form>
	

</html>