<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="it.betacom.model.User"%>



<jsp:useBean id="u" class="it.betacom.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
    u.setId(Integer.parseInt(request.getParameter("user_id")));
	Connection con = Database.getConnection();
	UserImpl userDAO = new UserImpl(con);
	String result = userDAO.update(u);
	request.setAttribute("result", result);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../show-list/customers-list.jsp");
	dispatcher.forward(request, response);
%>