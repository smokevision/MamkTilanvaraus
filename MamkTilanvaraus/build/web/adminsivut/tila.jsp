<%
    if ((session.getAttribute("loginStatus") == null) || (session.getAttribute("loginStatus") == "")) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("loginStatus") == "logged") {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="tila" class="tilanvaraus.oliot.Tila"/>
<jsp:useBean id="kuva" scope="session" class="tilanvaraus.oliot.Kuva"/>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Etusivu</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="../css/cupertino/jquery-ui-1.10.4.custom.css">
        <link rel="stylesheet" type="text/css" href="../css/main.css"/>
        <link rel="stylesheet" href="../css/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/jquery.fancybox.js?v=2.1.5"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="../includes/adminheader.jsp" %>
                <div id="palsta">
                    <h1>Hallitse tilan tietoja</h1>
                    <div id="kuvaus">
                    <%
                    request.setCharacterEncoding("UTF-8");
                    int id = Integer.parseInt(request.getParameter("id"));
                    tila.setTilaId(id);
                    if (request.getParameter("nappi") != null) {
                        tila.setNimi(request.getParameter("nimi"));
                        tila.setTunnus(request.getParameter("tunnus"));
                        tila.setKuvaus(request.getParameter("editori"));
                        tila.setHinta(request.getParameter("hinta"));
                        tila.setHenkilomaara(request.getParameter("henkilomaara"));
                        if (tila.paivitaTila()) {
                            out.print("Tilan tiedot päivitetty");
                        } else {
                            out.print("Tapahtui virhe!");
                        }
                    }
                    
                    if(tila.listaaTila()){
                        while (tila.getVastaus().next()) {
                            out.print("<form method='post' action='tila.jsp?id="+id+"' id='tietoform'>");
                            out.print("<table class='tilataulu'><tr><td>Nimi:</td><td><input type='text' name='nimi' required='required' value='"+tila.getVastaus().getString("nimi")+"'/><td></tr>");
                            out.print("<tr><td>Tunnus:</td><td><input type='text' name='tunnus' value='"+tila.getVastaus().getString("tunnus")+"'/></td></tr>");
                            out.print("<tr><td>Henkilömäärä:</td><td><input type='text' name='henkilomaara' value='"+tila.getVastaus().getString("henkilomaara")+"'/></td></tr></table>");
                            out.print("<textarea cols='50' rows='20' id='editori' name='editori'>"+tila.getVastaus().getString("kuvaus")+"</textarea><br/>");
                            out.print("<table class='tilataulu'><tr><td><input type='submit' value='Tallenna' name='nappi'/></td></tr></table></form>");
                        }
                    }
                    %>
                    </div>
                    <div id="kuvat_container">
                        <h2>Kuvat</h2>
                        <h3>Banneri</h3>
                        <%
                        if(kuva.haeTilanBanneri(id)){
                            while (kuva.getVastaus().next()) {
                                out.print("<img class='tilabanneri' src='../kuvat/tilat/"+id+"/"+kuva.getVastaus().getString("nimi")+".jpg'/>");
                            }
                        }
                        %>
                        <div id="accordion">
                            <h4>Vaihda banneri</h4>
                            <div>
                            <form action="lataaBanneri" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="tilaId" value="<% out.print(id); %>"/>
                                <input type="file" name="file" size="50" />
                                <br />
                                <input type="submit" name="bannerinappi" value="Lähetä kuva" />
                            </form>
                            </div>
                        </div>
                        <h3>Muut kuvat</h3>
                        <ul id="tilakuvat">
                        <%
                        if(kuva.haeTilanEsittelykuvat(id)){
                            while (kuva.getVastaus().next()) {
                                out.print("<li>"
                                            +"<a class='tilakuva' rel='tilakuvat' href='../kuvat/tilat/"+id+"/"+kuva.getVastaus().getString("nimi")+".jpg'>"
                                            +"<span class='hoverefekti'></span>"
                                            +"<img src='../kuvat/tilat/"+id+"/"+kuva.getVastaus().getString("nimi")+"_thumb.jpg'/>"
                                            +"</a>"
                                        +"</li>");
                            }
                        }
                        %>
                        </ul>
                        <div id="accordion2">
                            <h4>Lataa uusi kuva</h4>
                            <div>
                                <form action="KuvanLataus" method="post" enctype="multipart/form-data"> 
                                <input type="file" name="file" size="50" />
                                <input type="hidden" name="tilaId" value="<% out.print(id); %>"/>
                                <br />
                                <input type="submit" name="kuvanappi" value="Lähetä kuva" />
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="../includes/adminfooter.jsp" %>
        </div>
        <ckeditor:replace replace="editori" basePath="../ckeditor/" />
        <script>
        $(".tilakuva").fancybox();
        $(".hoverefekti").hover(function(){
				$(this).stop().animate({opacity: .4}, "slow");
			},
			function(){
				$(this).stop().animate({opacity: 0}, "slow");
			}
	);
        $("#accordion, #accordion2").accordion({
            active: false,
            collapsible: true
        });
        </script>
    </body>
</html>
<% } %>