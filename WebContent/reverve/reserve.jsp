<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<link rel="stylesheet" href="../assets/css/custom.css">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.ArrayList, movie.MovieEntity" %>
	<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
	<jsp:useBean id="moviedb" class="movie.MovieDatabase" scope="page"></jsp:useBean>
	<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
	<%
		request.setCharacterEncoding("EUC-KR");
	
		// 영화 목록 받기
		ArrayList<MovieEntity>movieList = moviedb.getMovieList();
		// 극장 목록 받기
		ArrayList<TheaterEntity>theaterList = theaterdb.getTheaterList();
	%>
	<!-- DB에서 영화 불러서 리스트로 출력하기 시작 -->
	<h1 class="text-center">영화 예매</h1>
	<div class="container-row">
	<form method="post" name=reservation action=reservation.jsp accept-charset="UTF-8">
		<div class="reserve_movie span3">
		<h2 class="text-center">영화선택</h2>
		<ul class="nav">
		<%
			for(MovieEntity movie : movieList){	
		%>
			<li><label class="radio" for="movie_<%=movie.getId()%>"><input type="radio" id="movie_<%=movie.getId()%>" name = movie/><%= movie.getTitle() %></label></li>
		<%
			}
		%>
		</ul>
		</div>

		<div class="reserve_theater span3">	
		<h2 class="text-center">극장 선택</h2>
		<ul class="nav">
		<%
			for(TheaterEntity theater : theaterList){
		%>
			<li><label class="radio" for="theater_<%=theater.getId()%>"><input type="radio" id="movie_<%=theater.getId()%>" name = "theater"/><%= theater.getAddress() %></label></li>
		<%	
			}
		%>
		</ul>
		</div>
		
		<div class="reserve_room span3 ">
		<h2 class="text-center">관 선택</h2>
		<label class="radio" for="room_1"><input type=radio id="room_1" name=room value="1관">1관</label>
		<label class="radio" for="room_2"><input type=radio id="room_2" name=room value="2관">2관</label>
		<label class="radio" for="room_3"><input type=radio id="room_3" name=room value="3관">3관</label>
		<label class="radio" for="room_4"><input type=radio id="room_4" name=room value="4관">4관</label>
		<label class="radio" for="room_5"><input type=radio id="room_5" name=room value="5관">5관</label>
		<label class="radio" for="room_6"><input type=radio id="room_6" name=room value="6관">6관</label>
		<label class="radio" for="room_7"><input type=radio id="room_7" name=room value="7관">7관</label>
		<label class="radio" for="room_8"><input type=radio id="room_8" name=room value="8관">8관</label>
		</div>
		<div class="reserve_date span3">
		<h2 class="text-center">날짜 선택</h2>
		</div>

		<div class="reserve_time span3">
		<h2 class="text-center">시간 선택</h2>
		<label class="radio" for="time_1"><input type=radio id="time_1" name=time value="오전9시">9:00</label>
		<label class="radio" for="time_2"><input type=radio id="time_2" name=time value="오전10시">10:00</label>
		<label class="radio" for="time_3"><input type=radio id="time_3" name=time value="오전11시50분">11:50</label>
		<label class="radio" for="time_4"><input type=radio id="time_4" name=time value="오후12시40분">12:40</label>
		<label class="radio" for="time_5"><input type=radio id="time_5" name=time value="오후3시20분">15:20</label>
		<label class="radio" for="time_6"><input type=radio id="time_6" name=time value="오후4시55분">16:55</label>
		<label class="radio" for="time_7"><input type=radio id="time_7" name=time value="오후6시">18:00</label>
		<label class="radio" for="time_8"><input type=radio id="time_8" name=time value="오후7시35분">19:35</label>
		</div>
		
		<div class="reserve_result span3">
		<h2 class="text-center">예매 내용</h2>
		<p id="movie_name">영화</p>
		<p id="movie_theater">극장</p>
		<p id="movie_room">관</p>
		<p id="movie_date">날짜</p>
		<p id="movie_time">시간</p>
		<input type=submit value=예매>
		</div>
	</form>
	</div>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/test.js" charset="UTF-8"></script>
</body>
</html>