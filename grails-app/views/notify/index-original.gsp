<%--
  Created by IntelliJ IDEA.
  User: eomimeh
  Date: 6/8/14
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    %{--<script type="application/javascript" src="js/iframeResizer.contentWindow.min.js"></script>--}%
  <title>
    SMS Notifier
  </title>
</head>
<body>
    <g:if test="\${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:form action="send" >
        <fieldset class="form">
        <div class="fieldcontain" required="true">
            <label for="notifGroup">Notification Group
            </label>
            <g:select name="notifGroup" from="${notifGroup}" value="${notifGroup.name}" optionKey="id" multiple="true" required="" />
        </div>
        <div class="fieldcontain" required="true">
            <label for="message">Message
            </label>
            <g:textArea name="message" value="" rows="5" cols="40" required=""/>
        </div>
        </fieldset>
        <fieldset class="buttons">
            <div class="fieldcontain">
                <g:submitButton name="send" value="Send"/>
            </div>
        </fieldset>
    </g:form>
</body>
</html>