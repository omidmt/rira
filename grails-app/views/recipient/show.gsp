<html>
	<head>
		<g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
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
		<div id="show-recipient" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${recipientInstance?.email}">

					<div class="form-group">
					<label for="inputemail" class="col-sm-2 control-label">email</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="email-label"><g:fieldValue bean="${recipientInstance}" field="email"/></p>

					</div>
					</div>
				</g:if>

				<g:if test="${recipientInstance?.phone}">

					<div class="form-group">
					<label for="inputphone" class="col-sm-2 control-label">phone</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="phone-label"><g:fieldValue bean="${recipientInstance}" field="phone"/></p>

					</div>
					</div>
				</g:if>

				<g:if test="${recipientInstance?.instantMessaging}">

					<div class="form-group">
					<label for="inputinstantMessaging" class="col-sm-2 control-label">instantMessaging</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="instantMessaging-label"><g:fieldValue bean="${recipientInstance}" field="instantMessaging"/></p>

					</div>
					</div>
				</g:if>

				<g:if test="${recipientInstance?.notifGroup}">

					<div class="form-group">
					<label for="inputnotifGroup" class="col-sm-2 control-label">notifGroup</label>
					<div class="col-sm-10">

						<g:each in="${recipientInstance.notifGroup}" var="n">
						<p class="form-control-static disabled" aria-labelledby="notifGroup-label"><g:link controller="notificationGroup" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></p>
						</g:each>

					</div>
					</div>
				</g:if>

			</form>
			<g:form url="[resource:recipientInstance, action:'delete']" method="DELETE">
				<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${recipientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
				</div>
			</g:form>
		</div>
	</div>
	</body>
</html>
