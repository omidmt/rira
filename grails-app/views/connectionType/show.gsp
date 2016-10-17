
<%@ page import="mt.omid.rira.ConnectionType" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'connectionType.label', default: 'ConnectionType')}" />
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
	<div id="show-connectionType" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${connectionTypeInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label"><g:message code="ConnectionType.name.label" default="Name" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${connectionTypeInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:connectionTypeInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${connectionTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
