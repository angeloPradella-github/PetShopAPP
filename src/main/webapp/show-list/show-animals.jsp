<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.AnimalDAO"%>
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
<title>Animal List</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<jsp:include page="../util/navbar.jsp"></jsp:include>
	
	<jsp:include page="../util/animal-edit-modal.jsp"></jsp:include>
	
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("../login/login.jsp");
		return;
	}

	Connection con = Database.getConnection();
	AnimalImpl animalDAO = new AnimalImpl(con);;
	List<Animal> animalList = animalDAO.getAll();
	%>

	<div class="container mt-4">
	 <h1 class="mt-4">Registered Animals</h1>
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th><a class="btn btn-primary" href="../save-animal/save-animal.jsp">New <i class="fa-solid fa-plus"></i></a> Registration Number</th>
						<th>Name</th>
						<th>Purchase Date</th>
						<th>Price</th>
						<th>Type</th>
						<th>Customer ID</th>
						<th>Edit</th>
					</tr>
				</thead>

				<tbody>
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for (Animal animal : animalList) {
					%>
					<tr>
						<td id="registration-<%=animal.getRegistrationNumber()%>"><%=animal.getRegistrationNumber()%></td>
						<td id="name-<%=animal.getRegistrationNumber()%>"><%=animal.getAnimalName()%></td>
						<td id="purchaseDate-<%=animal.getRegistrationNumber()%>"><%
if(animal.getPurchaseDate() == null) {
  out.print("Available");
} else {
  out.print(sdf.format(animal.getPurchaseDate()));
}
%></td>
						<td id="price-<%=animal.getRegistrationNumber()%>"><%=animal.getPrice()%></td>
						<td id="type-<%=animal.getRegistrationNumber()%>"><%=animal.getAnimalType()%></td>
						<td id="customerId-<%=animal.getRegistrationNumber()%>"><%=animal.getCustomerId()%></td>
						<td id="customerId-<%=animal.getRegistrationNumber()%>">
						
						<button id="edit-<%=animal.getRegistrationNumber()%>"
								class="edit-button btn btn-sm btn-outline-secondary edit">
								<i class="fas fa-edit"></i>
							</button>
						</td>
						
					</tr>

					<%
					}
					%>
				</tbody>
			</table>
		</div>
		
		
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
	</div>
	
<script>
document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll(".edit-button").forEach(button => {
    button.addEventListener('click', function() {
      let animalId = this.id.split('-')[1];

      const animal = {
        name: document.getElementById('name-' + animalId).textContent,
        purchaseDate: document.getElementById('purchaseDate-' + animalId).textContent,
        price: document.getElementById('price-' + animalId).textContent,
        type: document.getElementById('type-' + animalId).textContent,
        customerId: document.getElementById('customerId-' + animalId).textContent,
      };

      document.getElementById('editAnimalRegistrationNumber').value = animalId;
      document.getElementById('editName').value = animal.name;
      document.getElementById('editPurchaseDate').value = animal.purchaseDate;
      document.getElementById('editPrice').value = animal.price;
      document.getElementById('editType').value = animal.type;
      document.getElementById('editCustomerId').value = animal.customerId;

      // Modal title
      let animalName = document.getElementById('name-' + animalId).textContent;
      document.getElementById('editAnimalModalLabel').textContent = 'Edit Animal ' + animalName;
      
      // Show the modal
      let modal = new bootstrap.Modal(document.getElementById('editAnimalModal'));
      modal.show();
    });
  });
});
</script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>
