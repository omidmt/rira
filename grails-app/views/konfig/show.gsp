
<%@ page import="mt.omid.rira.Konfig" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'konfig.label', default: 'Konfig')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-konfig" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	<div id="show-konfig" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${konfigInstance?.key}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="key" class="col-sm-2 control-label">Key</label>
					%{--<span id="key-label" class="input-group-addon property-label"><g:message code="konfig.key.label" default="Key" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="key-label"><g:fieldValue bean="${konfigInstance}" field="key"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${konfigInstance?.value}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="value" class="col-sm-2 control-label">Value</label>
					%{--<span id="value-label" class="input-group-addon property-label"><g:message code="konfig.value.label" default="Value" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="value-label"><g:fieldValue bean="${konfigInstance}" field="value"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${konfigInstance?.group}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="group" class="col-sm-2 control-label">Group</label>
					%{--<span id="group-label" class="input-group-addon property-label"><g:message code="konfig.group.label" default="Group" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="group-label"><g:fieldValue bean="${konfigInstance}" field="group"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${konfigInstance?.dateCreated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="dateCreated" class="col-sm-2 control-label">Date Created</label>
					%{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="konfig.dateCreated.label" default="Date Created" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${konfigInstance?.dateCreated}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${konfigInstance?.lastUpdated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="lastUpdated" class="col-sm-2 control-label">Last Updated</label>
					%{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="konfig.lastUpdated.label" default="Last Updated" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${konfigInstance?.lastUpdated}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
		</form>
	%{--</ol>--}%
		<g:form url="[resource:konfigInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${konfigInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
