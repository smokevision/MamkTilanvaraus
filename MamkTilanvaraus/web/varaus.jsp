<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" scope="session" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="tila" scope="session" class="tilanvaraus.oliot.Tila"/>
<jsp:useBean id="asiakas" scope="session" class="tilanvaraus.oliot.Asiakas"/>
<jsp:useBean id="palvelu" scope="session" class="tilanvaraus.oliot.Palvelu"/>
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
                    <form method='POST' action='maksaminen.jsp'>
                    <div id="varaus_vaiheet">
                        <span class="nykyinen">Varauksen tiedot >></span> Yhteenveto/maksaminen >> Valmis
                    </div>
                    <div id="kuvaus">
                    <%
                    request.setCharacterEncoding("UTF-8");
                    String etunimi = "";
                    String sukunimi = "";
                    String yritys = "";
                    String ytunnus = "";
                    String katuosoite = "";
                    String postinumero = "";
                    String postitoimipaikka = "";
                    String email = "";
                    String puhelin = "";
                    if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus") == "logged" && session.getAttribute("loginUserId") != null) {
                        int userId = (Integer) session.getAttribute("loginUserId");
                        asiakas.setAsiakasId(userId);
                        if(asiakas.haeAsiakas()){
                            while (asiakas.getVastaus().next()){
                                etunimi = asiakas.getVastaus().getString("etunimi");
                                sukunimi = asiakas.getVastaus().getString("sukunimi");
                                yritys = asiakas.getVastaus().getString("yritys");
                                ytunnus = asiakas.getVastaus().getString("ytunnus");
                                katuosoite = asiakas.getVastaus().getString("katuosoite");
                                postinumero = asiakas.getVastaus().getString("postinumero");
                                postitoimipaikka = asiakas.getVastaus().getString("postitoimipaikka");
                                email = asiakas.getVastaus().getString("email");
                                puhelin = asiakas.getVastaus().getString("puh");
                            }
                        }
                    }
                    %>
                    <h1>Yhteystiedot ja palvelut</h1>
                        <table class='varaustaulu'>
                            <tr>
                                <td class="vasen">Etunimi*:</td>
                                <td class="oikea"><input type="text" name="etunimi" value="<% out.print(etunimi); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sukunimi*:</td>
                                <td class="oikea"><input type="text" name="sukunimi" value="<% out.print(sukunimi); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Yritys:</td>
                                <td class="oikea"><input type="text" name="yritys" value="<% out.print(yritys); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Y-tunnus:</td>
                                <td class="oikea"><input type="text" name="ytunnus" value="<% out.print(ytunnus); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Katuosoite*:</td>
                                <td class="oikea"><input type="text" name="katuosoite" value="<% out.print(katuosoite); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postinumero*:</td>
                                <td class="oikea"><input type="text" name="postinumero" value="<% out.print(postinumero); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postitoimipaikka*:</td>
                                <td class="oikea"><input type="text" name="postitoimipaikka" value="<% out.print(postitoimipaikka); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sähköposti*:</td>
                                <td class="oikea"><input type="text" name="email" value="<% out.print(email); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Puhelin*:</td>
                                <td class="oikea"><input type="text" name="puhelin" value="<% out.print(puhelin); %>"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Maksutapa*:</td>
                                <td class="oikea">
                                    <select name="maksutapa">
                                        <option value="Verkkomaksu">Verkkomaksu</option>
                                        <option value="Lasku">Lasku</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Tarjoilut:</td>
                                <td class="oikea">
                                    <%
                                    if(palvelu.listaaPalvelut()){
                                        while (palvelu.getVastaus().next()){
                                            out.print("<input type='number' name='"+palvelu.getVastaus().getString("nimi")+"' value='0' min='0'/> "+palvelu.getVastaus().getString("nimi")+"<br/>");
                                        }
                                    }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td class="vasen">Hinta yhteensä:</td>
                                <td class="oikea">
                                    <span id="hinta"></span>
                                    <br/>Sisältää alv. 24%
                                </td>
                            </tr>
                        </table>
                            <p><input type="checkbox" name="varausehdot" required="required"/> Olen lukenut <a href="ehdot.jsp" target="_blank">varausehdot</a> ja hyväksyn ne</p> 
                    <a class="linkkinappi" href="tilat.jsp">Peruuta</a> <input type='submit' value='Jatka varaamista' name='nappi'/> 
                    </div>
                    <div id="varaus_container">
                        <%
                        request.setCharacterEncoding("UTF-8");
                        int tilaId = Integer.parseInt(request.getParameter("tilaid"));
                        int vuosi = Integer.parseInt(request.getParameter("vuosi"));
                        int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
                        int paiva = Integer.parseInt(request.getParameter("paiva"));
                        tila.setTilaId(tilaId);
                        varaus.setTilaId(tilaId);
                        out.print("<input type='hidden' name='tilaId' value='"+tilaId+"'>");
                        if(tila.listaaTila()){
                            while (tila.getVastaus().next()) {
                                out.print("<h2>"+tila.getVastaus().getString("nimi")+"</h2>");
                            }
                        }
                        %>
                        <input type="hidden" name="tilaid" id="tilaid" value="<% out.print(tilaId); %>"/>
                        <div id="kalenteri_holder">
                        <jsp:include page="includes/kalenteri.jsp" >
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
                        String valitutAjat[] = request.getParameterValues("valitutajat");
                        for(int i=0;i<valitutAjat.length;i++){ 
                            out.print("<input type='hidden' name='valitutajat' class='valitutajat' value='"+valitutAjat[i]+"'/>");
                        }
                        %>
                        </span>
                    </div>
                    </form>
                    <div style='clear:both;'></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
            var tilaid = $("#tilaid").val();
            var vuosi = $("#vuosi").val();
            var kuukausi = $("#kuukausi").val();
            var paiva = $("#paiva").val();
            var tunnit = [];
            $(".valitutajat").each(function(){
                tunnit.push(parseInt($(this).val()));
            });
            $("#hinta").load("includes/hintalaskuri.jsp",{vuosi: vuosi, kuukausi: kuukausi, paiva: paiva, valitutajat : tunnit});
            $("#varaus_kellonajat").load("includes/varauskello.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi, paiva: paiva}, function(){
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
                                                                tunnit = [];
                                                                $(".ui-selected", this).each(function() {
                                                                    var index = $("#selectable li").index(this)+8;
                                                                    tunnit.push(parseInt(index));
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='valitutajat' class='valitutajat' value='"+index+"'/>");
                                                                });
                                                                $("#hinta").load("includes/hintalaskuri.jsp",{vuosi: vuosi, kuukausi: kuukausi, paiva: paiva, valitutajat : tunnit});
                                                            }
                                                        });
            
            });
            $(document).on("click",".edellinen, .seuraava",function(e){
                e.preventDefault();
                var arr = $(this).attr("value").split(',');
                var vuosi = arr[1];
                var kuukausi = arr[0];
                $("#kalenteri_holder").load("includes/kalenteri.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi});
            });
            $(document).on("click",".paiva",function(e){
                $("#valitut_kellonajat").empty();
                var arr = $(this).attr("id").split('-');
                var vuosi = arr[1];
                var kuukausi = arr[2];
                var paiva = arr[3];
                $("#varaus_kellonajat").load("includes/varauskello.jsp", {tilaid: tilaid, vuosi: vuosi, kuukausi: kuukausi, paiva: paiva}, function() {
                    $("#selectable").bind("mousedown", function(e){
                                                                e.metaKey = true;
                                                            }).selectable({
                                                                filter: ".vapaa",
                                                                stop: function() {
                                                                    $("#valitut_kellonajat").empty();
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='vuosi' value='"+vuosi+"'/>");
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='kuukausi' value='"+kuukausi+"'/>");
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='paiva' value='"+paiva+"'/>");
                                                                    tunnit = [];
                                                                    $(".ui-selected", this).each(function() {
                                                                        var index = $("#selectable li").index(this)+8;
                                                                        tunnit.push(parseInt(index));
                                                                        $("#valitut_kellonajat").append("<input type='hidden' name='valitutajat' value='"+index+"'/>");
                                                                    });
                                                                    $("#hinta").load("includes/hintalaskuri.jsp",{vuosi: vuosi, kuukausi: kuukausi, paiva: paiva, valitutajat : tunnit});
                                                                }
                                                            });
                });
            });
        </script>
    </body>
</html>
