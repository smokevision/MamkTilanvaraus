<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin index</title>
    </head>
    <body>
        <h1>Admin index</h1>
    </body>
</html>
<% } %>
