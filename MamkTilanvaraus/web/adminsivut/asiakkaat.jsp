<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Asiakas"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Asiakkaat</title>
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
                <h1>Asiakkaat</h1>
                <a href="uusiasiakas.jsp">+Lisää uusi</a>
                <table id="asiakaslista">
                    <tr>
                        <th>ID</th>
                        <th>Etunimi</th>
                        <th>Sukunimi</th>
                        <th>Email</th>
                        <th>Puhelin</th>
                        <th>Yritys</th>
                    </tr>
                    <% 
                    if(apu.haeAsiakkaat()){
                        while (apu.getVastaus().next()) {
                            String linkki = "asiakas.jsp?id="+apu.getVastaus().getString("id");
                            out.print("<tr><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("id")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("etunimi")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("sukunimi")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("email")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("puh")+"</a></td><td>");
                            out.print("<a href='"+linkki+"'>"+apu.getVastaus().getString("yritys")+"</a></td></tr>");
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