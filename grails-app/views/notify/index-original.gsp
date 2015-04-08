<%--
  @author eomimeh
--%>

<html>
<head>
    <meta name="layout" content="main">
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