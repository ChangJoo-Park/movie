<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ȭ ���</title>
</head>
<body>
<%@ page import="java.util.ArrayList, movie.*" %>
<%
	String	title	=	"";
	int		year	=	0;
	String	description	=	"";
	String	genre	=	"";
	String	officialSite	=	"";
	String	photo	=	"";
	int		rate	= 0;
	int		play_time	= 0;
	
	String	headline = "���";
	
	String title_set = request.getParameter("TITLE");
	if (title_set != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		MovieDatabase moviedb = new MovieDatabase();
		MovieEntity movie	= moviedb.getMovie(title_set);
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
<table>
<tr>
<td>���� : <input type=text name=title value="<%= title %>"/></td>
<td>�����⵵ : <input type=number name=year value="<%= year %>"></td>
<td>�ó�ý� : <input type=text name=description value="<%= description %>"></td>
<td>�帣 : <input type=text name=genre value="<%= genre %>"></td>
<td>���� Ȩ������ �ּ� : <input type=text name=officialSite value="<%= officialSite %>"></td>
<td>������ : <input type=text name=photo value="<%= photo%>"></td>
<td>���� : <input type=number name=rate value="<%= rate %>"></td>
<td>�󿵽ð� : <input type=number name=play_time value="<%= play_time %>"></td>
</tr>
</table>
<input type="submit"><input type="reset">
</form>
</body>
</html>