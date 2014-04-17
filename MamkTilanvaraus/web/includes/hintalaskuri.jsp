<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="varaus" scope="session" class="tilanvaraus.oliot.Varaus"/>
<%
request.setCharacterEncoding("UTF-8");
int vuosi = Integer.parseInt(request.getParameter("vuosi"));
int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
int paiva = Integer.parseInt(request.getParameter("paiva"));
String valitutAjat[] = request.getParameterValues("valitutajat[]");
Double hinta = 0.0;
hinta = varaus.laskeVarauksenHinta(valitutAjat, vuosi, kuukausi, paiva);
out.print(hinta + " €");
%>