
<%@ page import="mt.omid.rira.NodeProfile" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'nodeProfile.label', default: 'NodeProfile')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-nodeProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
	%{--<ol class="property-list nodeProfile">--}%
		<form class="form-horizontal" role="form">
			
			<g:if test="${nodeProfileInstance?.name}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="name" class="col-sm-2 control-label">Name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="nodeProfile.name.label" default="Name" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeProfileInstance}" field="name"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.baseDir}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="baseDir" class="col-sm-2 control-label">Base Dir</label>
					%{--<span id="baseDir-label" class="input-group-addon property-label"><g:message code="nodeProfile.baseDir.label" default="Base Dir" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="baseDir-label"><g:fieldValue bean="${nodeProfileInstance}" field="baseDir"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultGroup}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultGroup" class="col-sm-2 control-label">Default Group</label>
					%{--<span id="defaultGroup-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultGroup.label" default="Default Group" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultGroup-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultGroup"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultGroupId}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultGroupId" class="col-sm-2 control-label">Default Group Id</label>
					%{--<span id="defaultGroupId-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultGroupId.label" default="Default Group Id" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultGroupId-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultGroupId"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultShell}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultShell" class="col-sm-2 control-label">Default Shell</label>
					%{--<span id="defaultShell-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultShell.label" default="Default Shell" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultShell-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultShell"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultPasswordMinAge}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultPasswordMinAge" class="col-sm-2 control-label">Default Password Min Age</label>
					%{--<span id="defaultPasswordMinAge-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultPasswordMinAge.label" default="Default Password Min Age" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultPasswordMinAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultPasswordMinAge"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultPasswordMaxAge}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultPasswordMaxAge" class="col-sm-2 control-label">Default Password Max Age</label>
					%{--<span id="defaultPasswordMaxAge-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultPasswordMaxAge.label" default="Default Password Max Age" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultPasswordMaxAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultPasswordMaxAge"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultPasswordWarning}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultPasswordWarning" class="col-sm-2 control-label">Default Password Warning</label>
					%{--<span id="defaultPasswordWarning-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultPasswordWarning.label" default="Default Password Warning" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultPasswordWarning-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultPasswordWarning"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeProfileInstance?.defaultConnectivityPlans}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="defaultConnectivityPlans" class="col-sm-2 control-label">Default Connectivity Plans</label>
					%{--<span id="defaultConnectivityPlans-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultConnectivityPlans.label" default="Default Connectivity Plans" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="defaultConnectivityPlans-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultConnectivityPlans"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
		</form>
	%{--</ol>--}%
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
