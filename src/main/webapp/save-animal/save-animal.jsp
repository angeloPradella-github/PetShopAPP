<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Add New Animal</title>
</head>
<body>
	<jsp:include page="../util/navbar.jsp"></jsp:include>
	<section
		class="d-flex flex-column justify-content-center align-items-center vh-100">
		<%
		String result = (String) request.getAttribute("result");
		if (result != null && !result.isEmpty()) {
		%>
		<div
			class="alert alert-<%=result.contains("success") ? "success" : "warning"%> w-50 mt-3"
			role="alert">
			<%=result%>
		</div>
		<%
		session.removeAttribute("result");
		}
		%>

		<h1 class="mb-5">Add New Animal</h1>
		<form class="w-50" action="../services/save-animal-service.jsp"
			method="post">
			<!-- Animal Name input -->
			<div class="form-outline mb-4">
				<input type="text" id="animalName" name="animalName"
					class="form-control" required /> <label class="form-label"
					for="animalName">Animal Name</label>
			</div>

			<!-- Purchase Date input -->
			<div class="form-outline mb-4">
				<input type="date" id="purchaseDate" name="purchaseDate"
					class="form-control" required /> <label class="form-label"
					for="purchaseDate">Purchase Date</label>
			</div>

			<!-- Price input -->
			<div class="form-outline mb-4">
				<input type="number" step="0.01" id="price" name="price"
					class="form-control" required /> <label class="form-label"
					for="price">Price</label>
			</div>

			<!-- Animal Type input -->
			<div class="form-outline mb-4">
				<input type="text" id="animalType" name="animalType"
					class="form-control" required /> <label class="form-label"
					for="animalType">Animal Type</label>
			</div>

			<!-- Customer Id input -->
			<div class="form-outline mb-4">
				<input type="number" id="customerId" name="customerId"
					class="form-control" required /> <label class="form-label"
					for="customerId">Customer ID</label>
			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-block mb-4">Add
				Animal</button>

		</form>

		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	</section>
</body>
</html>
