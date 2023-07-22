<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.model.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<title>User List</title>
</head>
<body>
	<%
		Connection con = Database.getConnection();
		UserImpl userDAO = new UserImpl(con);
		List<User> userList = userDAO.getAll();
	%>
	<table border="1">
		<tr>
			<th>Username</th>
			<th>Password</th>
		</tr>
		<% for(User user : userList) { %>
			<tr>
				<td><%= user.getUsername() %></td>
				<td><%= user.getPassword() %></td>
			</tr>
		<% } %>
	</table>
</body>
</html>
