<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="cust.data.users.DAO"%>
<%@ page import="cust.data.users.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Users</title>
</head>
<body>
	<h1>All Users</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>User Name</th>
			<th>Email</th>
			<th>Full Name</th>
		</tr>
		<form name="deleteUser" action="deleteUser.jsp" method="post">
		<input type="hidden" name="hiddenbutton" value=""/>
		<%
			List<User> users = DAO.getAllUsers();

			for (User p : users) {
				out.println("<tr><td>" + p.getId() + "</td><td>" + p.getName() + "</td><td>" + p.getEmail()
						+ "</td><td>" + p.getFullname() + "</td><td><button value=\"" + p.getId() + "\" onclick=\"document.deleteUser.hiddenbutton.value=this.value;document.form.submit();\">Delete</button></td></tr>");
			}
		%>
		</form>
	</table>
</body>
</html>