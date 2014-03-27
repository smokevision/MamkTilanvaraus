<%
    if (session.getAttribute("loginStatus") == "logged") {
        response.sendRedirect("adminsivut/index.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu1" class="tilanvaraus.oliot.LoginPapu"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <title>Kirjaudu sisään</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="container">
        <%
        if (request.getParameter("nappi") != null) {
            if(apu1.getYhteysAuki()){
                String tunnus = request.getParameter("tunnus");
                String salasana = apu1.salasanaMuunnos(request.getParameter("salasana"));
                if (apu1.kirjauduSisaan(tunnus, salasana)){
                    session.setAttribute("loginStatus", "logged");
                    response.sendRedirect("adminsivut/index.jsp");
                } else {
                    out.print("<p class='virhe'>Käyttäjätunnus ja salasana eivät täsmää</p>");
                }
            }
        }
        %>
        <h1>Kirjautuminen</h1>
        <form method="POST" action="login.jsp">
            <p>Käyttäjätunnus<br/>
            <input type="text" name="tunnus"/></p>
            <p>Salasana<br/>
            <input type="password" name="salasana"/></p>
            <input type="submit" name="nappi" value="Kirjaudu"/>
        </form>
        </div>
    </body>
</html>
<% } %>