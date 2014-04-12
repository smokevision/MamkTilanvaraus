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
    width:238px;
}

div#kalenteri div.box{
    position:relative;
    top:0px;
    left:0px;
    width:100%;
    height:30px;
    background-color:#787878;
}

div#kalenteri div.header{
    width:100%;
    position:relative;
    line-height:25px;
    vertical-align:middle;
    width:238px;
    height:25px;
    text-align:center;
    font-size:14px;
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
    left:5px;
}

div#kalenteri div.header a.seuraava{
    right:5px;
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
    margin-right:3px;
    float:left;
    list-style-type:none;
    width:30px;
    height:18px;
    line-height:18px;
    vertical-align:middle;
    text-align:center;
    color:#000;
    font-size:14px;
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
    margin:3px 3px 0 0;
    float:left;
    list-style-type:none;
    width:30px;
    height:30px;
    font-size:16px;
    background-color:#ddd;
    color:#000;
    line-height:30px;
    text-align:center;
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
        out.print(kalenteri.luoKalenteri(0,0));
        %>
    </body>
</html>
