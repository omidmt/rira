
<%@ page import="mt.omid.rira.APIKey" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'APIKey.label', default: 'APIKey')}" />
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
	<div id="show-APIKey" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${APIKeyInstance?.user}">
				<div class="form-group">
					<label for="user" class="col-sm-2 control-label">User</label>
					<div class="col-sm-10">
						
						<g:select id="user"
								  name="user.id"
								  class="form-control"
								  from="${mt.omid.rira.User.list()}"
								  optionKey="id"
								  size="10"
								  value="${APIKeyInstance?.user?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${APIKeyInstance?.key}">
				<div class="form-group">
					<label for="key" class="col-sm-2 control-label">Key</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="key-label"><g:fieldValue bean="${APIKeyInstance}" field="key"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${APIKeyInstance?.allowedIPs}">
				<div class="form-group">
					<label for="allowedIPs" class="col-sm-2 control-label">Allowed IP s</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="allowedIPs-label"><g:fieldValue bean="${APIKeyInstance}" field="allowedIPs"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${APIKeyInstance?.maxPerDay}">
				<div class="form-group">
					<label for="maxPerDay" class="col-sm-2 control-label">Max Per Day</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="maxPerDay-label"><g:fieldValue bean="${APIKeyInstance}" field="maxPerDay"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${APIKeyInstance?.maxPerMonth}">
				<div class="form-group">
					<label for="maxPerMonth" class="col-sm-2 control-label">Max Per Month</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="maxPerMonth-label"><g:fieldValue bean="${APIKeyInstance}" field="maxPerMonth"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${APIKeyInstance?.totalMax}">
				<div class="form-group">
					<label for="totalMax" class="col-sm-2 control-label">Total Max</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="totalMax-label"><g:fieldValue bean="${APIKeyInstance}" field="totalMax"/></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:APIKeyInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${APIKeyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
