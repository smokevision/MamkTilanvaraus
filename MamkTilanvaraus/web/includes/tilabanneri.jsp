<jsp:useBean id="kuva" class="tilanvaraus.oliot.Kuva"/><%
int tilaId = Integer.parseInt(request.getParameter("tilaid"));
if(kuva.haeTilanBanneri(tilaId)){
    while (kuva.getVastaus().next()) {
        out.print(kuva.getVastaus().getString("nimi"));
    }
}
%>