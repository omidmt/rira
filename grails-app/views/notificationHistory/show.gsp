
<%@ page import="mt.omid.rira.ntfy.NotificationHistory" %>
<!DOCTYPE html>
<html>
<head>
	<g:set var="entityName" value="${message(code: 'notificationHistory.label', default: 'NotificationHistory')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
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
		<form class="form-horizontal" role="form">
			
			<g:if test="${notificationHistoryInstance?.user}">
				<div class="form-group">
					<label for="user" class="col-sm-2 control-label">User</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="user-label"><g:fieldValue bean="${notificationHistoryInstance}" field="user"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${notificationHistoryInstance?.message}">
				<div class="form-group">
					<label for="message" class="col-sm-2 control-label">Message</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="message-label"><g:fieldValue bean="${notificationHistoryInstance}" field="message"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${notificationHistoryInstance?.recipients}">
				<div class="form-group">
					<label for="recipients" class="col-sm-2 control-label">Recipients</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="recipients-label"><g:fieldValue bean="${notificationHistoryInstance}" field="recipients"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${notificationHistoryInstance?.sendDate}">
				<div class="form-group">
					<label for="sendDate" class="col-sm-2 control-label">Send Date</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="sendDate-label"><g:formatDate date="${notificationHistoryInstance?.sendDate}" /></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
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
