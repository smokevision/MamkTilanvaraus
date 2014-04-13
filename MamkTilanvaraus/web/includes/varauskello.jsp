<jsp:useBean id="kalenteri" class="tilanvaraus.oliot.Kalenteri"/>
<%
int tilaId = Integer.parseInt(request.getParameter("tilaid"));
int vuosi = Integer.parseInt(request.getParameter("vuosi"));
int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
int paiva = Integer.parseInt(request.getParameter("paiva"));  
out.print("<h4>" + paiva + "." + kuukausi + "." + vuosi + "</h4>");
%>
<ol id="selectable" class="kellolista">
    <%
    out.print(kalenteri.luoKellolista(vuosi,kuukausi,paiva,tilaId));
    %>
</ol>
