<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="asiakas" class="tilanvaraus.oliot.Asiakas"/>
<jsp:useBean id="varaus" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="pvmpapu" class="tilanvaraus.oliot.Paivamaarat"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Oma tili</title>
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
                <h1>Oma tili</h1>
                <%
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("rekisteroity") != null) {
                    out.print("<p>Tunnuksesi luonti onnistui! Olemme lähettäneet sähköpostiinne vahvistuksen.</p><p>Tällä sivulla voit tarkastaa ja muokata omia tietojasi, sekä nähdä varaushistoriasi.</p>");
                } else if (request.getParameter("paivitetty") != null) {
                    out.print("<p>Asiakastiedot päivitetty.</p>");
                }
                %>
                <h3>Omat tiedot</h3>
                <%
                    int userId = (Integer) session.getAttribute("loginUserId");
                    asiakas.setAsiakasId(userId);
                    if(asiakas.haeAsiakas()){
                        while (asiakas.getVastaus().next()){
                        %>
                        <table class='omatilitaulu'>
                            <tr>
                                <td class="vasen">Etunimi:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("etunimi"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sukunimi:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("sukunimi"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Yritys:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("yritys"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Y-tunnus:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("ytunnus"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Katuosoite:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("katuosoite"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postinumero:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("postinumero"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postitoimipaikka:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("postitoimipaikka"));%></td>
                            </tr>
                            <tr>
                                <td class="vasen">Puhelin:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("puh"));%></td>
                            </tr>
                            <tr>
                                <td colspan="2"><a href="muokkaatietoja.jsp">Muokkaa tietoja</a></td>
                            </tr>
                        </table>
                        <h3>Sähköposti</h3>
                        <table class='omatilitaulu'> 
                            <tr>
                                <td class="vasen">Sähköposti:</td>
                                <td class="oikea"><% out.print(asiakas.getVastaus().getString("email"));%></td>
                            </tr>
                            <tr>
                                <td colspan="2"><a href="vaihdasalasana.jsp">Vaihda salasana</a></td>
                            </tr>
                        </table>
                        <%
                        }
                    }
                %>
                
                <h2>Varaushistoria</h2>
                
                <%
                varaus.setAsiakasId(userId);    
                if(varaus.haeAsiakkaanVaraukset()){
                    if (varaus.getVastaus().next()){
                        
                %>
                <table id="asiakaslista">
                    <tr class="eka">
                        <th>Varausnumero</th>
                        <th>Tila</th>
                        <th>Pvm</th>
                        <th>Hinta</th>
                        <th>Maksutapa</th>
                        <th>Maksutilanne</th>
                    </tr>
                        <%
                        while (varaus.getVastaus().next()){
                        String linkki = "omavaraus.jsp?id="+varaus.getVastaus().getString("id");
                        long aikaleima = varaus.getVastaus().getLong("pvm");
                        String pvm = pvmpapu.muunnaAikaleima(aikaleima);
                        String maksutilanne = (Integer.parseInt(varaus.getVastaus().getString("maksutilanne")) == 1) ? "Maksettu" : "Ei maksettu";
                        out.print("<tr>");
                        out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("id")+"</a></td>");
                        out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("nimi")+"</a></td>");
                        out.print("<td><a href='"+linkki+"'>"+pvm+"</a></td>");
                        out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("summa")+"€</a></td>");
                        out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("maksutapa")+"</a></td>");
                        out.print("<td><a href='"+linkki+"'>"+maksutilanne+"</a></td>");
                        out.print("</tr>");
                        }
                    } else {
                        out.print("<p>Ei aikaisempia varauksia</p>");
                    }
                }
                %>
                </table>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
<%
}
%>