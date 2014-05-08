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
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Uusi asiakas</title>
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
                    <h1>Lisää uusi asiakas</h1>
                    <%
                    request.setCharacterEncoding("UTF-8");
                    if (request.getParameter("nappi") != null) {
                        apu.setEtunimi(request.getParameter("etunimi"));
                        apu.setSukunimi(request.getParameter("sukunimi"));
                        apu.setEmail(request.getParameter("email"));
                        apu.setPuh(request.getParameter("puh"));
                        apu.setYritys(request.getParameter("yritys"));
                        apu.setSalasana(request.getParameter("salasana"));
                        if (apu.lisaaAsiakas()) {
                            response.sendRedirect("asiakkaat.jsp");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }
                    %>
                    <form method='post' action='uusiasiakas.jsp'>
                    <table class='tilataulu'>
                        <tr>
                            <td>Etunimi:</td>
                            <td><input type='text' name='etunimi' required='required'/><td>
                        </tr>
                        <tr>
                            <td>Sukunimi:</td>
                            <td><input type='text' name='sukunimi' required='required'/></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type='text' name='email' required='required'/></td>
                        </tr>
                        <tr>
                            <td>Puhelin:</td>
                            <td><input type='text' name='puh'/></td>
                        </tr>
                        <tr>
                            <td>Yritys</td>
                            <td><input type='text' name='yritys'/></td>
                        </tr>
                        <tr>
                            <td>Y-tunnus</td>
                            <td><input type='text' name='yritys'/></td>
                        </tr>
                        <tr>
                            <td>Salasana:</td>
                            <td><input type='text' name='salasana' required='required'/></td>
                        </tr>
                        <tr>
                            <td colspan='2'><input type='submit' value='Lisää uusi asiakas' name='nappi'/></td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
    </body>
</html>
<% } %>