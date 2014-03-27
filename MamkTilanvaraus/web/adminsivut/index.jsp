<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("./login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin index</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="../css/admin.css"/>
        
    </head>
    <body>
        <div id="header">
            <img src="../kuvat/ulkoasu/MAMK_logo_400.png" alt="logo" id="logo"/>
            <ul id="navi">
                <li id="eka"><a href="tilat.jsp">Tilat</a></li>
                <li><a href="tilat.jsp">Varaukset</a></li>
            </ul>
            <div id="uloskirjaus">
                Olet kirjautunut tunnuksella<br/>
                Ylläpitäjä<br/>
                <a href="../logout.jsp">Kirjaudu ulos</a>
            </div>
        </div>
        <div id="container">   
        <h1>Admin index</h1>
        </div>
    </body>
</html>
<% } %>
