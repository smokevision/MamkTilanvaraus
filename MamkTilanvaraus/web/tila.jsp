<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Tila</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="css/jquery.simplyscroll.css" media="all" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/sly.min.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="container">
                <%@ include file="includes/header.jsp" %>
                <div id="palsta">
                    <div id="kuvaus">
                    <%
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
                    <div id="kalenteri_container">
                        <p>Varauskalenteri</p>
                    </div>
                    <div id="kuvat_container">
                        <p>Kuvia tilasta</p>
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
    </body>
</html>
