<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.CustomerDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.model.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>

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
 String customerId1 = request.getParameter("customerId");
 


    String result = (String) request.getAttribute("result"); //messaggio di result

      Connection con = Database.getConnection();
      
      List<Animal> animalList = null;
    
     if(customerId1 != null) {
   
    int customerId = Integer.parseInt(customerId1); 
     
     CustomerImpl customerImpl = new CustomerImpl(con);
     
     
animalList = customerImpl.getAnimals(customerId);
     

 }
    CustomerDAO customerDAO = new CustomerImpl(con);
    List<Customer> customerList = customerDAO.getAll();
    %>

    <div class="container mt-4">
    <h1 class="mt-4">Tabella Clienti</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Phone Number</th>
                        <th>View Purchased Animals</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                    for (Customer customer : customerList) {
                    %>
                    <tr>
                        <td><%=customer.getFirstName()%></td>
                        <td><%=customer.getLastName()%></td>
                        <td><%=customer.getAddress()%></td>
                        <td><%=customer.getCity()%></td>
                        <td><%=customer.getPhoneNumber()%></td>
                        <td>
                            <a class="btn btn-sm btn-outline-secondary"
                                href="clienti.jsp?customerId=<%=customer.getCustomerId()%>"> 
                                <i class="fa-solid fa-eye"></i> Mostra
                            </a>
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
        
        
        
        <%
         if (animalList != null) {
        %>
         <h1 class="mt-4">Acquisti Cliente</h1>
        <div class="mt-3">
       
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Animal Name</th>
                        <th>Purchase Date</th>
                        <th>Price</th>
                        <th>Animal Type</th>
                        <th class="d-flex justify-content-between">Registration number
                        <a href="clienti.jsp">
                        <i class="fa-solid fa-rectangle-xmark text-danger"></i></a>
                        </th>
                        
                    </tr>
                </thead>

                <tbody>
                    <%
                    for (Animal animal : animalList) {
                    %>
                    <tr>
                        <td><%=animal.getAnimalName()%></td>
                        <td><%=animal.getPurchaseDate()%></td>
                        <td><%=animal.getPrice()%></td>
                        <td><%=animal.getAnimalType()%></td>
                        <td><%=animal.getRegistrationNumber()%></td>
                        
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        
        
        <%
        }
        
        %>

    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>
