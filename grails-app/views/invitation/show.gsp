
<%@ page import="mt.omid.rira.Invitation" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'invitation.label', default: 'Invitation')}" />
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
	<div id="show-invitation" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${invitationInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${invitationInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${invitationInstance?.email}">
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="email-label"><g:fieldValue bean="${invitationInstance}" field="email"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${invitationInstance?.accountExpiry}">
				<div class="form-group">
					<label for="accountExpiry" class="col-sm-2 control-label">Account Expiry</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="accountExpiry-label"><g:formatDate date="${invitationInstance?.accountExpiry}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${invitationInstance?.role}">
				<div class="form-group">
					<label for="role" class="col-sm-2 control-label">Role</label>
					<div class="col-sm-10">
						
						<g:select id="role"
								  name="role.id"
								  class="form-control"
								  from="${mt.omid.rira.Role.list()}"
								  optionKey="id"
								  size="10"
								  value="${invitationInstance?.role?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${invitationInstance?.dateCreated}">
				<div class="form-group">
					<label for="dateCreated" class="col-sm-2 control-label">Date Created</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${invitationInstance?.dateCreated}" /></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:invitationInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${invitationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
