<%
    if (session.getAttribute("loginStatus") == "logged") {
        response.sendRedirect("index.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu1" class="tilanvaraus.oliot.LoginPapu"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Kirjaudu sisään</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="../css/main.css"/>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <div id="loginpalsta">    
                <%
                if (request.getParameter("nappi") != null) {
                    if(apu1.getYhteysAuki()){
                        String tunnus = request.getParameter("tunnus");
                        String salasana = apu1.salasanaMuunnos(request.getParameter("salasana"));
                        if (apu1.kirjauduSisaan(tunnus, salasana)){
                            session.setAttribute("loginStatus", "logged");
                            response.sendRedirect("index.jsp");
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
                    <input type="submit" name="nappi" value="Kirjaudu sisään"/>
                </form>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
    </body>
</html>
<% } %>