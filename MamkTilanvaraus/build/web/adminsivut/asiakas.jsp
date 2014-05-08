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
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Asiakas</title>
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
                    <%
                    request.setCharacterEncoding("UTF-8");
                    int id = Integer.parseInt(request.getParameter("id"));
                    apu.setAsiakasId(id);
                    if (request.getParameter("nappi") != null) {
                        apu.setEtunimi(request.getParameter("etunimi"));
                        apu.setSukunimi(request.getParameter("sukunimi"));
                        apu.setEmail(request.getParameter("email"));
                        apu.setPuh(request.getParameter("puh"));
                        apu.setYritys(request.getParameter("yritys"));
                        if (apu.paivitaAsiakas()) {
                            out.print("Asiakkaan tiedot päivitetty");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }

                    if(apu.haeAsiakas()){
                        while (apu.getVastaus().next()) {
                            %>
                            <form method='post' action='asiakas.jsp?id=<% out.print(apu.getVastaus().getString("id")); %>'>
                            <table class='tilataulu'>
                                <tr>
                                    <td>Etunimi:</td>
                                    <td><input type='text' name='etunimi' value="<% out.print(apu.getVastaus().getString("etunimi")); %>" required='required'/><td>
                                </tr>
                                <tr>
                                    <td>Sukunimi:</td>
                                    <td><input type='text' name='sukunimi' value="<% out.print(apu.getVastaus().getString("sukunimi")); %>" required='required'/></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type='text' name='email' value="<% out.print(apu.getVastaus().getString("email")); %>" required='required'/></td>
                                </tr>
                                <tr>
                                    <td>Puhelin:</td>
                                    <td><input type='text' name='puh' value="<% out.print(apu.getVastaus().getString("puh")); %>"/></td>
                                </tr>
                                <tr>
                                    <td>Yritys</td>
                                    <td><input type='text' name='yritys' value="<% out.print(apu.getVastaus().getString("yritys")); %>"/></td>
                                </tr>
                                <tr>
                                    <td colspan='2'><input type='submit' value='Päivitä asiakkaan tiedot' name='nappi'/></td>
                                </tr>
                            </table>
                            </form>
                            <%
                        }
                    }
                    %>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
    </body>
</html>
<% } %>