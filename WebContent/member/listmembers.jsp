<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min-responsive.css">
<title>ȸ�� ����Ʈ</title>
</head>
<body>
	<jsp:include page="../layouts/navigation.jsp"></jsp:include>

<%@ page import="java.util.ArrayList, member.MemberEntity" %>
<h2>�ڹ� ���� MemberDatabase�� �̿��� ���̺� MEMBER ��ȸ</h2>
<jsp:useBean id="memberdb" class="member.MemberDatabase" scope="page"></jsp:useBean>
<%
request.setCharacterEncoding("euc-kr");

ArrayList<MemberEntity>list = memberdb.getMemberList();
int counter = list.size();
if(counter > 0 ){
%>
<hr><p>��ȸ�� ȸ���� <%= counter  %> �� �Դϴ�.</p><hr>
<table class="table">
<thead>
<tr>
	<th><b>id</b></th>
	<th><b>password</b></th>
	<th><b>mail</b></th>
	<th><b>name</b></th>
	<th><b>address</b></th>
	<th><b>favorite_theater</b></th>
</tr>
</thead>
<tbody>
<%
	for(MemberEntity member : list){
%>
<tr>
	<td><%= member.getId() %><a class="btn" href="editmember.jsp?id=<%=member.getId()%>">����</a></td>
	<td><%= member.getPassword() %></td>
	<td><%= member.getMail() %></td>
	<td><%= member.getName() %></td>
	<td><%= member.getAddress() %></td>
	<td><%= member.getFavorite_theater() %></td>	
</tr>
<%
	}
	
}else{
%>
	<p>��ϵ� ȸ���� �����ϴ�.</p>
<%
}
%>
</tbody>
</table>
<form name=form method=post action=editmember.jsp>
	<input type=submit value="ȸ�� ���">
</form>
	

</html>