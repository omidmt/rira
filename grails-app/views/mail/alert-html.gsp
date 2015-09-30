<%@ page import="mt.omid.rira.Konfig" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <style type="text/css">
    body
    {
        font-family: "Helvetica Neue", Arial, Helvetica, sans-serif;
    }
    .minibutton
    {
        padding: 0 10px;
        line-height: 20px;
        display: inline-block;
        margin-left: -1px;
        position: relative;
        float: left;
        background-color: #EAEAEA;
        background-image: -moz-linear-gradient(#FAFAFA, #EAEAEA);
        background-image: -webkit-linear-gradient(#FAFAFA, #EAEAEA);
        background-image: linear-gradient(#FAFAFA, #EAEAEA);
        background-repeat: repeat-x;
        border: 1px solid #DDD;
        border-bottom-color: #C5C5C5;
        border-radius: 3px;
    }

    .minibutton:hover
    {
        color: #fff;
        text-decoration: none;
        text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
        background-color: #3072b3;
        background-image: -moz-linear-gradient(#599bcd, #3072b3);
        background-image: -webkit-linear-gradient(#599bcd, #3072b3);
        background-image: linear-gradient(#599bcd, #3072b3);
        background-repeat: repeat-x;
        border-color: #2a65a0
    }
    </style>
</head>
<body>
<table style="border: 1px solid silver; padding: 15px; margin: 5px; border-radius: 3; width: 600px">
    <tr><td>
        <img src='cid:logo' />
        <h1>
            Welcome to <%= Konfig.KONFIGS.appName %>
        </h1>
        <hr>
        <p>
            <%="${message}"%> %>
            <br/>
            <br/>
            Best Regards<br/>
            <%=Konfig.KONFIGS.appName%> Admin
        </p>
        <hr>
        <p style="font-size: 0.7em; color: gray;">Please don't reply this email.</p>
    </td></tr>
</table>
</body>
</html>
