
<%@ page import="mt.omid.rira.ntfy.NotificationHistory" %>
<!DOCTYPE html>
<html>
	<head>
		%{--<meta name="layout" content="main">--}%
		<g:set var="entityName" value="${message(code: 'notificationHistory.label', default: 'NotificationHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#show-notificationHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="show-notificationHistory" class="content scaffold-show" role="main">
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list notificationHistory">--}%
            <form class="form-horizontal" role="form">
			
				<g:if test="${notificationHistoryInstance?.user}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser" class="col-sm-2 control-label">user</label>
					%{--<span id="user-label" class="input-group-addon property-label"><g:message code="notificationHistory.user.label" default="User" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user-label"><g:fieldValue bean="${notificationHistoryInstance}" field="user"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${notificationHistoryInstance?.message}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputmessage" class="col-sm-2 control-label">message</label>
					%{--<span id="message-label" class="input-group-addon property-label"><g:message code="notificationHistory.message.label" default="Message" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="message-label"><g:fieldValue bean="${notificationHistoryInstance}" field="message"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${notificationHistoryInstance?.recipients}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputrecipients" class="col-sm-2 control-label">recipients</label>
					%{--<span id="recipients-label" class="input-group-addon property-label"><g:message code="notificationHistory.recipients.label" default="Recipients" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="recipients-label"><g:fieldValue bean="${notificationHistoryInstance}" field="recipients"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${notificationHistoryInstance?.sendDate}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputsendDate" class="col-sm-2 control-label">sendDate</label>
					%{--<span id="sendDate-label" class="input-group-addon property-label"><g:message code="notificationHistory.sendDate.label" default="Send Date" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="sendDate-label"><g:formatDate date="${notificationHistoryInstance?.sendDate}" /></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
            </form>
			%{--</ol>--}%
			<g:form url="[resource:notificationHistoryInstance, action:'delete']" method="DELETE">
                <div class="btn-group">
                <fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${notificationHistoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
                </div>
			</g:form>
		</div>
    </div>
	</body>
</html>
