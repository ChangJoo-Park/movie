<%@page import="theater.SeatEntity"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.ArrayList, theater.TheaterEntity" %>
<jsp:useBean id="theaterdb" class="theater.TheaterDatabase" scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String theater  = request.getParameter("theater");
	String room = request.getParameter("room");
	room = room.replace("관", "");
	int room_number = Integer.parseInt(room);
	ArrayList<SeatEntity> seatList = new ArrayList<SeatEntity>();
	ArrayList<String> strList = new ArrayList<String>();
	seatList = theaterdb.getSeatDB(theater, room_number);
	
	for(int i = 0 ; i<seatList.size();i++){
		if(seatList.get(i).getIsSeatUse() == 0){
			Integer tmp = seatList.get(i).getSeatNum();
			strList.add(tmp.toString()+",");
		}
	}
	for(int i = 0 ; i<strList.size();i++){
		out.print(strList.get(i));
		System.out.print(strList.get(i));
	}
%>

