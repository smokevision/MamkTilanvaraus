<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="funktiot" scope="session" class="tilanvaraus.oliot.Tila"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Testit</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        if(funktiot.getYhteysAuki()){
            out.print("Tietokannan avaus ok");
            out.print("<br/>");
            out.print("<br/>");
            
            if(funktiot.suljeYhteys()){
                out.print("Tietokannan sulkeminen ok");
            } else {
                out.print("Virhe tietokannan sulkemisessa");
            }
        } else {
            out.print("Virhe tietokannan avauksessa");
        }
        %>
        
    </body>
</html>
