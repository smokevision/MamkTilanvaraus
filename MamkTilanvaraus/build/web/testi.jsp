<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="testi" class="tilanvaraus.oliot.Kuva"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String jono = testi.luoRandomNimi();
        out.print("Jono: "+jono);
        
        %>
    </body>
</html>
