<%
if (session.getAttribute("loginStatus") == "logged") {
        response.sendRedirect("index.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.LoginPapu"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Kirjautuminen</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="includes/header.jsp" %>
                <div id="banneri"></div>
                <div id="palsta">
                    <%
                    if (request.getParameter("nappi") != null) {
                        if(apu.getYhteysAuki()){
                            String tunnus = request.getParameter("tunnus");
                            String salasana = apu.salasanaMuunnos(request.getParameter("salasana"));
                            if (apu.userLogin(tunnus, salasana)){
                                session.setAttribute("loginStatus", "logged");
                                session.setAttribute("loginPermission", "user");
                                response.sendRedirect("omatili.jsp");
                            } else {
                                out.print("<p class='virhe'>Käyttäjätunnus ja salasana eivät täsmää</p>");
                            }
                        }
                    }
                    %>
                    <h1>Kirjaudu sisään</h1>
                    <div id="loginpalsta"> 
                        <form method="POST" action="login.jsp">
                            <p>Käyttäjätunnus<br/>
                            <input type="text" name="tunnus"/></p>
                            <p>Salasana<br/>
                            <input type="password" name="salasana"/></p>
                            <input type="submit" name="nappi" value="Kirjaudu sisään"/>
                        </form>
                        <p><a href="#">Unohtuiko salasana?</a></p>
                    </div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
