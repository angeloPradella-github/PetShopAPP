<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.model.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<title>User List</title>
</head>
<body>

	<jsp:include page="../util/navbar.jsp"></jsp:include>


	<%
	if (session.getAttribute("username") == null) {
        response.sendRedirect("../login/login.jsp");
        return;
    }
	Connection con = Database.getConnection();
	UserImpl userDAO = new UserImpl(con);
	List<User> userList = userDAO.getAll();
	%>
	<table border="1">
    <tr>
        <th>Username</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Telephone</th>
        <th>Birthdate</th>
        <% 
        String role = (String) session.getAttribute("role"); 
        if(role != null && role.equalsIgnoreCase("M")) { %>
            <th>Password</th>
        <% } %>
        <th>Role</th>
        <th>Status</th>
    </tr>
    <% 
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    for (User user : userList) {
    %>
    <tr>
        <td><%=user.getUsername()%></td>
        <td><%=user.getName()%></td>
        <td><%=user.getSurname()%></td>
        <td><%=user.getEmail()%></td>
        <td><%=user.getTel()%></td>
        <td><%=sdf.format(user.getBirthdate())%></td>
        <% if(role != null && role.equalsIgnoreCase("M")) { %>
            <td><%=user.getPassword()%></td>
        <% } %>
        <td><%=user.getRole()%></td>
        <td><%=user.getStatus()%></td>
    </tr>
    <%
    }
    %>
</table>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
