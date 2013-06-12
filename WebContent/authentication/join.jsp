<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<title>회원 등록</title>
<script src="../member/assets/scripts/memberform.js"></script>
<script type="text/javascript">
function checkId() {
	var sid = document.memberform.id.value; // 아이디값 가져오기
	if (sid == "") {
		alert("입력된 아이디가 없습니다."); // 없는 경우 메시지출력
	} else {
		window.open("checkid.jsp?id=" + sid, "", "width=400 height=150");
	}
}
</script>
</head>
<body>
<jsp:include page="../layouts/navigation.jsp"></jsp:include>
<%@ page import="java.util.ArrayList, member.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String	id		=	"";
	String	password	=	"";
	String	mail	=	"";
	String	name	=	"";
	String	address	=	"";
	String	favorite_theater	=	"";
	
	String member_id= request.getParameter("id");

%>
<h2> 회원 가입 </h2>
<form name=memberform method=post action="../member/processmember.jsp">
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정, 삭제를 위한 parameter 전송 -->

<table>
	<tr>
		<td>아이디 : <input type=text name=id size="30" value="<%= id %>"/></td>
		<td><input type="button" value="중복체크" onClick="checkId()"></td>
	</tr>
	<tr>
		<td>패스워드 : <input type=password name=password value="<%= password %>"></td>
	</tr>
	<tr>
		<td>메일 : <input type=text name=mail value="<%= mail %>"></td>
	</tr>
	<tr>
		<td>이름 : <input type=text name=name value="<%= name %>"></td>
	</tr>
	<tr>
		<td>주소 : <input type=text name=address value="<%= address %>"></td>
	</tr>
	<tr>
		<td>선호 영화관 : <input type=text name=favorite_theater value="<%= favorite_theater %>"></td>
	</tr>
</table>

<input type="button" value="등록" onClick="insertcheck()"><input type="reset" value="다시입력">

</form>
</body>
</html>