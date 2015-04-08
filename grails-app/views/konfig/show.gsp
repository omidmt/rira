<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'konfig.label', default: 'Konfig')}" />
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
		<div id="show-konfig" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${konfigInstance?.key}">
					<div class="form-group">
					<label for="inputkey" class="col-sm-2 control-label">key</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="key-label"><g:fieldValue bean="${konfigInstance}" field="key"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${konfigInstance?.value}">
					<div class="form-group">
					<label for="inputvalue" class="col-sm-2 control-label">value</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="value-label"><g:fieldValue bean="${konfigInstance}" field="value"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${konfigInstance?.group}">
					<div class="form-group">
					<label for="inputgroup" class="col-sm-2 control-label">group</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="group-label"><g:fieldValue bean="${konfigInstance}" field="group"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${konfigInstance?.dateCreated}">
					<div class="form-group">
					<label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${konfigInstance?.dateCreated}" /></p>
					</div>
					</div>
				</g:if>

				<g:if test="${konfigInstance?.lastUpdated}">
					<div class="form-group">
					<label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${konfigInstance?.lastUpdated}" /></p>
					</div>
					</div>
				</g:if>

			</form>
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
