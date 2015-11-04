
<%@ page import="mt.omid.rira.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	<div class="navbar">
		<div class="nav">
			<ul class="nav nav-pills">
				<g:if test="${userInstance.locked}">
					<li><g:link class="label label-success create" resource="${userInstance}" action="unlock" params="[format: 'html']">Unlock</g:link></li>
				</g:if>
				<g:else>
					<li><g:link class="label label-danger list" resource="${userInstance}" action="lock" params="[format: 'html']">Lock</g:link></li>
				</g:else>
				<li><g:link class="label label-warning create" resource="${userInstance}" action="forcePasswordChange" params="[format: 'html']">Force Password Change</g:link></li>
			</ul>
		</div>
	</div>
	<div id="show-user" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">

			<g:if test="${userInstance?.name}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="name" class="col-sm-2 control-label">Name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="user.name.label" default="Name" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.email}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="email" class="col-sm-2 control-label">Email</label>
					%{--<span id="email-label" class="input-group-addon property-label"><g:message code="user.email.label" default="Email" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.description}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="description" class="col-sm-2 control-label">Description</label>
					%{--<span id="description-label" class="input-group-addon property-label"><g:message code="user.description.label" default="Description" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue bean="${userInstance}" field="description"/></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.accountExpiry}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="accountExpiry" class="col-sm-2 control-label">Account Expiry</label>
					%{--<span id="accountExpiry-label" class="input-group-addon property-label"><g:message code="user.accountExpiry.label" default="Account Expiry" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="accountExpiry-label"><g:formatDate date="${userInstance?.accountExpiry}" /></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.passwordExpiry}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="passwordExpiry" class="col-sm-2 control-label">Password Expiry</label>
					%{--<span id="passwordExpiry-label" class="input-group-addon property-label"><g:message code="user.passwordExpiry.label" default="Password Expiry" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="passwordExpiry-label"><g:formatDate date="${userInstance?.passwordExpiry}" /></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.lastLogin}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="lastLogin" class="col-sm-2 control-label">Last Login</label>
					%{--<span id="lastLogin-label" class="input-group-addon property-label"><g:message code="user.lastLogin.label" default="Last Login" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="lastLogin-label"><g:formatDate date="${userInstance?.lastLogin}" /></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.locked}">
				<div class="form-group">
					<label for="locked" class="col-sm-2 control-label">Locked</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="locked-label"><g:formatBoolean boolean="${userInstance?.locked}" /></p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.failedLogins}">
				<div class="form-group">
					<label for="failedLogins" class="col-sm-2 control-label">Failed Logins</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="failedLogins-label"><g:fieldValue bean="${userInstance}" field="failedLogins"/></p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.forcePasswordChange}">
				<div class="form-group">
					<label for="forcePasswordChange" class="col-sm-2 control-label">Force Password Change</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="forcePasswordChange-label"><g:formatBoolean boolean="${userInstance?.forcePasswordChange}" /></p>
					</div>
				</div>
			</g:if>

			<g:if test="${userInstance?.phone}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="phone" class="col-sm-2 control-label">Phone</label>
					%{--<span id="phone-label" class="input-group-addon property-label"><g:message code="user.phone.label" default="Phone" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="phone-label"><g:fieldValue bean="${userInstance}" field="phone"/></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.instantMessaging}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="instantMessaging" class="col-sm-2 control-label">Instant Messaging</label>
					%{--<span id="instantMessaging-label" class="input-group-addon property-label"><g:message code="user.instantMessaging.label" default="Instant Messaging" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="instantMessaging-label"><g:fieldValue bean="${userInstance}" field="instantMessaging"/></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.dateCreated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="dateCreated" class="col-sm-2 control-label">Date Created</label>
					%{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.lastUpdated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="lastUpdated" class="col-sm-2 control-label">Last Updated</label>
					%{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span>--}%
					<div class="col-sm-10">

						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}" /></p>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.notifGroup}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="notifGroup" class="col-sm-2 control-label">Notif Group</label>
					%{--<span id="notifGroup-label" class="input-group-addon property-label"><g:message code="user.notifGroup.label" default="Notif Group" /></span>--}%
					<div class="col-sm-10">

						<g:select id="notifGroup"
								  name="notifGroup.id"
								  class="form-control"
								  from="${mt.omid.rira.ntfy.NotificationGroup.list()}"
								  optionKey="id"
								  size="10"
								  value="${userInstance?.notifGroup*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

			<g:if test="${userInstance?.roles}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="roles" class="col-sm-2 control-label">Roles</label>
					%{--<span id="roles-label" class="input-group-addon property-label"><g:message code="user.roles.label" default="Roles" /></span>--}%
					<div class="col-sm-10">

						<g:select id="roles"
								  name="roles.id"
								  class="form-control"
								  from="${mt.omid.rira.Role.list()}"
								  optionKey="id"
								  size="10"
								  value="${userInstance?.roles*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>

					</div>
					%{--</li>--}%
				</div>
			</g:if>

		</form>
	%{--</ol>--}%
		<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
