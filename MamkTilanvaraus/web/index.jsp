<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Etusivu</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
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
                    <h2>Hyviä kokoushetkiä Kasarmin kampuksella</h2>
                    <p>
                        Tervetuloa Mikkelin ammattikorkeakoulun tilanvarausjärjestelmään. Kasarmin kampuksella on nykyaikaiset ja monipuoliset tilat tapahtumajärjestäjien käyttöön. Kampuksen keskeinen ja puistomaisen rauhallinen sijainti tarjoaa ihanteellisen ympäristön niin pienille kuin suurillekin ryhmille, jopa 300 hengelle. Viihtyisät tilat ja onnistunut tarjoilu luovat mukavia muistoja. Kasarmin kampukselle on Mikkelin keskustasta vaivatonta saapua, autolla vain muutama minuutti ja kävellenkin 10-15 minuuttia. 
                    </p>
                    <h2>Ravintolapalvelut</h2>
                    <p>
                        Kasarmin kampuksen ravintolapalvelut; Ravintola Talli, Ravintola DeXi ja Ravintola Kasarmina tuottavat kaikki kokous- ja ravintolapalvelut ammattitaidolla ja kokemuksella Kasarmin kampusalueella. Tunnusmerkkejä ovat tilaisuuksien räätälöity toteutus, muuntautuvat ravintolatilat eri puolilla kampusaluetta, joustava palveluasenne ja lähiruoka-ajattelu. Valmiudet riittävät vaivatta niin pienten kokousten kuin suurten tapahtumien tyylikkääseen toteuttamiseen.
                    </p>

                    <h2>Tilat</h2>
                    <div id="valikko_container">
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
