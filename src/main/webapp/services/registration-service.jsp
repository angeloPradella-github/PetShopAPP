<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDAO"%>
<%@page import="it.betacom.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="it.betacom.util.database.*"%>
<%@page import="it.betacom.dao.impl.*"%>
<%@page import="it.betacom.model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<jsp:useBean id="u" class="it.betacom.model.User"></jsp:useBean>

<%
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String tel = request.getParameter("tel");
    String birthdate = request.getParameter("birthdate");

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Date dateOfBirth = null;
    try {
        dateOfBirth = format.parse(birthdate);
    } catch (Exception e) {
        e.printStackTrace();
    }

    u.setName(name);
    u.setSurname(surname);
    u.setEmail(email);
    u.setPassword(password);
    u.setBirthdate(dateOfBirth);
    u.setTel(tel);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Connection con = Database.getConnection();
    UserImpl userDAO = new UserImpl(con);

    String result = userDAO.save(u);
    request.setAttribute("result", result); 
    request.getRequestDispatcher("../util/result-page.jsp").forward(request, response); 
%>

</body>
</html>
