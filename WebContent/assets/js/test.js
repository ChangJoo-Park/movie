$('.reserve_movie').click(function(){

});

$('.radio input').click(function(){
	name = "영화";
	theater = "극장";
	room ="관";
	date ="날짜";
	time = "시간";
	flag = $(this).attr("name");
	if(flag==="movie"){
		name = $(this).val(); 
		$("#movie_name").text(name);
	}
	else if(flag==="theater"){
		theater = $(this).val(); 
		$("#movie_theater").text(theater);
	}
	else if(flag==="room"){
		room = $(this).val();
		$("#movie_room").text(room);
	}
	else if(flag==="date"){
		date = $(this).val();
		$("#movie_date").text(date);
	}
	else if(flag==="time"){
		time = $(this).val(); 
		$("#movie_time").text(time);
	}
});
$('input').click(function(){
	$(".reserve_result").slideDown().show();
});

$("#seatOK").click(function(){
	var seatNum = $("input[name='seat']:checked").size();
	var seats = new Array();
	var seat_string = "";
	for(var i = 0 ; i<seatNum;i++){
		seats.push($("input[name='seat']:checked")[i]);
		seat_string += seats[i].value+ " ";
	}
	var answer = confirm("선택한 좌석이 "+seat_string+" 이 맞습니까?");
	if(answer){
		var html_before = "총 "+seatNum+"개의 좌석 [";
		var html_after = "] 이 선택되었습니다.";
		alert(html_before+seat_string+html_after);
		$("#movie_seat").text(seats.length+"개의 좌석"+seat_string);
	}else{
		$("input[name='seat']").removeAttr('checked');
	}
	
});