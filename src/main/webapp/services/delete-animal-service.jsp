<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="it.betacom.model.User"%>





<!DOCTYPE html>
<html>
<%
Connection con = Database.getConnection();
AnimalImpl animal = new AnimalImpl(con);
int id = Integer.parseInt(request.getParameter("id"));


String result = animal.delete(id);

    request.setAttribute("result", result); 
    request.getRequestDispatcher("../show-list/show-animals.jsp").forward(request, response); 
%>
</html>
