<%
int tilaId = Integer.parseInt(request.getParameter("tilaid"));
int vuosi = Integer.parseInt(request.getParameter("vuosi"));
int kuukausi = Integer.parseInt(request.getParameter("kuukausi"));
int paiva = Integer.parseInt(request.getParameter("paiva"));  
out.print("<p>" + paiva + "." + kuukausi + "." + vuosi + "</p>");
%>
<ol id="selectable" class="kellolista">
    <li class="varattu">8:00 Vapaa</li>
    <li class="varattu">9:00 Vapaa</li>
    <li class="">10:00 Vapaa</li>
    <li class="">11:00 Vapaa</li>
    <li class="">12:00 Vapaa</li>
    <li class="">13:00 Vapaa</li>
    <li class="">14:00 Vapaa</li>
    <li class="">15:00 Vapaa</li>
    <li class="">16:00 Vapaa</li>
    <li class="">17:00 Vapaa</li>
    <li class="">18:00 Vapaa</li>
    <li class="">19:00 Vapaa</li>
    <li class="">20:00 Vapaa</li>
    <li class="">21:00 Vapaa</li>
</ol>
<p><input type="submit" value="Jatka varausta" name="nappi"/></p>