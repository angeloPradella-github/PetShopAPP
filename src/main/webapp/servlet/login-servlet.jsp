<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>


<jsp:useBean id="u" class="it.betacom.model.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>
<!DOCTYPE html>
<html>
<%
Connection con = Database.getConnection();
UserImpl userDAO = new UserImpl(con);
int i = userDAO.login(u.getUsername(), u.getPassword());
if (i > 0) {
	response.sendRedirect("util/login-success.jsp");
} else
	response.sendRedirect("util/login-error.jsp");
%>
</html>