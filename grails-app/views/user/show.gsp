<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
	<br/>

	<div class="navbar">
		<div class="nav">
			<ul class="nav nav-pills">
				<li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="label label-primary list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
				<li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
			</ul>
		</div>
	</div>

	<div id="show-user" class="content scaffold-show" role="main">
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
		<form class="form-horizontal" role="form">

			<g:if test="${userInstance?.name}">

				<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label">
						<g:fieldValue bean="${userInstance}" field="name"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.email}">

				<div class="form-group">
					<label for="inputemail" class="col-sm-2 control-label">email</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="email-label">
						<g:fieldValue bean="${userInstance}" field="email"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.description}">

				<div class="form-group">
					<label for="inputdescription" class="col-sm-2 control-label">description</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="description-label">
						<g:fieldValue bean="${userInstance}" field="description"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.accountExpiry}">

				<div class="form-group">
					<label for="inputaccountExpiry" class="col-sm-2 control-label">accountExpiry</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="accountExpiry-label">
						<g:formatDate date="${userInstance?.accountExpiry}"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.passwordExpiry}">

				<div class="form-group">
					<label for="inputpasswordExpiry" class="col-sm-2 control-label">passwordExpiry</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="passwordExpiry-label">
						<g:formatDate date="${userInstance?.passwordExpiry}"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.lastLogin}">

				<div class="form-group">
					<label for="inputlastLogin" class="col-sm-2 control-label">lastLogin</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="lastLogin-label">
						<g:formatDate date="${userInstance?.lastLogin}"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.locked}">

				<div class="form-group">
					<label for="inputlocked" class="col-sm-2 control-label">locked</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="locked-label">
						<g:formatBoolean boolean="${userInstance?.locked}"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.failedLogins}">

				<div class="form-group">
					<label for="inputfailedLogins" class="col-sm-2 control-label">failedLogins</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="failedLogins-label">
						<g:fieldValue bean="${userInstance}" field="failedLogins"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.forcePasswordChange}">

				<div class="form-group">
					<label for="inputforcePasswordChange" class="col-sm-2 control-label">forcePasswordChange</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="forcePasswordChange-label">
						<g:formatBoolean boolean="${userInstance?.forcePasswordChange}"/>
						</p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.roles}">

				<div class="form-group">
					<label for="inputroles" class="col-sm-2 control-label">roles</label>
					<div class="col-sm-10">
						<g:each in="${userInstance.roles}" var="r">
							<p class="form-control-static disabled" aria-labelledby="roles-label">
							<g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link>
							</p>
						</g:each>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.notifGroup}">

				<div class="form-group">
					<label for="inputnotifGroup" class="col-sm-2 control-label">notifGroup</label>
					<div class="col-sm-10">

						<g:each in="${userInstance.notifGroup}" var="n">
							<p class="form-control-static disabled" aria-labelledby="notifGroup-label">
							<g:link controller="notificationGroup" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link>
							</p>
						</g:each>

					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.phone}">

				<div class="form-group">
					<label for="inputphone" class="col-sm-2 control-label">phone</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="phone-label">
						<g:fieldValue bean="${userInstance}" field="phone"/>
						</p>

					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.instantMessaging}">

				<div class="form-group">
					<label for="inputinstantMessaging" class="col-sm-2 control-label">instantMessaging</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="instantMessaging-label">
						<g:fieldValue bean="${userInstance}" field="instantMessaging"/>
						</p>

					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.dateCreated}">

				<div class="form-group">
					<label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="dateCreated-label">
						<g:formatDate date="${userInstance?.dateCreated}"/>
						</p>

					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.lastUpdated}">

				<div class="form-group">
					<label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label">
						<g:formatDate date="${userInstance?.lastUpdated}"/>
						</p>

					</div>
				</div>
			</g:if>

		</form>
		<g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${userInstance}">
					<g:message code="default.button.edit.label" default="Edit"/>
					</g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete"
					                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
