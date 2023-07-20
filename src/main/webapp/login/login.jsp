<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

</head>
<body class="d-flex flex-column justify-content-center align-items-center vh-100">
<h1>LOGIN</h1>
	<form action="adduser.jsp" method="post" class="w-50">
		<!-- Email input -->
		<div class="form-outline mb-4">
			<input type="text" name="username" id="form2Example1" class="form-control" /> <label
				class="form-label" for="form2Example1">Username</label>
		</div>

		<!-- Password input -->
		<div class="form-outline mb-4">
			<input type="password"  name="password" id="form2Example2" class="form-control" /> <label
				class="form-label" for="form2Example2">Password</label>
		</div>

		<!-- 2 column grid layout for inline styling -->
		<div class="row mb-4">
			<div class="col d-flex justify-content-center">
				<!-- Checkbox -->
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="form2Example31" checked /> <label class="form-check-label"
						for="form2Example31"> Remember me </label>
				</div>
			</div>

			<div class="col">
				<!-- Simple link -->
				<a href="#!">Forgot password?</a>
			</div>
		</div>

		<!-- Submit button -->
		<button type="button" class="btn btn-primary btn-block mb-4">Sign
			in</button>

		<!-- Register buttons -->
		<div class="text-center">
			<p>
				Not a member? <a href="registrazione/register.jsp">Register</a>
			</p>
			<p>or sign up with:</p>
			<button type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-facebook-f"></i>
			</button>

			<button type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-google"></i>
			</button>

			<button type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-twitter"></i>
			</button>

			<button type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-github"></i>
			</button>
		</div>
	</form>

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>