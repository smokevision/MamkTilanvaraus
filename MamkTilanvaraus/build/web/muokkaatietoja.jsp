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
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Muokkaa tietoja</title>
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
                <h1>Muokkaa tietoja</h1>
                <%
                request.setCharacterEncoding("UTF-8");
                int userId = (Integer) session.getAttribute("loginUserId");
                asiakas.setAsiakasId(userId);
                if (request.getParameter("nappi") != null) {
                    asiakas.setEtunimi(request.getParameter("etunimi"));
                    asiakas.setSukunimi(request.getParameter("sukunimi"));
                    asiakas.setKatuosoite(request.getParameter("katuosoite"));
                    asiakas.setPostinumero(request.getParameter("postinumero"));
                    asiakas.setPostitoimipaikka(request.getParameter("postitoimipaikka"));
                    asiakas.setYritys(request.getParameter("yritys"));
                    asiakas.setYtunnus(request.getParameter("ytunnus"));
                    asiakas.setPuh(request.getParameter("puhelin"));
                    if (asiakas.paivitaAsiakastiedot()) {
                        response.sendRedirect("omatili.jsp?paivitetty");
                    } else {
                        out.print("<p>Pahoittelut, järjestelmässä tapahtui virhe!</p>");
                    }
                }
                if(asiakas.haeAsiakas()){
                    while (asiakas.getVastaus().next()){
                %>
                <form method="POST" action="muokkaatietoja.jsp">
                <table class='varaustaulu'>
                    <tr>
                        <td class="vasen">Etunimi*:</td>
                        <td class="oikea"><input type="text" name="etunimi" value="<% out.print(asiakas.getVastaus().getString("etunimi"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Sukunimi*:</td>
                        <td class="oikea"><input type="text" name="sukunimi" value="<% out.print(asiakas.getVastaus().getString("sukunimi"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Yritys:</td>
                        <td class="oikea"><input type="text" name="yritys" value="<% out.print(asiakas.getVastaus().getString("yritys"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Y-tunnus:</td>
                        <td class="oikea"><input type="text" name="ytunnus" value="<% out.print(asiakas.getVastaus().getString("ytunnus"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Katuosoite*:</td>
                        <td class="oikea"><input type="text" name="katuosoite" value="<% out.print(asiakas.getVastaus().getString("katuosoite"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Postinumero*:</td>
                        <td class="oikea"><input type="text" name="postinumero" value="<% out.print(asiakas.getVastaus().getString("postinumero"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Postitoimipaikka*:</td>
                        <td class="oikea"><input type="text" name="postitoimipaikka" value="<% out.print(asiakas.getVastaus().getString("postitoimipaikka"));%>"/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Puhelin*:</td>
                        <td class="oikea"><input type="text" name="puhelin" value="<% out.print(asiakas.getVastaus().getString("puh"));%>"/></td>
                    </tr>
                </table>
                <%
                    }
                }
                %>
                <input type='submit' value='Tallenna' name='nappi'/>
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