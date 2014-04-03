<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
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
                    <div id="kuvaus">
                    <%
                    request.setCharacterEncoding("UTF-8");
                    if (request.getParameter("nappi") != null) {
                        apu.setNimi(request.getParameter("nimi"));
                        apu.setTunnus(request.getParameter("tunnus"));
                        apu.setKuvaus(request.getParameter("editori"));
                        apu.setHinta(request.getParameter("hinta"));
                        apu.setHenkilomaara(request.getParameter("henkilomaara"));
                        if (apu.lisaaTila()) {
                            response.sendRedirect("tilat.jsp?lisatty");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }
                    %>
                    <form method='post' action='uusitila.jsp'>
                    <table class='tilataulu'>
                        <tr>
                            <td>Nimi:</td>
                            <td><input type='text' name='nimi' required='required'/><td>
                        </tr>
                        <tr>
                            <td>Tunnus:</td>
                            <td><input type='text' name='tunnus'/></td>
                        </tr>
                    </table>
                    <textarea cols='50' rows='15' id='editori' name='editori'></textarea>
                    <table class='tilataulu'>
                        <tr>
                            <td>Henkilömäärä:</td>
                            <td><input type='text' name='henkilomaara'/></td>
                        </tr>
                        <tr>
                            <td colspan='2'><input type='submit' value='Lisää uusi tila' name='nappi'/></td>
                        </tr>
                    </table>
                    </div>
                    <div id="kuvat_container">
                        <p>Kuvia tilasta</p>
                    </div>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
        <ckeditor:replace replace="editori" basePath="../ckeditor/" />
    </body>
</html>
<% } %>