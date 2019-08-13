<html>
<head>
    <asset:javascript src="notify" />
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
            <g:select id="template" name="templates" class="form-control" from="${templates}" value="${templates.name}" multiple="false" optionKey="id" />
        </div>
        <div class="form-group">
            <label for="history">Sent Messages</label>
            <g:select id="history" name="history" class="form-control" from="${history}" multiple="false" optionKey="id" optionValue="${{((String)it.sendDate) + ' ' + it.message.take( 50 )}}" />
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