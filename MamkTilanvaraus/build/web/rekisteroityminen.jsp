<%
if (session.getAttribute("loginStatus") == "logged") {
        response.sendRedirect("omatili.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="asiakas" class="tilanvaraus.oliot.Asiakas"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Rekisteröityminen</title>
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
                <h1>Rekisteröityminen</h1>
                <%
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("nappi") != null) {
                    if (request.getParameter("salasana").equals(request.getParameter("salasana2"))){
                        asiakas.setEtunimi(request.getParameter("etunimi"));
                        asiakas.setSukunimi(request.getParameter("sukunimi"));
                        asiakas.setKatuosoite(request.getParameter("katuosoite"));
                        asiakas.setPostinumero(request.getParameter("postinumero"));
                        asiakas.setPostitoimipaikka(request.getParameter("postitoimipaikka"));
                        asiakas.setYritys(request.getParameter("yritys"));
                        asiakas.setYtunnus(request.getParameter("ytunnus"));
                        asiakas.setEmail(request.getParameter("email"));
                        asiakas.setPuh(request.getParameter("puhelin"));
                        asiakas.setSalasana(request.getParameter("salasana"));

                        if (asiakas.lisaaAsiakas()) {
                            response.sendRedirect("omatili.jsp?rekisteroity");
                        } else {
                            out.print("<p>Pahoittelut, järjestelmässä tapahtui virhe!</p>");
                        }
                        
                    } else {
                        out.print("<p>Salasanat eivät täsmää!</p>");
                    }
                }
                %>
                <form method="POST" action="rekisteroityminen.jsp">
                <table class='varaustaulu'>
                    <tr>
                        <td class="vasen">Etunimi*:</td>
                        <td class="oikea"><input type="text" name="etunimi" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Sukunimi*:</td>
                        <td class="oikea"><input type="text" name="sukunimi" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Yritys:</td>
                        <td class="oikea"><input type="text" name="yritys" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Y-tunnus:</td>
                        <td class="oikea"><input type="text" name="ytunnus" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Katuosoite*:</td>
                        <td class="oikea"><input type="text" name="katuosoite" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Postinumero*:</td>
                        <td class="oikea"><input type="text" name="postinumero" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Postitoimipaikka*:</td>
                        <td class="oikea"><input type="text" name="postitoimipaikka" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Puhelin*:</td>
                        <td class="oikea"><input type="text" name="puhelin" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Sähköposti*:</td>
                        <td class="oikea"><input type="text" name="email" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Salasana*:</td>
                        <td class="oikea"><input type="password" name="salasana" value=""/></td>
                    </tr>
                    <tr>
                        <td class="vasen">Salasana uudelleen*:</td>
                        <td class="oikea"><input type="password" name="salasana2" value=""/></td>
                    </tr>
                </table>
                <p><input type="checkbox" name="ehdot" required="required"/> Olen lukenut <a href="kayttoehdot.jsp" target="_blank">käyttöehdot</a> ja hyväksyn ne</p> 
                <input type='submit' value='Rekisteröidy' name='nappi'/>
                </form>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
