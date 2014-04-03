<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Tilat</title>
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
                <h1>Tilat</h1>
                <p>
                    Kasarmin kampuksen tilat tarjoavat ainutlaatuiset puitteet niin intiimeille kokouksille, räätälöidyille yritystapahtumille kuin suuremmille seminaaritapahtumillekin. Uusi Ravintola DeXin tapahtumastage, DeXi-stage, antaa mahdollisuudet lasten tapahtumista live-konsertteihin.
                </p>
                <table id="tilalista">
                    <% 
                    if(apu.listaaTilat("Mikkeli")){
                        while (apu.getVastaus().next()) {
                            out.print("<tr><td>");
                            out.print("<a href='#'>"+apu.getVastaus().getString("nimi")+"</</td><td>");
                            out.print(apu.getVastaus().getString("henkilomaara")+" hengelle</td></tr>");
                        }
                    }
                    %>
                </table>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
