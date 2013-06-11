<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ���</title>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<script src="assets/scripts/movieform.js"></script>
</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, movie.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	title	=	"";
	int		year	=	0;
	String	description	=	"";
	String	genre	=	"";
	String	officialSite	=	"";
	String	photo	=	"";
	int		rate	= 0;
	int		play_time	= 0;
	String	headline = "���";

	String movie_id= request.getParameter("id");
	
	if (movie_id != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		int idnum = Integer.parseInt(movie_id);
		MovieDatabase moviedb = new MovieDatabase();
		MovieEntity movie	= moviedb.getMovie(idnum);
		title = movie.getTitle();
		year = movie.getYear();
		description = movie.getDescription();
		genre = movie.getGenre();
		officialSite = movie.getOfficialSite();
		photo = movie.getPhoto();
		rate = movie.getRate();
		play_time = movie.getPlay_time();
		headline = "���� ����";	
	};
%>
<h2> ��ȭ <%= headline %> ���α׷� </h2>
<form name=movieform method=post action="processmovie.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->
<input type=hidden name="id" value="<%= movie_id %>">
<table>
<tr>
<td>���� : <input type=text name=title value="<%= title %>"/></td>
<td>�����⵵ : <input type=text name=year value="<%= year %>"></td>
<td>�ó�ý� : <input type=text name=description value="<%= description %>"></td>
</tr>
<tr>
<td>�帣 : <input type=text name=genre value="<%= genre %>"></td>
<td>���� Ȩ������ �ּ� : <input type=text name=officialSite value="<%= officialSite %>"></td>
<td>������ : <input type=text name=photo value="<%= photo%>"></td>
</tr>
<tr>
<td>���� : <input type=text name=rate value="<%= rate %>"></td>
<td>�󿵽ð� : <input type=text name=play_time value="<%= play_time %>"></td>
</tr>
</table>
<% if (movie_id == null){ %>
	<input type="button" value="���" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="����" onClick="updatecheck()"><input type="button" value="����" onClick="deletecheck()">
<% } %>
<input type="button" value="���" onClick="location.href='listmovies.jsp'">

</form>
</body>
</html>