<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���</title>
<script src="assets/scripts/memberform.js"></script>
</head>
<body>
<jsp:include page="../layouts/navigation.jsp"></jsp:include>
<%@ page import="java.util.ArrayList, member.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String	id		=	"";
	String	password	=	"";
	String	mail	=	"";
	String	name	=	"";
	String	address	=	"";
	String	favorite_theater	=	"";
	
	String	headline = "���";

	String member_id= request.getParameter("id");
	
	if (member_id != null){
		// ����� �ƴ� ��� ����� ���� �� �ʵ� ������ ����
		String idnum = member_id;
		MemberDatabase memberdb = new MemberDatabase();
		MemberEntity member	= memberdb.getMember(idnum);
		password = member.getPassword();
		mail = member.getMail();
		name = member.getName();
		address = member.getAddress();
		favorite_theater = member.getFavorite_theater();
		
		headline = "���� ����";	
	};
%>
<h2> ȸ�� <%= headline %> ���α׷� </h2>
<form name=memberform method=post action="processmember.jsp">
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ����, ������ ���� parameter ���� -->

<table>
<tr>
<td>���̵� : <input type=text name=id value="<%= id %>"/></td>
<td>�н����� : <input type=text name=password value="<%= password %>"></td>
<td>���� : <input type=text name=mail value="<%= mail %>"></td>
<td>�̸� : <input type=text name=name value="<%= name %>"></td>
<td>�ּ� : <input type=text name=address value="<%= address %>"></td>
<td>��ȣ ��ȭ�� : <input type=text name=favorite_theater value="<%= favorite_theater %>"></td>

</tr>
</table>
<% if (member_id == null){ %>
	<input type="button" value="���" onClick="insertcheck()"><input type="reset">
<%}else{ %>
	<input type="button" value="����" onClick="updatecheck()"><input type="button" value="����" onClick="deletecheck()">
<% } %>
<input type="button" value="���" onClick="location.href='listmembers.jsp'">

</form>
</body>
</html>