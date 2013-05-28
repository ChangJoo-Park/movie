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
	String theater	= request.getParameter("theater"); // 넘어온 영화관이름
	System.out.println(theater);
	int theater_id = theaterdb.getTheaterRoomDB(theater);
	System.out.println(theater_id);
	List<String> list = new ArrayList<String>();

	
	// 개행문자 제거
	for(String listItem : list){
		listItem.replaceAll("\n", "");
		listItem.replaceAll("\r", "");
		System.out.println(listItem);	
	}
	
	for(int i = 0 ; i<list.size(); i++){
		out.println(list.get(i)+",");
	}
	
%>
<%
	ArrayList<TheaterEntity>theaterList = theaterdb.getTheaterList();

%>
