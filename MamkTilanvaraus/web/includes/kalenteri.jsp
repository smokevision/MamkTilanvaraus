<jsp:useBean id="kalenteri" class="tilanvaraus.oliot.Kalenteri"/>
<%
int tilaId = Integer.parseInt(request.getParameter("tilaid"));
int vuosi = Integer.parseInt(request.getParameter("vuosi"));
int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
out.print(kalenteri.luoKalenteri(vuosi,kuukausi,tilaId));
%>