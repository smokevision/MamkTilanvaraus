<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" scope="session" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="tila" scope="session" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Varaaminen</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="includes/header.jsp" %>
                <div id="palsta">
                    <form method='POST' action='vahvistus.jsp'>
                    <div id="varaus_vaiheet">
                        Varauksen tiedot >> <span class="nykyinen">Yhteenveto/maksaminen >></span> Valmis
                    </div>
                    <h1>Tarkista tiedot</h1>
                    <p>Tarkista että tiedot ovat oikein. Mikäli tiedoissa on korjattavaa, palaa edelliselle sivulle.</p>
                    <%
                    request.setCharacterEncoding("UTF-8");
                    int tilaId = Integer.parseInt(request.getParameter("tilaId"));
                    String tilanNimi = "";
                    tila.setTilaId(tilaId);
                    varaus.setTilaId(tilaId);
                    if(tila.listaaTila()){
                        while (tila.getVastaus().next()) {
                            tilanNimi = tila.getVastaus().getString("nimi");
                        }
                    }
                    int vuosi = Integer.parseInt(request.getParameter("vuosi"));
                    int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
                    int paiva = Integer.parseInt(request.getParameter("paiva"));
                    String[] valitutAjat = request.getParameterValues("valitutajat");
                    int userId = 0;
                    if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus") == "logged" && session.getAttribute("loginUserId") != null) {
                        userId = (Integer) session.getAttribute("loginUserId");
                    }
                    String etunimi = request.getParameter("etunimi");
                    String sukunimi = request.getParameter("sukunimi");
                    String yritys = request.getParameter("yritys");
                    String ytunnus = request.getParameter("ytunnus");
                    String katuosoite = request.getParameter("katuosoite");
                    String postinumero = request.getParameter("postinumero");
                    String postitoimipaikka = request.getParameter("postitoimipaikka");
                    String email = request.getParameter("email");
                    String puhelin = request.getParameter("puhelin");
                    String maksutapa = request.getParameter("maksutapa");
                    int kahvi = Integer.parseInt(request.getParameter("kahvi"));
                    int pulla = Integer.parseInt(request.getParameter("pulla"));
                    int voileipa = Integer.parseInt(request.getParameter("voileipa"));
                    int kakku = Integer.parseInt(request.getParameter("kakku"));
                    Double hinta = 0.0;
                    hinta = varaus.laskeVarauksenHinta(valitutAjat, vuosi, kuukausi, paiva);

                    session.setAttribute("userId", userId);
                    session.setAttribute("sukunimi", sukunimi);
                    session.setAttribute("sukunimi", sukunimi);
                    session.setAttribute("yritys", yritys);
                    session.setAttribute("ytunnus", ytunnus);
                    session.setAttribute("katuosoite", katuosoite);
                    session.setAttribute("postinumero", postinumero);
                    session.setAttribute("postitoimipaikka", postitoimipaikka);
                    session.setAttribute("email", email);
                    session.setAttribute("kahvi", kahvi);
                    session.setAttribute("pulla", pulla);
                    session.setAttribute("voileipa", voileipa);
                    session.setAttribute("kakku", kakku);
                    session.setAttribute("hinta", hinta);
                    session.setAttribute("maksutapa",maksutapa);
                    session.setAttribute("tilaId", tilaId);
                    session.setAttribute("vuosi", vuosi);
                    session.setAttribute("kuukausi", kuukausi);
                    session.setAttribute("paiva", paiva);
                    session.setAttribute("valitutAjat", valitutAjat);
                    if(maksutapa.equals("Lasku")){
                        session.setAttribute("maksutilanne", 0);
                    } else {
                        session.setAttribute("maksutilanne", 1);
                    }

                    %>
                    <div id="maksaminen_yhteystiedot">
                        <h3>Yhteystiedot</h3>
                        <table class="maksaminen_yhteenvetotaulu">
                            <tr>
                                <td class="vasen">Nimi:</td>
                                <td class="oikea"><% out.print(etunimi+" "+sukunimi); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Yritys:</td>
                                <td class="oikea"><% out.print(yritys); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Y-tunnus:</td>
                                <td class="oikea"><% out.print(ytunnus); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Katuosoite:</td>
                                <td class="oikea"><% out.print(katuosoite); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postinumero:</td>
                                <td class="oikea"><% out.print(postinumero); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postitoimipaikka:</td>
                                <td class="oikea"><% out.print(postitoimipaikka); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sähköposti:</td>
                                <td class="oikea"><% out.print(email); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Puhelin:</td>
                                <td class="oikea"><% out.print(puhelin); %></td>
                            </tr>
                        </table>
                    </div>
                    <div id="maksaminen_varaus">
                        <h3>Yhteenveto</h3>
                        <table class="maksaminen_yhteenvetotaulu">
                            <tr>
                                <td class="vasen">Tila:</td>
                                <td class="oikea"><% out.print(tilanNimi); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Päivä:</td>
                                <td class="oikea"><% out.print(paiva+"."+kuukausi+"."+vuosi); %></td>
                            </tr>
                            <tr>
                                <td class="vasen">Tunnit:</td>
                                <td class="oikea">
                                <% for(int i=0;i<valitutAjat.length;i++){
                                    int loppuaika = Integer.parseInt(valitutAjat[i])+1;
                                    out.print(valitutAjat[i]+":00-"+loppuaika+":00<br/>");
                                }%>
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Tarjoilut:</td>
                                <td class="oikea">
                                <%
                                if(kahvi == 0 && pulla == 0 && voileipa == 0 && kakku == 0){
                                    out.print("Ei tarjoiluja");
                                } else {
                                    if (kahvi>0){
                                        out.print("Kahvi "+kahvi+" kpl<br/>");
                                    } if (pulla>0){
                                        out.print("Pulla "+pulla+" kpl<br/>");
                                    } if (voileipa>0){
                                        out.print("Voileipä "+voileipa+" kpl<br/>");
                                    } if (kakku>0){
                                        out.print("Kakku "+kakku+" kpl");
                                    } 
                                }
                                %>    
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Maksutapa:</td>
                                <td class="oikea"><% out.print(maksutapa); %></td>
                            </tr>
                            <tr>
                                <td class="vasen"><b>Kokonaishinta:</b></td>
                                <td class="oikea"><b><% out.print(hinta+"€"); %></b></td>
                            </tr>
                        </table>
                    </div>
                    <%                    
                    if(maksutapa.equals("Verkkomaksu")){
                    %>
                    <h1>Maksaminen</h1>
                    <p>Siirry maksamaan valitsemalla pankki:</p>
                    <div id="pankit">
                        <input type="submit" class="pankki" id="nordea" value="Nordea"/>
                        <input type="submit" class="pankki" id="op" value="Osuus-Pankki"/>
                        <input type="submit" class="pankki" id="danske" value="Danske Bank"/>
                        <input type="submit" class="pankki" id="aktia" value="Aktia"/>
                        <input type="submit" class="pankki" id="alandsbanken" value="Ålandsbanken"/>
                        <input type="submit" class="pankki" id="spankki" value="S-pankki"/>
                        <input type="submit" class="pankki" id="handelsbanken" value="Handelsbanken"/>
                    </div>
                    <%
                    } else if(maksutapa.equals("Lasku")){
                        out.print("<input type='submit' value='Vahvista varaus'/>");
                    }    
                    %>
                    </form>
                    <div style='clear:both;'></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
        </script>
    </body>
</html>
