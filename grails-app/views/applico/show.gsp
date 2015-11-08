
<%@ page import="mt.omid.rira.Applico" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'applico.label', default: 'Applico')}" />
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
	<div id="show-applico" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${applicoInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${applicoInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.path}">
				<div class="form-group">
					<label for="path" class="col-sm-2 control-label">Path</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="path-label"><g:fieldValue bean="${applicoInstance}" field="path"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.description}">
				<div class="form-group">
					<label for="description" class="col-sm-2 control-label">Description</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue bean="${applicoInstance}" field="description"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.iconPath}">
				<div class="form-group">
					<label for="iconPath" class="col-sm-2 control-label">Icon Path</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="iconPath-label"><g:fieldValue bean="${applicoInstance}" field="iconPath"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.family}">
				<div class="form-group">
					<label for="family" class="col-sm-2 control-label">Family</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="family-label"><g:fieldValue bean="${applicoInstance}" field="family"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.server}">
				<div class="form-group">
					<label for="server" class="col-sm-2 control-label">Server</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="server-label"><g:fieldValue bean="${applicoInstance}" field="server"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.port}">
				<div class="form-group">
					<label for="port" class="col-sm-2 control-label">Port</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="port-label"><g:fieldValue bean="${applicoInstance}" field="port"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${applicoInstance?.context}">
				<div class="form-group">
					<label for="context" class="col-sm-2 control-label">Context</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="context-label"><g:fieldValue bean="${applicoInstance}" field="context"/></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:applicoInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${applicoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
