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
<meta charset="ISO-8859-1">
<title>User List</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="../util/navbar.jsp"></jsp:include>

	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("../login/login.jsp");
		return;
	}
	
	String result = (String) request.getAttribute("result"); //messaggio di result
	
	Connection con = Database.getConnection();
	UserImpl userDAO = new UserImpl(con);
	List<User> userList = userDAO.getAll();
	%>

	<div class="container mt-4">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>Username</th>
						<th>Name</th>
						<th>Surname</th>
						<th>Email</th>
						<th>Telephone</th>
						<th>Birthdate</th>
						<%
						String role = (String) session.getAttribute("role");
						if (role != null && role.equalsIgnoreCase("M")) {
						%>
						<th>Password</th>
						<%
						}
						%>
						<th>Role</th>
						<th>Status</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
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
						<%
						if (role != null && role.equalsIgnoreCase("M")) {
						%>
						<td><%=user.getPassword()%></td>
						<%
						}
						%>
						<td><%=user.getRole()%> <a
							href="../services/switch-role.jsp?id=<%=user.getId()%>"><button
									class="btn btn-sm btn-outline-secondary">
									<i class="fa-solid fa-repeat"></i>								</button></a></td>
						<td><%=user.getStatus()%> <a href="#"><button
									class="btn btn-sm btn-outline-secondary">
									<i class="fa-solid fa-repeat"></i>
								</button></a></td>
						<td><a href="#"><i class="fas fa-edit"></i></a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<%
if(result != null && !result.isEmpty()) {
%>
<div class="mt-3">
    <p class="alert alert-success"><%= result %></p>
</div>
<%
}
%>
		
	</div>

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
  var result = "<%=request.getAttribute("result")%>";
		if (result != null && result != "") {
			var toastEl = document.getElementById('myToast');
			var toast = new bootstrap.Toast(toastEl);
			toast.show();
		}
	</script>


</body>
</html>
