<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="apu2" class="tilanvaraus.oliot.Paivamaarat"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Varaukset</title>
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
                <h1>Varaukset</h1>
                <a href="uusivaraus.jsp">+Lisää uusi varaus</a>
                <table id="asiakaslista">
                    <tr>
                        <th>ID</th>
                        <th>Tila</th>
                        <th>Asiakas (ID)</th>
                        <th>Pvm</th>
                        <th>Kello</th>
                        <th>Hinta</th>
                        <th>Maksutilanne</th>
                    </tr>
                    <% 
                    if(apu.haeVaraukset()){
                        while (apu.getVastaus().next()) {
                            String linkki = "varaus.jsp?id="+apu.getVastaus().getString("id");
                            String aikaleima = apu.getVastaus().getString("pvm");
                            String pvm = apu2.muunnaAikaleima(aikaleima);
                            String maksutilanne = (Integer.parseInt(apu.getVastaus().getString("maksutilanne")) == 1) ? "Maksettu" : "Ei maksettu";
                            out.print("<tr><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("id")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("nimi")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("etunimi")+" "+apu.getVastaus().getString("sukunimi")+" ("+apu.getVastaus().getString("asiakasId")+")</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+pvm+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("alkuAika")+"-"+apu.getVastaus().getString("loppuAika")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("hinta")+"€</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+maksutilanne+"</a></td></tr>");
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