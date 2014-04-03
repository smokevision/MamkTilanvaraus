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
                    int id = Integer.parseInt(request.getParameter("id"));
                    apu.setTilaId(id);
                    if (request.getParameter("nappi") != null) {
                        apu.setNimi(request.getParameter("nimi"));
                        apu.setTunnus(request.getParameter("tunnus"));
                        apu.setKuvaus(request.getParameter("editori"));
                        apu.setHinta(request.getParameter("hinta"));
                        apu.setHenkilomaara(request.getParameter("henkilomaara"));
                        if (apu.paivitaTila()) {
                            out.print("Tilan tiedot päivitetty");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }

                    if(apu.listaaTila()){
                        while (apu.getVastaus().next()) {
                            out.print("<form method='post' action='tila.jsp?id="+apu.getVastaus().getString("id")+"'>");
                            out.print("<table class='tilataulu'><tr><td>Nimi:</td><td><input type='text' name='nimi' required='required' value='"+apu.getVastaus().getString("nimi")+"'/><td></tr>");
                            out.print("<tr><td>Tunnus:</td><td><input type='text' name='tunnus' value='"+apu.getVastaus().getString("tunnus")+"'/></td></tr></table>");
                            out.print("<textarea cols='50' rows='15' id='editori' name='editori'>"+apu.getVastaus().getString("kuvaus")+"</textarea><br/>");
                            out.print("<table class='tilataulu'><tr><td>Henkilömäärä:</td><td><input type='text' name='henkilomaara' value='"+apu.getVastaus().getString("henkilomaara")+"'/></td></tr>");
                            out.print("<tr><td><input type='submit' value='Tallenna' name='nappi'/></td></tr></table></form>");
                        }
                    }
                    %>
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