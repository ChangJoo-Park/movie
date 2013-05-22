<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//넘어오는 값 한글 인코딩 처리하기
		request.setCharacterEncoding("EUC-KR");
	%>



	<%
		//hobby에 해당하는 value 여러개 출력하기
		String[] movies = request.getParameterValues("movie");
		String[] theaters = request.getParameterValues("theater");
		String[] rooms = request.getParameterValues("room");
		String[] times = request.getParameterValues("time");

		out.print("선택한 영화는  : ");
		if(movies != null){
			for (int i=0;i<movies.length;i++) {
				%>
	<%= movies[i] %>
	<%
			}
		}
		
		out.print("선택한 극장은 : ");
		if(theaters != null){
			for (int i=0;i<theaters.length;i++) {
		%>
	<%= theaters[i] %>
	<%  		
			}
		}
		out.print("선택한 관은 : ");
		if(rooms != null){
			for (int i=0;i<rooms.length;i++) {
				%>
	<%= rooms[i] %>
	<%
			}
		}
		
		out.print("선택한 시간은 : ");
		if(times != null){
			for(int i=0;i<times.length;i++){
				%>
	<%= times[i] %>
	<%
			}
		}
	%>
	입니다.

</body>
</html>