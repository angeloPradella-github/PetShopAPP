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
<!DOCTYPE html>
<html>
<%
Connection con = Database.getConnection();
UserImpl userDAO = new UserImpl(con);
String i = userDAO.login(u.getUsername(), u.getPassword());
if (i.equals("success")) {
	User loggedInUser = userDAO.getUserByUsername(u.getUsername());
	String role = loggedInUser.getRole();
	session.setAttribute("username", u.getUsername());
	session.setAttribute("role", role);
	response.sendRedirect("../util/login-success.html");
} else {
	session.setAttribute("loginMessage", i);
	response.sendRedirect("../util/login-error.jsp");
}
%>
</html>
