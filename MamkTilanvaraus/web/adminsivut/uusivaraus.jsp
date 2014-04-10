<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="apu2" class="tilanvaraus.oliot.Paivamaarat"/>
<jsp:useBean id="apu3" class="tilanvaraus.oliot.Tila"/>
<jsp:useBean id="apu4" class="tilanvaraus.oliot.Asiakas"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Uusi varaus</title>
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
                        apu.setTilaId(Integer.parseInt(request.getParameter("tilaid")));
                        apu.setAsiakasId(Integer.parseInt(request.getParameter("asiakasid")));
                        apu.setPvm(request.getParameter("pvm"));
                        apu.setAlkuaika(Integer.parseInt(request.getParameter("alkuaika")));
                        apu.setLoppuaika(Integer.parseInt(request.getParameter("loppuaika")));
                        apu.setHinta(Double.parseDouble(request.getParameter("hinta")));
                        apu.setMaksutilanne(Integer.parseInt(request.getParameter("maksutilanne")));
                        if (apu.lisaaVaraus()) {
                            response.sendRedirect("varaukset.jsp?lisatty");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }
                    %>
                    <form method='post' action='uusivaraus.jsp'>
                    <table class='tilataulu'>
                        <tr>
                            <td>Tila:</td>
                            <td>
                                <select name="tilaid">
                                    <%
                                    if(apu3.listaaTilat()){
                                        while (apu3.getVastaus().next()) {
                                            out.print("<option value='"+apu3.getVastaus().getString("id")+"'>"+apu3.getVastaus().getString("nimi")+"</option>");
                                        }
                                    }
                                    %>
                                </select>
                            <td>
                        </tr>
                        <tr>
                            <td>Asiakas:</td>
                            <td>
                                <select name="asiakasid">
                                    <%
                                    if(apu4.haeAsiakkaat()){
                                        while (apu4.getVastaus().next()) {
                                            out.print("<option value='"+apu4.getVastaus().getString("id")+"'>"+apu4.getVastaus().getString("etunimi")+" "+apu4.getVastaus().getString("sukunimi")+"</option>");
                                        }
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Päivämäärä:</td>
                            <td>
                                <input type="text" name="pvm"/>
                            <td>
                        </tr>
                        <tr>
                            <td>Alkuaika:</td>
                            <td>
                                <select name="alkuaika">
                                    <option value="8">8:00</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Loppuaika:</td>
                            <td>
                                <select name="loppuaika">
                                    <option value="9">9:00</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Hinta(€):</td>
                            <td>
                                <input type="text" value="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Maksutilanne:</td>
                            <td>
                                <select name="maksutilanne">
                                    <option value="1">Maksettu</option>
                                    <option value="0">Ei maksettu</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type='submit' value='Lisää uusi varaus' name='nappi'/></td>
                        </tr>
                    </table>
                    </form>
                    </div>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
    </body>
</html>
<% } %>