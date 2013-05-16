<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 등록</title>
<script src="assets/scripts/memberform.js"></script>
</head>
<body>
<%@ page import="java.util.ArrayList, member.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	id		=	"";
	String	password	=	"";
	String	mail	=	"";
	String	name	=	"";
	String	address	=	"";
	String	favorite_theater	=	"";
	
	String	headline = "등록";

	String member_id= request.getParameter("id");
	
	if (member_id != null){
		// 등록이 아닌 경우 출력을 위해 각 필드 내용을 저장
		String idnum = member_id;
		MemberDatabase memberdb = new MemberDatabase();
		MemberEntity member	= memberdb.getMember(idnum);
		password = member.getPw();
		mail = member.getMail();
		name = member.getName();
		address = member.getAddress();
		favorite_theater = member.getFa_theater();
		
		headline = "수정 삭제";	
	};
%>
<h2> 회원 <%= headline %> 프로그램 </h2>
<form name=memberform method=post action="processmember.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->
<input type=hidden name="id" value="<%= member_id %>">
<table>
<tr>
<td>아이디 : <input type=text name=title value="<%= id %>"/></td>
<td>패스워드 : <input type=number name=year value="<%= password %>"></td>
<td>메일 : <input type=text name=description value="<%= mail %>"></td>
<td>이름 : <input type=text name=genre value="<%= name %>"></td>
<td>주소 : <input type=text name=officialSite value="<%= address %>"></td>
<td>선호 영화관 : <input type=text name=photo value="<%= favorite_theater %>"></td>

</tr>
</table>
<% if (member_id == null){ %>
	<input type="button" value="등록" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="수정" onClick="updatecheck()"><input type="button" value="삭제" onClick="deletecheck()">
<% } %>
<input type="button" value="목록" onClick="location.href='listmember.jsp'">

</form>
</body>
</html>