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
	<jsp:include page="../util/user-edit-modal.jsp"></jsp:include>

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
						<%
						if (role != null && role.equalsIgnoreCase("M")) {
						%>
						<th>Edit</th>
						<%
						}
						%>
					</tr>
				</thead>

				<tbody>
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for (User user : userList) {
					%>
					<tr>
						<td id="username-<%=user.getId()%>"><%=user.getUsername()%></td>
						<td id="name-<%=user.getId()%>"><%=user.getName()%></td>
						<td id="surname-<%=user.getId()%>"><%=user.getSurname()%></td>
						<td id="email-<%=user.getId()%>"><%=user.getEmail()%></td>
						<td id="tel-<%=user.getId()%>"><%=user.getTel()%></td>
						<td id="birthdate-<%=user.getId()%>"><%=sdf.format(user.getBirthdate())%></td>
						<%
						if (role != null && role.equalsIgnoreCase("M")) {
						%>
						<td id="password-<%=user.getId()%>"><%=user.getPassword()%></td>
						<%
						}
						%>
						<td id="role-<%=user.getId()%>"><%=user.getRole()%> <%
 	if (role != null && role.equalsIgnoreCase("M")) {
 	%> <a class="btn btn-sm btn-outline-secondary"
							href="../services/switch-role.jsp?id=<%=user.getId()%>"> <i
								class="fa-solid fa-repeat"></i>
						</a> <%
 	}
 	%></td>
						<td id="status-<%=user.getId()%>"><%=user.getStatus()%> <%
 	if (role != null && role.equalsIgnoreCase("M")) {
 	%> <a href="../services/switch-status.jsp?id=<%=user.getId()%>"
							class="btn btn-sm btn-outline-secondary"> <i
								class="fa-solid fa-repeat"></i>
						</a> <%
 	}
 	%></td>
						<td>
							<%
							if (role != null && role.equalsIgnoreCase("M")) {
							%>
							<button id="edit-<%=user.getId()%>" class="edit-button">
								<i class="fas fa-edit"></i>
							</button> <%
 }
 %>
						</td>
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<%
		if (result != null && !result.isEmpty()) {
		%>
		<div class="mt-3">
			<p
				class="alert alert-<%=result.contains("success") ? "success" : "danger"%>"><%=result%></p>
		</div>
		<%
		}
		%>

	</div>

	<script>
	document.addEventListener('DOMContentLoaded', (event) => {
		  document.querySelectorAll(".edit-button").forEach(button => {
		    button.addEventListener('click', function() {
		      let userId = this.id.split('-')[1];

		      const user = {
		        email: document.getElementById('email-' + userId).textContent,
		        password: document.getElementById('password-' + userId).textContent,
		        tel: document.getElementById('tel-' + userId).textContent
		      };

		      document.getElementById('editUserId').value = userId;
		      document.getElementById('editEmail').value = user.email;
		      document.getElementById('editPassword').value = user.password;
		      document.getElementById('editTel').value = user.tel;

		   //  titolo della modale 	
		      let username = document.getElementById('username-' + userId).textContent;
		      document.getElementById('editUserModalLabel').textContent = 'Edit User ' + username;
		      // Mostra la modale
		      let modal = new bootstrap.Modal(document.getElementById('editUserModal'));
		      modal.show();
		    });
		  });
		});

</script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>
