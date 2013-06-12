<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<title>Login Page</title>
</head>
<script type="text/javascript">
function checkIdClose(id) {
	opener.memberform.id.value = id; // 열려있는문서중(opener) writeForm의 이름을 가진 문서에 아이디값 전달
	window.close(); // checkId.jsp 윈도우 닫기
	opener.memberform.pwd.focus(); // 회원가입폼의 포커스를 패스워드입력 상자로 이동
}
</script>
<body>
<form action="./checkid.jsp" method="post">
<jsp:useBean id="member" class="member.MemberEntity" scope="page"></jsp:useBean>
<jsp:useBean id="memberdb" class="member.MemberDatabase" scope="page"></jsp:useBean>

<%
	String id = request.getParameter("id");
	if(id == null){
		id = "";
	}
	boolean isCheck = memberdb.checkID(id);
	
	if(isCheck || id.equals("")){
		if(id.equals("")){
			%>
			<br><br>
			<!-- 메시지 출력-->
			아이디 : <input type="text" name="id"></input>
			<!-- 아이디 입력 텍스트박스 생성-->
			<input type="submit" value="중복체크"></input>
			<!-- 재 중복체크를 위한 버튼 생성 -->
			<%
		}else{
			%>
			현재 <b><%=id%></b> 사용불가능<br></br>
			<!-- 메시지 출력-->
			아이디 : <input type="text" name="id"></input>
			<!-- 아이디 입력 텍스트박스 생성-->
			<input type="submit" value="중복체크"></input>
			<!-- 재 중복체크를 위한 버튼 생성 -->
			<%
		}
	}else{
		%>
		현재 <b><%=id%></b> 사용가능<br></br>
		<!-- 메시지 출력 -->
		<a href="./checkid.jsp">다른아이디 고르기</a><br></br>
		<!-- 다른 아이디를 원할 경우 -->
		<!-- 사용자가 입력한 아이디를 선택하면 checkIdClose 자바 스크립트가 실행됩니다. 이때 
                               아이디 값을 인자로 함께 넣어 줍니다. -->
		<input type="button" value="현재 아이디 선택"	onClick="checkIdClose('<%=id%>')">
		<%
	}
%>
	</form>
</body>
</html>