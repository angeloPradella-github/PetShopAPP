<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body class="d-flex flex-column justify-content-center align-items-center vh-100">
<h1>REGISTRATION</h1>
	<form class="w-50" action="../services/registration-service.jsp" method="post">
		<!-- Name input -->
		<div class="form-outline mb-4">
			<input type="text" id="name" name="name" class="form-control" required /> 
			<label class="form-label" for="name">Name</label>
		</div>

		<!-- Surname input -->
		<div class="form-outline mb-4">
			<input type="text" id="surname" name="surname" class="form-control" required /> 
			<label class="form-label" for="surname">Surname</label>
		</div>

		<!-- Email input -->
		<div class="form-outline mb-4">
			<input type="email" id="email" name="email" class="form-control" required /> 
			<label class="form-label" for="email">Email</label>
		</div>

		<!-- Tel input -->
		<div class="form-outline mb-4">
			<input type="text" id="tel" name="tel" class="form-control" /> 
			<label class="form-label" for="tel">Telephone</label>
		</div>

		<!-- Birthdate input -->
		<div class="form-outline mb-4">
			<input type="date" id="birthdate" name="birthdate" class="form-control" required /> 
			<label class="form-label" for="birthdate">Birthdate</label>
		</div>

		<!-- Password input -->
		<div class="form-outline mb-4">
			<input type="password" id="password" name="password" class="form-control" required /> 
			<label class="form-label" for="password">Password</label>
		</div>

		<!-- Submit button -->
		<button type="submit" class="btn btn-primary btn-block mb-4">Sign up</button>

		<!-- Register buttons -->
		<div class="text-center">
			<p>
				Already have an account? <a href="../login/login.jsp">Sign in</a>
			</p>
		</div>
	</form>

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
