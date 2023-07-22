<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-sm navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">PETSHOP</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Lista
						Utenti</a></li>
			</ul>
			<span class="navbar-text"> <%=session.getAttribute("username")%>,
				<%=session.getAttribute("role")%>

			</span>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link btn btn-danger text-white" href="../services/logout-service.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>


