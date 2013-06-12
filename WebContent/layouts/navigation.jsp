<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar">
  <div class="navbar-inner">
    <a class="brand" href="#">영화예매</a>
    <ul class="nav">
      <li><a href="/CinemaReservation/movie/listmovies.jsp">영화</a></li>
      <li><a href="/CinemaReservation/theater/listtheaters.jsp">극장</a></li>
      <li><a href="/CinemaReservation/reserve/reserve.jsp">예매하기</a></li>
      <%
      	Object LoginID = session.getAttribute("LoginID");
      
      	if(LoginID == null){
      		%>
      		<li><a href="/CinemaReservation/authentication/login.jsp">로그인</a></li>
      		<%
      	}
      	else{
      		%>
      		<li><a href="/CinemaReservation/authentication/logout.jsp">로그아웃</a></li>
      <%} %>
    </ul>
  </div>
</div>