<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String movie 	= request.getParameter("movie");  
	String theater	= request.getParameter("theater");
	String room 	= request.getParameter("room");
	String date 	= request.getParameter("date"); 
	String time 	= request.getParameter("time");

	List<String> list = new ArrayList<String>();
	list.add(movie);
	list.add(theater);
	list.add(room);
	list.add(date);
	list.add(time);	
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
