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
	$('input:not(:checked)').parent().removeClass("selected");
	$('input:checked').parent().addClass("selected");
	$(".reserve_result").slideDown().show();
});