<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.AnimalDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="it.betacom.model.Animal"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<jsp:useBean id="a" class="it.betacom.model.Animal"></jsp:useBean>
<jsp:setProperty property="animalName" name="a"/>
<jsp:setProperty property="price" name="a"/>
<jsp:setProperty property="animalType" name="a"/>
<jsp:setProperty property="customerId" name="a"/>
<jsp:setProperty property="registrationNumber" name="a"/>

<%

if(request.getParameter("purchaseDate") == null || request.getParameter("purchaseDate") == ""){
a.setPurchaseDate(null);
} else {
    String purchaseDateString = request.getParameter("purchaseDate");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date date = formatter.parse(purchaseDateString);
    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    
    a.setPurchaseDate(sqlDate);
    }
    Connection con = Database.getConnection();
    AnimalImpl animalDAO = new AnimalImpl(con);
    String result = animalDAO.update(a);
    request.setAttribute("result", result);
    RequestDispatcher dispatcher = request.getRequestDispatcher("../show-list/show-animals.jsp");
    dispatcher.forward(request, response);
%>
