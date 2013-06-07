<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 리스트</title>
</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, member.MemberEntity" %>
<h2>자바 빈즈 MemberDatabase를 이용한 테이블 MEMBER 조회</h2>
<jsp:useBean id="memberdb" class="member.MemberDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<MemberEntity>list = memberdb.getMemberList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>조회된 회원은 <%= counter  %> 개 입니다.</p><hr>
<table>
<tr>
	<th><b>id</b></th>
	<th><b>password</b></th>
	<th><b>mail</b></th>
	<th><b>name</b></th>
	<th><b>address</b></th>
	<th><b>favorite_theater</b></th>
</tr>
<%
	for(MemberEntity member : list){
%>
<tr>
	<td><%= member.getId() %><a href="editmember.jsp?id=<%=member.getId()%>">수정</a></td>
	<td><%= member.getPassword() %></td>
	<td><%= member.getMail() %></td>
	<td><%= member.getName() %></td>
	<td><%= member.getAddress() %></td>
	<td><%= member.getFavorite_theater() %></td>	
</tr>
</table>
<%
	}
	
}else{
%>
	<p>등록된 회원이 없습니다.</p>
<%
}
%>
<form name=form method=post action=editmember.jsp>
	<input type=submit value="회원 등록">
</form>
	

</html>