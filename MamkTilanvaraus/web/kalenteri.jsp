<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="kalenteri" class="tilanvaraus.oliot.Kalenteri"/>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div#kalenteri{
    margin:0px auto;
    padding:0px;
    width: 742px;
}

div#kalenteri div.box{
    position:relative;
    top:0px;
    left:0px;
    width:100%;
    height:40px;
    background-color:#787878;
}

div#kalenteri div.header{
    width:100%;
    position:relative;
    line-height:35px;
    vertical-align:middle;
    width:742px;
    height:35px;
    text-align:center;
    font-size:18px;
    color:#fff;
}

div#kalenteri div.header a.edellinen, div#kalenteri div.header a.seuraava{
    position:absolute;
    display:inline-block;
    cursor:pointer;
    text-decoration:none;
    margin:0;
    padding:0;
    color:#fff;
}

div#kalenteri div.header a.edellinen{
    left:10px;
}

div#kalenteri div.header a.seuraava{
    right:10px;
}

div#kalenteri div.box-content{
    border:1px solid #787878 ;
    border-top:none;
}

div#kalenteri ul.label{
    float:left;
    margin: 0px;
    padding: 0px;
    margin-top:5px;
    margin-left: 5px;
}

div#kalenteri ul.label li{
    margin:0px;
    padding:0px;
    margin-right:5px;
    float:left;
    list-style-type:none;
    width:100px;
    height:40px;
    line-height:40px;
    vertical-align:middle;
    text-align:center;
    color:#000;
    font-size: 15px;
    background-color:transparent;
    display:inline-block;
}

div#kalenteri ul.paivat{
    float:left;
    margin: 0px;
    padding: 0px;
    margin-left: 5px;
    margin-bottom: 5px;
}

div#kalenteri ul.paivat li.mask{
    background-color:#f0f0f0;
}
div#kalenteri ul.paivat li.nykyinen{
    border:2px solid #ddd;
    color:#da3610;
    background-color:#f0f0f0;
}

div#kalenteri ul.paivat li{
    position:relative;
    box-sizing: border-box;
    margin:5px 5px 0 0;
    padding:4px 7px 0 0;
    float:left;
    list-style-type:none;
    width:100px;
    height:100px;
    font-size:16px;
    background-color:#ddd;
    color:#000;
    text-align:right;
}
:focus{
    outline:none;
}

div.tyhja{
    clear:both;
}
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        DateFormat dateFormat = new SimpleDateFormat("Y-M-d");
        Calendar cal = Calendar.getInstance();

        dateFormat = new SimpleDateFormat("Y");
        int vuosi = Integer.parseInt(dateFormat.format(cal.getTime()));
        dateFormat = new SimpleDateFormat("M");
        int kuukausi = Integer.parseInt(dateFormat.format(cal.getTime()));
        
        int paivia = 0;
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, vuosi);
        calendar.set(Calendar.MONTH, kuukausi-1);
        paivia = calendar.getActualMaximum(Calendar.DATE);
        out.print(paivia);

        out.print(kalenteri.luoKalenteri(0,0));
        %>
    </body>
</html>
