<jsp:useBean id="tilanavi" class="tilanvaraus.oliot.Tila"/>
<div id="valikko_container">
    <ul class="clearfix">
        <%
        if(tilanavi.listaaTilat()){
            while (tilanavi.getVastaus().next()) {
                out.print("<li><a href='tila.jsp?id="+tilanavi.getVastaus().getString("id")+"'>"+tilanavi.getVastaus().getString("nimi")+"</a></li>");
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