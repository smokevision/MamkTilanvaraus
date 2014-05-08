<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="pvmpapu" class="tilanvaraus.oliot.Paivamaarat"/>
<jsp:useBean id="tila" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Varaus</title>
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
                    int tilaId;
                    int vuosi;
                    int kuukausi;
                    int paiva;
                    int varausId = Integer.parseInt(request.getParameter("id"));
                    varaus.setVarausId(varausId);
                    if (request.getParameter("nappi") != null) {
                        
                    }
                    %>
                    <form method='post' action='varaus.jsp?id=<% out.print(varausId); %>'>
                    <%
                    if(varaus.haeVaraus()){
                        while (varaus.getVastaus().next()){
                            tilaId = varaus.getVastaus().getInt("tilaId");
                            vuosi = pvmpapu.vuosiAikaleimasta(varaus.getVastaus().getLong("pvm"));
                            kuukausi = pvmpapu.kuukausiAikaleimasta(varaus.getVastaus().getLong("pvm"));
                            paiva = pvmpapu.paivaAikaleimasta(varaus.getVastaus().getLong("pvm"));
                    %>
                    <table class='varaustaulu'>
                            <tr>
                                <td class="vasen">Etunimi*:</td>
                                <td class="oikea"><input type="text" name="etunimi" value="<% out.print(varaus.getVastaus().getString("etunimi"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sukunimi*:</td>
                                <td class="oikea"><input type="text" name="sukunimi" value="<% out.print(varaus.getVastaus().getString("sukunimi"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Yritys:</td>
                                <td class="oikea"><input type="text" name="yritys" value="<% out.print(varaus.getVastaus().getString("yritys"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Y-tunnus:</td>
                                <td class="oikea"><input type="text" name="ytunnus" value="<% out.print(varaus.getVastaus().getString("yritys"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Katuosoite*:</td>
                                <td class="oikea"><input type="text" name="katuosoite" value="<% out.print(varaus.getVastaus().getString("katuosoite"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postinumero*:</td>
                                <td class="oikea"><input type="text" name="postinumero" value="<% out.print(varaus.getVastaus().getString("postinumero"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postitoimipaikka*:</td>
                                <td class="oikea"><input type="text" name="postitoimipaikka" value="<% out.print(varaus.getVastaus().getString("postitoimipaikka"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sähköposti*:</td>
                                <td class="oikea"><input type="text" name="email" value="<% out.print(varaus.getVastaus().getString("email"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Puhelin*:</td>
                                <td class="oikea"><input type="text" name="puh" value="<% out.print(varaus.getVastaus().getString("puh"));%>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Maksutapa*:</td>
                                <td class="oikea">
                                    <select name="maksutapa">
                                        <option value="verkkomaksu">Verkkomaksu</option>
                                        <option value="lasku">Lasku</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Tarjoilut:</td>
                                <td class="oikea">
                                    <input type="number" name="kahvi" value="0"/> Kahvi<br/>
                                    <input type="number" name="pulla" value="0"/> Pulla<br/>
                                    <input type="number" name="voileipa" value="0"/> Voileipä<br/>
                                    <input type="number" name="kakku" value="0"/> Kakku<br/>
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Hinta yhteensä:</td>
                                <td class="oikea"><input type="number" name="summa" value="<% out.print(varaus.getVastaus().getString("summa"));%>"/>€<br/>
                                Sisältää alv. 24%</td>
                            </tr>
                            <tr>
                                <td class="vasen">Maksutilanne:</td>
                                <td class="oikea">
                                    <select name="maksutilanne">
                                        <% 
                                        if(varaus.getVastaus().getInt("maksutilanne")==1){
                                            out.print("<option value='1'>Maksettu</option><option value='0'>Ei maksettu</option>");
                                        } else {
                                            out.print("<option value='0'>Ei maksettu</option><option value='1'>Maksettu</option>");
                                        }
                                        %>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="varaus_container">
                        <%
                        tila.setTilaId(tilaId);
                        if(tila.listaaTila()){
                            while (tila.getVastaus().next()) {
                                out.print("<h2>"+tila.getVastaus().getString("nimi")+"</h2>");
                            }
                        }
                        %>
                        <input type="hidden" name="tilaid" id="tilaid" value="<% out.print(tilaId); %>"/>
                        <div id="kalenteri_holder">
                        <jsp:include page="../includes/kalenteri.jsp" >
                            <jsp:param name="tilaid" value="<%=tilaId%>" />
                            <jsp:param name="vuosi" value="<%=vuosi%>" />
                            <jsp:param name="kuukausi" value="<%=kuukausi%>" />
                        </jsp:include>
                        </div>
                        <div id="varaus_kellonajat">
                        </div>
                        <span id="valitut_kellonajat">
                        <%
                        out.print("<input type='hidden' name='vuosi' id='vuosi' value='"+vuosi+"'/>");
                        out.print("<input type='hidden' name='kuukausi' id='kuukausi' value='"+kuukausi+"'/>");
                        out.print("<input type='hidden' name='paiva' id='paiva' value='"+paiva+"'/>");
                        if(varaus.haeVarauksenTunnit()){
                            while (varaus.getVastaus().next()){
                                out.print("<input type='hidden' name='valitutajat' class='valitutajat' value='"+varaus.getVastaus().getString("kello")+"'/>");
                            }
                        }
                        %>
                        </span>
                    </div>
                    </form>
                    <%
                        }
                    }
                    %>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
        <script>
            var varausid = <% out.print(varausId); %>;
            var tilaid = $("#tilaid").val();
            var vuosi = $("#vuosi").val();
            var kuukausi = $("#kuukausi").val();
            var paiva = $("#paiva").val();
            var tunnit = [];
            $(".valitutajat").each(function(){
                tunnit.push(parseInt($(this).val()));
            });
            $("#varaus_kellonajat").load("../includes/varauskello.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi, paiva: paiva, varaus: varausid}, function(){
                $("#selectable li").each(function(){
                    var nappi = $(this);
                    var kello = parseInt($(this).val());
                    if($.inArray(kello, tunnit) > -1){
                        nappi.addClass('ui-selected');
                    }
                });
                $("#selectable").bind("mousedown", function(e){
                                                            e.metaKey = true;
                                                        }).selectable({
                                                            filter: ".vapaa",
                                                            stop: function() {
                                                                $("#valitut_kellonajat").empty();
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='vuosi' value='"+vuosi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='kuukausi' value='"+kuukausi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='paiva' value='"+paiva+"'/>");
                                                                $(".ui-selected", this).each(function() {
                                                                    var index = $("#selectable li").index(this)+8;
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='valitutajat' class='valitutajat' value='"+index+"'/>");
                                                                });
                                                                
                                                            }
                                                        });
            
            });
            $(document).on("click",".edellinen, .seuraava",function(e){
            e.preventDefault();
            var arr = $(this).attr("value").split(',');
            var vuosi = arr[1];
            var kuukausi = arr[0];
            $("#kalenteri_holder").load("../includes/kalenteri.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi});
        });
        $(document).on("click",".paiva",function(e){
            $("#valitut_kellonajat").empty();
            var arr = $(this).attr("id").split('-');
            var vuosi = arr[1];
            var kuukausi = arr[2];
            var paiva = arr[3];
            $("#varaus_kellonajat").load("../includes/varauskello.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi, paiva: paiva, varaus: varausid}, function() {
                $("#selectable").bind("mousedown", function(e){
                                                            e.metaKey = true;
                                                        }).selectable({
                                                            filter: ".vapaa",
                                                            stop: function() {
                                                                $("#valitut_kellonajat").empty();
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='vuosi' value='"+vuosi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='kuukausi' value='"+kuukausi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='paiva' value='"+paiva+"'/>");
                                                                $(".ui-selected", this).each(function() {
                                                                    var index = $("#selectable li").index(this)+8;
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='valitutajat' value='"+index+"'/>");
                                                                });
                                                                
                                                            }
                                                        });
            });
        });
        </script>
    </body>
</html>
<% } %>