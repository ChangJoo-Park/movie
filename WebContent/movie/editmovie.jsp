<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>영화 등록</title>
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
	
	String	headline = "등록";
	
	String title_set = request.getParameter("TITLE");
	if (title_set != null){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		MovieDatabase moviedb = new MovieDatabase();
		MovieEntity movie	= moviedb.getMovie(title_set);
		year = movie.getYear();
		description = movie.getDescription();
		genre = movie.getGenre();
		officialSite = movie.getOfficialSite();
		photo = movie.getPhoto();
		rate = movie.getRate();
		play_time = movie.getPlay_time();
		headline = "수정 삭제";	
	};
%>
<h2> 영화 <%= headline %> 프로그램 </h2>
<form name=movieform method=post action="processmovie.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<table>
<tr>
<td>제목 : <input type=text name=title value="<%= title %>"/></td>
<td>개봉년도 : <input type=number name=year value="<%= year %>"></td>
<td>시놉시스 : <input type=text name=description value="<%= description %>"></td>
<td>장르 : <input type=text name=genre value="<%= genre %>"></td>
<td>공식 홈페이지 주소 : <input type=text name=officialSite value="<%= officialSite %>"></td>
<td>포스터 : <input type=text name=photo value="<%= photo%>"></td>
<td>평점 : <input type=number name=rate value="<%= rate %>"></td>
<td>상영시간 : <input type=number name=play_time value="<%= play_time %>"></td>
</tr>
</table>
<input type="submit"><input type="reset">
</form>
</body>
</html>