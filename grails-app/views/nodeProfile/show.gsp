<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'nodeProfile.label', default: 'NodeProfile')}" />
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
		<div id="show-nodeProfile" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${nodeProfileInstance?.name}">

					<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeProfileInstance}" field="name"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.baseDir}">

					<div class="form-group">
					<label for="inputbaseDir" class="col-sm-2 control-label">baseDir</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="baseDir-label"><g:fieldValue bean="${nodeProfileInstance}" field="baseDir"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.primaryGroup}">

					<div class="form-group">
					<label for="inputprimaryGroup" class="col-sm-2 control-label">primaryGroup</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="primaryGroup-label"><g:fieldValue bean="${nodeProfileInstance}" field="primaryGroup"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.groupId}">

					<div class="form-group">
					<label for="inputgroupId" class="col-sm-2 control-label">groupId</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="groupId-label"><g:fieldValue bean="${nodeProfileInstance}" field="groupId"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.defaultShell}">

					<div class="form-group">
					<label for="inputdefaultShell" class="col-sm-2 control-label">defaultShell</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="defaultShell-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultShell"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.passwordMinAge}">

					<div class="form-group">
					<label for="inputpasswordMinAge" class="col-sm-2 control-label">passwordMinAge</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="passwordMinAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordMinAge"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.passwordMaxAge}">

					<div class="form-group">
					<label for="inputpasswordMaxAge" class="col-sm-2 control-label">passwordMaxAge</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="passwordMaxAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordMaxAge"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeProfileInstance?.passwordWarning}">

					<div class="form-group">
					<label for="inputpasswordWarning" class="col-sm-2 control-label">passwordWarning</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="passwordWarning-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordWarning"/></p>
					</div>
					</div>
				</g:if>

			</form>
			<g:form url="[resource:nodeProfileInstance, action:'delete']" method="DELETE">
				<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${nodeProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</div>
			</g:form>
		</div>
	</div>
	</body>
</html>
