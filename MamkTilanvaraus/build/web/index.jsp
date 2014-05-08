<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="tila" class="tilanvaraus.oliot.Tila"/>
<jsp:useBean id="sivu" class="tilanvaraus.oliot.Sivu"/>
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
                <div id="banneri"></div>
                <div id="palsta">
                    <%
                    sivu.setSivuNimi("etusivu");
                    if(sivu.haeSivuNimi()){
                        while (sivu.getVastaus().next()) {
                            out.print(sivu.getVastaus().getString("sisalto"));
                        }
                    }
                    %>
                    <h2>Tilat</h2>
                    <%@ include file="includes/tilanavigaatio.jsp" %>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
