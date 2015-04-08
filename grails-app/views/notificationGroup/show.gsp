<html>
	<head>
		<g:set var="entityName" value="${message(code: 'notificationGroup.label', default: 'NotificationGroup')}" />
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
		<div id="show-notificationGroup" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${notificationGroupInstance?.name}">

					<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${notificationGroupInstance}" field="name"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${notificationGroupInstance?.recipients}">

					<div class="form-group">
					<label for="inputrecipients" class="col-sm-2 control-label">recipients</label>
					<div class="col-sm-10">

						<g:each in="${notificationGroupInstance.recipients}" var="r">
						<p class="form-control-static disabled" aria-labelledby="recipients-label"><g:link controller="recipient" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></p>
						</g:each>

					</div>
					</div>
				</g:if>

			</form>
			<g:form url="[resource:notificationGroupInstance, action:'delete']" method="DELETE">
				<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${notificationGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</div>
			</g:form>
		</div>
	</div>
	</body>
</html>
