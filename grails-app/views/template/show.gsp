<html>
	<head>
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
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
					<li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</div>
		<div id="show-template" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${templateInstance?.name}">

				<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${templateInstance}" field="name"/></p>
					</div>
				</div>

				</g:if>

				<g:if test="${templateInstance?.content}">

				<div class="form-group">
					<label for="inputcontent" class="col-sm-2 control-label">content</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="content-label"><g:fieldValue bean="${templateInstance}" field="content"/></p>
					</div>
				</div>
				</g:if>

			</form>
			<g:form url="[resource:templateInstance, action:'delete']" method="DELETE">
				<div class="btn-group">
					<fieldset class="form-group">
						<g:link class="edit btn btn-default" action="edit" resource="${templateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</div>
			</g:form>
		</div>
	</div>
	</body>
</html>
