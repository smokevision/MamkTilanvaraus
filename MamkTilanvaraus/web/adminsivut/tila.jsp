<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="apu" class="tilanvaraus.oliot.Tila"/>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uusi tila</title>
    </head>
    <body>
        <%
        if (request.getParameter("nappi") != null) {
            apu.setNimi(request.getParameter("nimi"));
            apu.setTunnus(request.getParameter("tunnus"));
            apu.setKuvaus(request.getParameter("kuvaus"));
            apu.setHinta(request.getParameter("hinta"));
            apu.setHenkilomaara(request.getParameter("henkilomaara"));
            if (apu.lisaaTila()) {
                out.print("Tilan lisäys onnistui");
            } else {
                out.print("Tapahtui virhe!");
            }
        }
        %>
        <form method="post" action="tilanlisays.jsp">
            Tilan nimi: <input type="text" name="nimi" required="required"/><br/>
            Tunnus: <input type="text" name="tunnus"/><br/>
            <textarea cols="50" rows="10" id="editor1" name="kuvaus"></textarea><br/>
            Hinta: <input type="text" name="hinta"/><br/>
            Henkilömäärä: <input type="text" name="henkilomaara"/><br/>
            <input type="submit" value="Lisää tila" name="nappi"/>
        </form>
        
        <ckeditor:replace replace="kuvaus" basePath="../ckeditor/" />
    </body>
</html>
