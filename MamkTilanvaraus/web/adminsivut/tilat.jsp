<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Etusivu</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="../css/main.css"/>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="../includes/adminheader.jsp" %>
                <div id="palsta">
                <h1>Tilat</h1>
                <p>
                    Kasarmin kampuksen tilat tarjoavat ainutlaatuiset puitteet niin intiimeille kokouksille, räätälöidyille yritystapahtumille kuin suuremmille seminaaritapahtumillekin. Uusi Ravintola DeXin tapahtumastage, DeXi-stage, antaa mahdollisuudet lasten tapahtumista live-konsertteihin.
                </p>
                <table id="tilalista">
                    <tr>
                        <td colspan='2'><a href="uusitila.jsp">+Lisää uusi</a></td>
                    </tr>
                    <% 
                    if(apu.listaaTilat()){
                        while (apu.getVastaus().next()) {
                            out.print("<tr><td>");
                            out.print("<a href='tila.jsp?id="+apu.getVastaus().getString("id")+"'>"+apu.getVastaus().getString("nimi")+"</a></td><td>");
                            out.print(apu.getVastaus().getString("henkilomaara")+" hengelle</td></tr>");
                        }
                    }
                    %>
                </table>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
    </body>
</html>
<% } %>