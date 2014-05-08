<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.LoginPapu"/>
<jsp:useBean id="asiakas" class="tilanvaraus.oliot.Asiakas"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Vaihda salasana</title>
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
                <h1>Vaihda salasana</h1>
                <%
                request.setCharacterEncoding("UTF-8");
                int userId = (Integer) session.getAttribute("loginUserId");
                asiakas.setAsiakasId(userId);
                
                if (request.getParameter("nappi") != null) {
                    if (request.getParameter("uusisalasana").equals(request.getParameter("uusisalasana2"))) {
                        if (asiakas.vaihdaSalasana(request.getParameter("nyksalasana"),request.getParameter("uusisalasana"))) {
                            response.sendRedirect("omatili.jsp?paivitetty");
                        } else {
                            out.print("<p>Nykyinen salasana ei täsmää!</p>");
                        }
                    } else {
                        out.print("<p>Salasanat eivät täsmää!</p>");
                    }
                }
                %>
                <form method="POST" action="vaihdasalasana.jsp">
                <table class='varaustaulu'>
                    <tr>
                        <td class="vasen">Nykyinen salasana*:</td>
                        <td class="oikea"><input type="password" name="nyksalasana"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Uusi salasana*:</td>
                        <td class="oikea"><input type="password" name="uusisalasana"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Uusi salasana uudelleen*:</td>
                        <td class="oikea"><input type="password" name="uusisalasana2"/></td>
                    </tr>
                </table>
                <input type='submit' value='Vaihda salasana' name='nappi'/>
                </form>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
<%
}
%>