<jsp:useBean id="kuva" class="tilanvaraus.oliot.Kuva"/><%
if(kuva.haeBanneri()){
    while (kuva.getVastaus().next()) {
        out.print(kuva.getVastaus().getString("nimi"));
    }
}
%>