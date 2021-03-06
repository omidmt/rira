
<%@ page import="mt.omid.rira.DataConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'dataConnection.label', default: 'DataConnection')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-dataConnection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	<div id="show-dataConnection" class="content scaffold-show" role="main">
	%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
	%{--<ol class="property-list dataConnection">--}%
		<form class="form-horizontal" role="form">
			
			<g:if test="${dataConnectionInstance?.name}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="name" class="col-sm-2 control-label">Name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="dataConnection.name.label" default="Name" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${dataConnectionInstance}" field="name"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.dsClass}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="dsClass" class="col-sm-2 control-label">Ds Class</label>
					%{--<span id="dsClass-label" class="input-group-addon property-label"><g:message code="dataConnection.dsClass.label" default="Ds Class" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dsClass-label"><g:fieldValue bean="${dataConnectionInstance}" field="dsClass"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.driver}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="driver" class="col-sm-2 control-label">Driver</label>
					%{--<span id="driver-label" class="input-group-addon property-label"><g:message code="dataConnection.driver.label" default="Driver" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="driver-label"><g:fieldValue bean="${dataConnectionInstance}" field="driver"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.url}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="url" class="col-sm-2 control-label">Url</label>
					%{--<span id="url-label" class="input-group-addon property-label"><g:message code="dataConnection.url.label" default="Url" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="url-label"><g:fieldValue bean="${dataConnectionInstance}" field="url"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.username}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="username" class="col-sm-2 control-label">Username</label>
					%{--<span id="username-label" class="input-group-addon property-label"><g:message code="dataConnection.username.label" default="Username" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="username-label"><g:fieldValue bean="${dataConnectionInstance}" field="username"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.password}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="password" class="col-sm-2 control-label">Password</label>
					%{--<span id="password-label" class="input-group-addon property-label"><g:message code="dataConnection.password.label" default="Password" /></span>--}%
					<div class="col-sm-10">
						
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${dataConnectionInstance?.others}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="others" class="col-sm-2 control-label">Others</label>
					%{--<span id="others-label" class="input-group-addon property-label"><g:message code="dataConnection.others.label" default="Others" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="others-label"><g:fieldValue bean="${dataConnectionInstance}" field="others"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
		</form>
	%{--</ol>--}%
		<g:form url="[resource:dataConnectionInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${dataConnectionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
