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

    .btn {
        color: #fff;
        background-color: #5cb85c;
        border-color: #4cae4c;

        display: inline-block;
        padding: 6px 12px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: normal;
        text-decoration: none;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    </style>
</head>
<body>
<table style="border: 1px solid silver; padding: 15px; margin: 5px; border-radius: 3px; width: 600px">
    <tr><td>
        <img src='cid:logo' />
        <h1>
            Invitation to <%= Konfig.KONFIGS.appName %>
        </h1>
        <hr>
        <p>
            Dear <%=name%>,<br/>
            <BR/>
            You are invited to join <%=Konfig.KONFIGS.appName%>. You can activate your user in <%=Konfig.KONFIGS.appName%> by clicking the following button or follow this link in your browser: http://<%="${Konfig.KONFIGS.localAddress}${createLink(controller: 'register', action: 'accept', params:[id: uid])}"%>
            <br/>
            <br/>
        <table cellpadding=”0″ cellspacing=”0″ border=”0″>
            <tr>
                <td class="btn" style="text-align: left; font-size: 22px; border-radius: 4px; font-weight: bold; text-decoration: none; color: #fff; padding: 5px; margin: 5px;">
                    <a class="btn" style="text-decoration: none" href="http://<%="${Konfig.KONFIGS.localAddress}${createLink(controller: 'register', action: 'accept', params:[id: uid])}"%>"> Join <%=Konfig.KONFIGS.appName%> </a>
                </td>
            </tr>
        </table>
        <br/>
        Your email address is your user name to enter.<br/><br/>
        Best Regards<br/>
        <%=Konfig.KONFIGS.appName%> Admin
    </p>
        <hr>
        <p style="font-size: 0.7em; color: gray;">Please don't reply this email.</p>
    </td></tr>
</table>
</body>
</html>
