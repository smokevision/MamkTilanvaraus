<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="tila" class="tilanvaraus.oliot.Tila"/>
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
                        <span class="nykyinen">Varauksen tiedot >></span> Maksaminen/hyväksyminen >> Valmis
                    </div>
                    <div id="kuvaus">
                    <h1>Yhteystiedot</h1>
                        <table class='varaustaulu'>
                            <tr>
                                <td class="vasen">Etunimi*:</td>
                                <td class="oikea"><input type="text" name="etunimi"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sukunimi*:</td>
                                <td class="oikea"><input type="text" name="sukunimi"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Y-tunnus:</td>
                                <td class="oikea"><input type="text" name="etunimi"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Katuosoite*:</td>
                                <td class="oikea"><input type="text" name="katuosoite"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postinumero*:</td>
                                <td class="oikea"><input type="text" name="postinumero"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Postitoimipaikka*:</td>
                                <td class="oikea"><input type="text" name="postitoimipaikka"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Sähköposti*:</td>
                                <td class="oikea"><input type="text" name="email"/></td>
                            </tr>
                            <tr>
                                <td class="vasen">Puhelin*:</td>
                                <td class="oikea"><input type="text" name="puh"/></td>
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
                                <td class="oikea">200€<br/>
                                Sisältää alv. 24%</td>
                            </tr>
                        </table>
                    <p><input type="checkbox" name="varausehdot" required="required"/> Olen lukenut <a href="ehdot.jsp">varausehdot</a> ja hyväksyn ne</p> 
                    <a class="linkkinappi" href="tilat.jsp" alt="Peruuta">Peruuta</a> <input type='submit' value='Jatka varaamista' name='nappi'/> 
                    </div>
                    <div id="varaus_container">
                        <%
                        request.setCharacterEncoding("UTF-8");
                        int tilaId = Integer.parseInt(request.getParameter("tilaid"));
                        int vuosi = Integer.parseInt(request.getParameter("vuosi"));
                        int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
                        int paiva = Integer.parseInt(request.getParameter("paiva"));
                        tila.setTilaId(tilaId);
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