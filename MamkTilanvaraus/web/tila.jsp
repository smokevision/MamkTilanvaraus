<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" scope="session" class="tilanvaraus.oliot.Tila"/>
<jsp:useBean id="kuva" scope="session" class="tilanvaraus.oliot.Kuva"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Tila</title>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans' type='text/css'/>
        <link rel="stylesheet" href="css/jquery.simplyscroll.css" media="all" type="text/css">
        <link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/main.css" type="text/css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/sly.min.js"></script>
        <script src="js/jquery.fancybox.js?v=2.1.5"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="includes/header.jsp" %>
                <div id="banneri"></div>
                <div id="palsta">
                    <div id="kuvaus">
                    <%
                    request.setCharacterEncoding("UTF-8");
                    int id = Integer.parseInt(request.getParameter("id"));
                    apu.setTilaId(id);
                    if(apu.listaaTila()){
                        while (apu.getVastaus().next()) {
                            out.print("<h1>"+apu.getVastaus().getString("nimi")+"</h1>");
                            out.print(apu.getVastaus().getString("kuvaus"));
                        }
                    }
                    %>
                    </div>
                    <div id="varaus_container">
                        <h3>Varaa tila</h3>
                        <div id="kalenteri_container">
                            <form method="POST" action="varaus.jsp">
                            <input type="hidden" name="tilaid" id="tilaid" value="<% out.print(id); %>"/>
                            <div id="kalenteri_holder">
                            <jsp:include page="includes/kalenteri.jsp" >
                                <jsp:param name="tilaid" value="<%=id%>" />
                                <jsp:param name="vuosi" value="0" />
                                <jsp:param name="kuukausi" value="0" />
                            </jsp:include>
                            </div>
                            <div id="varaus_kellonajat">
                                <p>Valitse päivämäärä</p>
                            </div>
                            <span id="valitut_kellonajat">
                            </span>
                            </form>
                        </div>
                    </div>
                    <div id="kuvat_container">
                        <ul id="tilakuvat">
                            <%
                            if(kuva.haeTilanEsittelykuvat(id)){
                                while (kuva.getVastaus().next()) {
                                    out.print("<li>"
                                                +"<a class='tilakuva' rel='tilakuvat' href='kuvat/tilat/"+id+"/"+kuva.getVastaus().getString("nimi")+".jpg'>"
                                                +"<span class='hoverefekti'></span>"
                                                +"<img src='kuvat/tilat/"+id+"/"+kuva.getVastaus().getString("nimi")+"_thumb.jpg' alt='Mikpoli'/>"
                                                +"</a>"
                                            +"</li>");
                                }
                            }
                            %>
                        </ul>
                    </div>
                    <h2>Muita tiloja</h2>
                    <div class="frame effects" id="valikko_container">
                        <ul class="clearfix">
                            <%
                            if(apu.listaaTilat()){
                                while (apu.getVastaus().next()) {
                                    out.print("<li><a href='tila.jsp?id="+apu.getVastaus().getString("id")+"'>"+apu.getVastaus().getString("nimi")+"</a></li>");
                                }
                            }
                            %>
                        </ul>
                    </div>
                    <div class="scrollbar">
                        <div class="handle">
                            <div class="mousearea"></div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
        $(".tilakuva").fancybox();
        $(".hoverefekti").hover(function(){
				$(this).stop().animate({opacity: .4}, "slow")
			},
			function(){
				$(this).stop().animate({opacity: 0}, "slow");
			}
	);
        var tilaid = $("#tilaid").val();
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
                $("#valitut_kellonajat").append("<p>Valitse aika</p>");
                $("#selectable").bind("mousedown", function(e){
                                                            e.metaKey = true;
                                                        }).selectable({
                                                            filter: ".vapaa",
                                                            stop: function() {
                                                                var valitut = 0;
                                                                $("#valitut_kellonajat").empty();
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='vuosi' value='"+vuosi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='kuukausi' value='"+kuukausi+"'/>");
                                                                $("#valitut_kellonajat").append("<input type='hidden' name='paiva' value='"+paiva+"'/>");
                                                                $(".ui-selected", this).each(function() {
                                                                    valitut++;
                                                                    var index = $("#selectable li").index(this)+8;
                                                                    $("#valitut_kellonajat").append("<input type='hidden' name='valitutajat' value='"+index+"'/>");
                                                                });
                                                                if(valitut>0){
                                                                    $("#valitut_kellonajat").append("<p><input type='submit' value='Siirry varaamaan' name='nappi'/></p>");
                                                                } else{
                                                                    $("#valitut_kellonajat").append("<p>Valitse tunnit</p>");
                                                                }
                                                                
                                                            }
                                                        });
            });
        });
        </script>
    </body>
</html>
