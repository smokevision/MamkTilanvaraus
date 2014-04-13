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
                        Varauksen tiedot >> <span class="nykyinen">Maksaminen/hyväksyminen >></span> Valmis
                    </div>
                    <div id="kuvaus">
                    <h1>Maksaminen</h1>
                    <p>Tähän maksu</p>
                    </div>
                    </form>
                    <div style='clear:both;'></div>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
        </script>
    </body>
</html>
