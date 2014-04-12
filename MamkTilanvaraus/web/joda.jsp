<%-- 
    Document   : joda
    Created on : Apr 11, 2014, 7:02:51 PM
    Author     : Ville
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="kalenteri" class="tilanvaraus.oliot.Joda"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        out.print(kalenteri.testi());
        %>
    </body>
</html>
