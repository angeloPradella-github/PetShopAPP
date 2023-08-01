<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="it.betacom.model.Animal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<jsp:useBean id="a" class="it.betacom.model.Animal"></jsp:useBean>

<%
    String animalName = request.getParameter("animalName");
    double price = Double.parseDouble(request.getParameter("price"));
    String animalType = request.getParameter("animalType");
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    String purchaseDate = request.getParameter("purchaseDate");

    System.out.println("Animal Name: " + animalName);  // Stampa nome animale
    System.out.println("Price: " + price);  // Stampa prezzo
    System.out.println("Animal Type: " + animalType);  // Stampa tipo animale
    System.out.println("Customer ID: " + customerId);  // Stampa ID cliente
    System.out.println("Purchase Date: " + purchaseDate);  // Stampa data acquisto

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Date purchaseDateAsDate = null;
    try {
        purchaseDateAsDate = format.parse(purchaseDate);
    } catch (Exception e) {
        e.printStackTrace();
    }

    a.setAnimalName(animalName);
    a.setPrice(price);
    a.setAnimalType(animalType);
    a.setCustomerId(customerId);
    if(purchaseDateAsDate == null){
    a.setPurchaseDate(null);
} else {
  a.setPurchaseDate(new java.sql.Date(purchaseDateAsDate.getTime()));
}
    System.out.println("Animal object: " + a);  // Stampa l'oggetto animale
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Animal</title>
</head>
<body>
<%
    Connection con = Database.getConnection();
    System.out.println("Database connection: " + con);  // Stampa la connessione al database

    UserImpl userImpl = new UserImpl(con);
    System.out.println("UserImpl object: " + userImpl);  // Stampa l'oggetto UserImpl

    String result = userImpl.save(a);
    System.out.println("Result: " + result);  // Stampa il risultato

    request.setAttribute("result", result); 
    request.getRequestDispatcher("../save-animal/save-animal.jsp").forward(request, response); 

%>

</body>
</html>
