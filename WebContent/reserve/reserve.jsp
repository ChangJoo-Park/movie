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
	<div id="reservation_before">
	<!-- DB에서 영화 불러서 리스트로 출력하기 시작 -->
	<h1 class="text-center">영화 예매</h1>
	<form method="post" name=reservation action=reservation.jsp accept-charset="UTF-8">
		<div class="container-row">
		<div class="span15">
			<div class="reserve_movie span3">
			<h2 class="text-center">영화선택</h2>
			<ul class="nav">
			<%
				for(MovieEntity movie : movieList){	
			%>
				<li><label class="radio" for="movie_<%=movie.getId()%>"><input type="radio" id="movie_<%=movie.getId()%>" name = movie value = '<%= movie.getTitle() %>'/><%= movie.getTitle() %></label></li>
			<%
				}
			%>
			</ul>
			</div>
	
			<div class="reserve_theater span3">	
			<h2 class="text-center">극장선택</h2>
			<ul class="nav list" id="theater_list">
			<%
				for(TheaterEntity theater : theaterList){
			%>
				<li><label class="radio" for="theater_<%=theater.getTheater_id()%>"><input type="radio" id="theater_<%=theater.getTheater_id() %>" name = "theater" value="<%= theater.getTheater_name() %>"/><%= theater.getTheater_name() %></label></li>
			<%	
				}
			%>
			</ul>
			</div>
			
			<div class="reserve_room span3 hide">
			<h2 class="text-center">관 선택</h2>
			<div id="room_list"></div>
			</div>
			<div class="reserve_seat span3 hide"><h2 class="text-center">좌석 선택</h2>
			<div id="seat_list"></div>
			<input type='button' id='seatOK' value='선택완료'/>
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
		</div>
		</div>
		<div class="span12 result hide reserve_result">
				<h2 class="text-center">예매 내용</h2>
				<div class="span2" id="movie_name">영화를 선택하세요</div>
				<div class="span2" id="movie_theater">극장을 선택하세요</div>
				<div class="span2" id="movie_room">관을 선택하세요</div>
				<div class="span2" id="movie_seat">좌석을 선택하세요</div>
				<div class="span2" id="movie_date">날짜를 선택하세요</div>
				<div class="span2" id="movie_time">시간을 선택하세요</div>		
			<input type="button" id="reserve" value="예매하기">
		</div>
	</form>
	</div>
	<div id="reservation"></div>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/test.js" charset="UTF-8"></script>
	
	<!--  ajax로 결과 출력 -->
	<script type="text/javascript">
	$(function(){
		$("#reserve").click(function(){
			$("#reservation_before").fadeOut("fast").hide();
			$.get("reservation.jsp", // url
					{movie: $("#movie_name").text(),
					 theater: $("#movie_theater").text(),
					 room: $("#movie_room").text(),
					 date: $("#movie_date").text(),
					 time: $("#movie_time").text()}, // param
					function(data){viewData(data);}	);			
		});//click
		
		function viewData(data){
			data = $.trim(data);
			var result = data.split(",");
			var html = '';
			for(var i = 0; i<result.length; i++){
				// 개행문자 제거
				result[i].replace('\n','');
				result[i].replace('\r','');
				html += "<p>"+result[i]+"</p>";
			}
			$("#reservation").html(html).slideDown();
		}// viewData
		// 영화관 선택 시 관 출력
		$(".radio input[name='theater']").click(function(){
			
			// 영화관 정보를 jsp에 파라미터로 전달해서 그 영화관에 해당하는 관의 리스트를 출력함
			$.get("getMovie.jsp", // url
					{theater: $(".radio input[name='theater']:checked").val()}, // param
					function(data){
						viewTheater(data);
						$("input[name='room']").click(function(){
							var room = $("input[name='room']:checked + label").text();
							$("#movie_room").html(room);
							var theater = $("#movie_theater").text();
							$.get("getSeat.jsp",
								{theater: theater,room: room},
								function(data){
									viewSeat(data);
							});
						});
					});
		});// 영화관 클릭
		function viewTheater(data){
			data = $.trim(data);
			var result = data.split(",");
			var html = "";
			
			for(var i = 0 ; i<result.length-1; i++){
				html += "<input type='radio' id='room_"+result[i]+"' name='room'/>"
						+"<label class='radio' for='room_"+result[i]+"'>"
						+result[i]+"관"+"</label>";
			}
			$(".reserve_room").removeClass("hide");
			$("#room_list").html(html);
		}
		function viewSeat(data){
			data = $.trim(data);
			var result = data.split(",");
			var html = "";
			for(var i = 0 ; i<result.length-1; i++){
				html += "<input type='checkbox' id='seat_"+result[i]+"'name='seat' value='"+result[i]+"'/>"+result[i];
			}
			$(".reserve_seat").removeClass("hide");
			$("#seat_list").html(html);
		}
	});
	</script>

</body>
</html>