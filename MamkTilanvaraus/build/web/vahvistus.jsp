<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" scope="session" class="tilanvaraus.oliot.Varaus"/>
<jsp:useBean id="tila" scope="session" class="tilanvaraus.oliot.Tila"/>
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
                    <div id="varaus_vaiheet">
                        Varauksen tiedot >> Yhteenveto/maksaminen >> <span class="nykyinen">Valmis</span>
                    </div>
                    <%
                    varaus.setAsiakasId((Integer) session.getAttribute("userId"));
                    varaus.setTilaId((Integer) session.getAttribute("tilaId"));
                    varaus.setPvm((Integer) session.getAttribute("vuosi"),(Integer) session.getAttribute("kuukausi"),(Integer) session.getAttribute("paiva"));
                    varaus.setHinta((Double) session.getAttribute("hinta"));
                    varaus.setMaksutapa((String) session.getAttribute("maksutapa"));
                    varaus.setMaksutilanne((Integer) session.getAttribute("maksutilanne"));

                    varaus.setAsiakasId((Integer) session.getAttribute("userId"));
                    varaus.setPvm((Integer) session.getAttribute("vuosi"),(Integer) session.getAttribute("kuukausi"),(Integer) session.getAttribute("paiva"));
                    String[] valitutAjat = (String[]) session.getAttribute("valitutAjat");
                    varaus.setValitutAjat(valitutAjat);

                    if(varaus.lisaaVaraus()){
                        %>
                        <h1>Kiitos varauksesta</h1>
                        <p>Varauksesi on rekisteröity. Olemme lähettäneet sähköpostiisi varausvahvistuksen.</p>
                        <p><a href="index.jsp">Palaa etusivulle</a></p>
                        <%
                    } else {
                        %>
                        <h1>Tahtui virhe!</h1>
                        <p>Hups, tapahtui järjestelmävirhe, varauksesi ei tallentunut.</p>
                        <p><a href="index.jsp">Palaa etusivulle</a></p>
                        <%
                    }
                    %>
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
        </div>
        <script>
        </script>
    </body>
</html>
