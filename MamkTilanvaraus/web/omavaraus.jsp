<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="asiakas" class="tilanvaraus.oliot.Asiakas"/>
<jsp:useBean id="varaus" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="pvmpapu" class="tilanvaraus.oliot.Paivamaarat"/>
<jsp:useBean id="tila" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Oma Varaus</title>
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
                <div id="banneri"></div>
                <div id="palsta">
                <h1>Varauksen tiedot</h1>
                <div id="maksaminen_yhteystiedot">
                <h3>Yhteystiedot</h3>
                <%
                request.setCharacterEncoding("UTF-8");
                int id = Integer.parseInt(request.getParameter("id"));
                varaus.setVarausId(id);
                if(varaus.haeVaraus()){
                    while (varaus.getVastaus().next()){
                    %>    
                    <table class="maksaminen_yhteenvetotaulu">
                        <tr>
                            <td class="vasen">Nimi:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("etunimi") + " " + varaus.getVastaus().getString("sukunimi")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Yritys:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("yritys")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Y-tunnus:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("ytunnus")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Katuosoite:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("katuosoite")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Postinumero:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("postinumero")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Postitoimipaikka:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("postitoimipaikka")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Sähköposti:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("email")); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Puhelin:</td>
                            <td class="oikea"><% out.print(varaus.getVastaus().getString("puh")); %></td>
                        </tr>
                    </table>
                </div>
                <div id="maksaminen_varaus">
                    
                    <%
                    String maksutapa = varaus.getVastaus().getString("maksutapa");
                    String summa = varaus.getVastaus().getString("summa")+"€";
                    %>        
                    <h3>Yhteenveto</h3>
                    <table class="maksaminen_yhteenvetotaulu">
                        <tr>
                            <td class="vasen">Tila:</td>
                            <td class="oikea">
                                <%
                                tila.setTilaId(varaus.getVastaus().getInt("tilaId"));
                                if(tila.listaaTila()){
                                    while(tila.getVastaus().next()){
                                        out.print(tila.getVastaus().getString("nimi"));
                                    }
                                }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td class="vasen">Päivä:</td>
                            <td class="oikea"><% out.print(pvmpapu.muunnaAikaleima(varaus.getVastaus().getLong("pvm"))); %></td>
                        </tr>
                        <tr>
                            <td class="vasen">Tunnit:</td>
                            <td class="oikea">
                                <%
                                if(varaus.haeVarauksenTunnit()){
                                    while(varaus.getVastaus().next()){
                                        out.print(varaus.getVastaus().getInt("kello") + "-" + (varaus.getVastaus().getInt("kello")+1) + "<br/>");
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
                            <td class="oikea"><b><% out.print(summa); %></b></td>
                        </tr>
                    </table>
                </div>
                    <%    
                    }
                }
                %>
                <div style='clear:both;'></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
<%
}
%>