
<%@ page import="mt.omid.rira.ntfy.Recipient" %>
<!DOCTYPE html>
<html>
<head>
	<g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
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
	<div id="show-recipient" class="content scaffold-show" role="main">
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
		<form class="form-horizontal" role="form">
			
			<g:if test="${recipientInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${recipientInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${recipientInstance?.email}">
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="email-label"><g:fieldValue bean="${recipientInstance}" field="email"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${recipientInstance?.phone}">
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="phone-label"><g:fieldValue bean="${recipientInstance}" field="phone"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${recipientInstance?.instantMessaging}">
				<div class="form-group">
					<label for="instantMessaging" class="col-sm-2 control-label">Instant Messaging</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="instantMessaging-label"><g:fieldValue bean="${recipientInstance}" field="instantMessaging"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${recipientInstance?.notifGroup}">
				<div class="form-group">
					<label for="notifGroup" class="col-sm-2 control-label">Notif Group</label>
					<div class="col-sm-10">
						
						<g:select id="notifGroup"
								  name="notifGroup.id"
								  class="form-control"
								  from="${mt.omid.rira.ntfy.NotificationGroup.list()}"
								  optionKey="id"
								  size="10"
								  value="${recipientInstance?.notifGroup*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:recipientInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${recipientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
