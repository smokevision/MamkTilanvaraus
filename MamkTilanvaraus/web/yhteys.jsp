<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sivu" class="tilanvaraus.oliot.Sivu"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="kuvat/ulkoasu/favicon.ico">
        <title>Mikkelin ammattikorkeakoulu - Tilanvaraus - Yhteys</title>
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
                    <h1>Ota yhteyttä</h1>
                    <div id="yhteyslomake">
                        <form method="POST" action="" name="yhteyslomake" id="ylomake">
                            <label class="lomakevirhe" id="nimivirhe" for="nimi">Nimi on liian lyhyt</label>
                            <input type="text" name="nimi" id="nimi" placeholder="Koko nimi" />
                            <label class="lomakevirhe" id="emailvirhe" for="email">Sähköposti on virheellinen</label>
                            <input type="text" name="email" id="email" placeholder="Sähköpostiosoite" />
                            <label class="lomakevirhe" id="viestivirhe" for="viesti">Viesti on liian lyhyt</label>
                            <textarea name="viesti" id="viesti" placeholder="Viestisi (vähintään 6 merkkiä)" rows="10" cols="40"></textarea>
                            <input type="submit" value="Lähetä viesti" name="nappi" class="submitnappi"/>
                        </form>
                        <div id="vastaus"></div>
                    </div>
                    <div id="yhteystiedot">
                        <%
                        sivu.setSivuNimi("yhteys");
                        if(sivu.haeSivuNimi()){
                            while (sivu.getVastaus().next()) {
                                out.print(sivu.getVastaus().getString("sisalto"));
                            }
                        }
                        %>
                    </div>
                    <div style='clear:both;'></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
        $("#ylomake").submit(function() {
            var lomake = $(this);
            var nimi = $("#nimi").val();
            var email = $("#email").val();
            var viesti = $("#viesti").val();
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if(!$("#nimi").val() || $("#nimi").val().length<3){
                    $("#nimivirhe").fadeIn();
                    return false;
            }
            else if(!email || !emailReg.test(email)){
                    $("#emailvirhe").fadeIn();
                    return false;
            }
            else if(viesti.length<6){
                    $("#viestivirhe").fadeIn();
                    return false;
            }
            else{
                    $.post("lomakekasittelija.php", $("#ylomake").serialize(),  function(vastaus) {
                            $.fancybox($("#vastaus").html("<h1>"+vastaus+"</h1>"));
                    });
                    $("#ylomake").find("input[type=text], textarea").val("");
                    return false;
            }
	});
	$("#nimi, #email, #viesti").focus(function(){
			$(".lomakevirhe").fadeOut();	
	});
        </script>
    </body>
</html>
