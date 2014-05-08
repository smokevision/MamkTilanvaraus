<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="pvmpapu" class="tilanvaraus.oliot.Paivamaarat"/>
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
                        <th>Hinta</th>
                        <th>Maksutilanne</th>
                        <th>Maksutapa</th>
                    </tr>
                    <% 
                    if(varaus.haeVaraukset()){
                        while (varaus.getVastaus().next()) {
                            String linkki = "varaus.jsp?id="+varaus.getVastaus().getString("id");
                            long aikaleima = varaus.getVastaus().getLong("pvm");
                            String pvm = pvmpapu.muunnaAikaleima(aikaleima);
                            String maksutilanne = (Integer.parseInt(varaus.getVastaus().getString("maksutilanne")) == 1) ? "Maksettu" : "Ei maksettu";
                            out.print("<tr>");
                            out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("id")+"</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("nimi")+"</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("etunimi")+" "+varaus.getVastaus().getString("sukunimi")+" ("+varaus.getVastaus().getString("asiakasId")+")</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+pvm+"</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("summa")+"€</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+maksutilanne+"</a></td>");
                            out.print("<td><a href='"+linkki+"'>"+varaus.getVastaus().getString("maksutapa")+"</a></td>");
                            out.print("</tr>");
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