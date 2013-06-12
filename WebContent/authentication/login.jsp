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
function Login_Clicked()
{
	var idCtrl = document.getElementById('inputid');
	var id = idCtrl.value;
	var pwCtrl = document.getElementById('inputpw');
	var pw = pwCtrl.value; 

	if(id == "" || pw ==""){
		alert("Please Check your ID or Password");
		return;
	}
}

function Join_Page()
{
	window.open("./join.jsp",'_self');
}
</script>
<body>
<form action="login.jsp" method="post">
<jsp:useBean id="member" class="member.MemberEntity" scope="page"></jsp:useBean>
<jsp:useBean id="memberdb" class="member.MemberDatabase" scope="page"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");

	String inputID = "";
	String inputPW = "";
	String errMsg = "";
	
	//ID
	inputID = request.getParameter("inputid");
	if(inputID == null)
	{
		inputID = "";
	}
	
	inputPW = request.getParameter("inputpw");
	if(inputPW == null)
	{
		inputPW = "";
	}

	boolean bLogin = false;
	boolean isLogin = memberdb.setLogin(inputID, inputPW);
	
	if(!inputID.equals("") && !inputPW.equals(""))
	{
		if(isLogin){
			bLogin  = true;
			//set Session
			session.setAttribute("LoginID", inputID);
			response.sendRedirect("../authentication/session.jsp");
			return;
		}
		else{
			errMsg = "Please Check your ID or Password";
		}
	}	
	
%>
<%if(bLogin == false){ %>
	<div align="center">
		<table cellpadding="10" border="1" align="center">
			<tr align="center" valign="middle">
				<td><h4>I D</h4></td>
				<td><input type="text" id="inputid" name="inputid" style="height: 2em;"	size="25" maxlength="25" value="<%= inputID %>"></td>
			</tr>

			<tr align="center" valign="middle">
				<td><h4>P W</h4>
				<td><input type="password" id="inputpw" name="inputpw" style="height: 2em;" size="25" maxlength="25" value="<%= inputPW %>"></td>
			</tr>

			<tr align="center" valign="middle">
				<td align="center" colspan="2">
					<input type="submit" value="Login" style="height: 3em; width: 9em;" onclick="Login_Clicked()"></input>
					<input type="button" value="Join" style="height: 3em; width: 9em;" onclick="Join_Page()"></input>
				</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td align="center" colspan="2">
					<h3><b><font face="Verdana" color="teal"><%=errMsg%></font></b></h3>
				</td>
			</tr>
			
			<tr align="center" valign="middle">
				<td align="center" colspan="2"><h3>
						<b><font face="Verdana" color="teal"><%= session.getAttribute("LoginID") %></font></b>
					</h3></td>
			</tr>
		</table>
	</div>
	<% } %>
</form>
</body>
</html>