<jsp:useBean id="loginasiakas" class="tilanvaraus.oliot.Asiakas"/>
<div id="header">
    <a href="index.jsp"><img src="kuvat/ulkoasu/MAMK_logo_400.png" alt="logo" id="logo"/></a>
    <ul id="navi">
        <li id="eka"><a href="index.jsp">Etusivu</a></li>
        <li><a href="tilat.jsp">Tilat</a></li>
        <li><a href="yhteys.jsp">Yhteys</a></li>
        <%
        if (session.getAttribute("loginStatus") == "logged") {
        %>
        <li><a href="omatili.jsp">Oma tili</a></li>
        <%
        }
        %>
    </ul>
    <div id="headerlogin">
    <%
    if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus") == "logged") {
    int userId = (Integer) session.getAttribute("loginUserId");
    loginasiakas.setAsiakasId(userId);
    if(loginasiakas.haeAsiakas()){
        while (loginasiakas.getVastaus().next()){
            out.print("Hei, "+loginasiakas.getVastaus().getString("etunimi")+" "+loginasiakas.getVastaus().getString("sukunimi")+"<br/>");
        }
    }
    %>
    <a href="logout.jsp" id="logoutlink">Kirjaudu ulos <img src="kuvat/ulkoasu/logout.png" alt="Kirjaudu ulos"/></a>
    <%
    } else {
    %>
    <a href="#" id="loginlink">Kirjaudu sis��n <img src="kuvat/ulkoasu/login.png" alt="Kirjaudu"/></a>
    <div id="kirjautuminen">
        <a title="Sulje" id="loginsulje" href="javascript:;"></a>
        <h2>Kirjaudu sis��n</h2>
        <form method="post" action="login.jsp">
            <table id="logintable">
                <tr>
                    <td class="vasen">Tunnus</td>
                    <td class="oikea"><input type="text" name="tunnus" /></td>
                </tr>
                <tr>
                    <td class="vasen">Salasana</td>
                    <td class="oikea"><input type="password" name="salasana" /></td>
                </tr>
                <tr>
                    <td class="vasen"><input type="submit" name="nappi" value="Kirjaudu"/></td>
                    <td class="oikea"><a href="login.jsp">Unohtuiko salasana?</a></td>
                </tr>
            </table>
        </form>
        <h2>Ei tunnuksia?</h2>
        <a href="rekisteroityminen.jsp">Rekister�idy</a>
        
    </div>
    <%
    }
    %>
    </div>
</div>