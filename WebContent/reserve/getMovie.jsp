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
	ArrayList<Integer> list = new ArrayList<Integer>();
	ArrayList<String> strList = new ArrayList<String>();
	
	String theater	= request.getParameter("theater"); // 넘어온 영화관이름
	list = theaterdb.getTheaterRoomDB(theater);
	// 받아온 Integer 리스트를 String으로 변경
	for(int i = 0 ; i<list.size(); i++){
		strList.add(list.get(i).toString());
		System.out.println(strList.get(i)+"관");
	}
	
	// 개행문자 제거
	for(int i = 0 ; i<strList.size(); i++){
		out.println(list.get(i).toString()+",");
	}	
%>

