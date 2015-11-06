
<%@ page import="mt.omid.rira.NodeType" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'nodeType.label', default: 'NodeType')}" />
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
	<div id="show-nodeType" class="content scaffold-show" role="main">
		%{--<g:if test="${flash.message}">--}%
			%{--<div class="alert message" role="status">${flash.message}</div>--}%
		%{--</g:if>--}%
		<form class="form-horizontal" role="form">
			
			<g:if test="${nodeTypeInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeTypeInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeTypeInstance?.modules}">
				<div class="form-group">
					<label for="modules" class="col-sm-2 control-label">Modules</label>
					<div class="col-sm-10">
						
						<g:select id="modules"
								  name="modules.id"
								  class="form-control"
								  from="${mt.omid.rira.Module.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeTypeInstance?.modules*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:nodeTypeInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${nodeTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
