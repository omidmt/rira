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
    <g:javascript src="notify.js" />
  <title>
    SMS Notifier
  </title>
</head>
<body>
<div class="col-md-6">
    <g:form action="send" role="form">
        <div class="form-group">
            <label for="notifGroups">Notification Group</label>
            <g:select name="notifGroups" class="form-control" from="${notifGroups}" value="${notifGroups?.name}" optionKey="id" multiple="true" required="" />
        </div>
        <div class="form-group">
            <label for="templates">Template</label>
            <g:select name="templates" class="form-control" from="${templates}" value="${templates.name}" multiple="false" optionKey="id" onchange="${remoteFunction(controller: 'template', action: 'show', onSuccess: 'loadTemplate(data)', dataType: 'json', params: '{ id : this.value }' )}" />
        </div>
        <div class="form-group">
            <label for="history">Sent Messages</label>
            <g:select name="history" class="form-control" from="${history}" multiple="false" optionKey="id" optionValue="${{((String)it.sendDate) + ' ' + it.message.take( 50 )}}" onchange="${remoteFunction(controller: 'notificationHistory', action: 'show', onSuccess: 'loadTemplate(data)', dataType: 'json', params: '{ id : this.value }' )}" />
        </div>
        <div class="form-group">
            <label for="message">Message Content</label> <span id="msgLen" name="msgLen"></span>
            <g:textArea name="message" id="message" class="form-control" value="" rows="10" cols="20" required="" placeholder="Enter the SMS Message Here" onkeyup="updateLength()"></g:textArea>
        </div>
        <g:actionSubmit type="submit" class="btn btn-default" value="send">Send</g:actionSubmit>
    </g:form>
</div>
</body>
</html>