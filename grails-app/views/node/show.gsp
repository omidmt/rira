
<%@ page import="mt.omid.rira.Node" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-node" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	<div id="show-node" class="content scaffold-show" role="main">
	%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
	%{--<ol class="property-list node">--}%
		<form class="form-horizontal" role="form">
			
			<g:if test="${nodeInstance?.name}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="name" class="col-sm-2 control-label">Name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="node.name.label" default="Name" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeInstance}" field="name"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.profile}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="profile" class="col-sm-2 control-label">Profile</label>
					%{--<span id="profile-label" class="input-group-addon property-label"><g:message code="node.profile.label" default="Profile" /></span>--}%
					<div class="col-sm-10">
						
						<g:select id="profile"
								  name="profile.id"
								  class="form-control"
								  from="${mt.omid.rira.NodeProfile.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeInstance?.profile?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.active}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="active" class="col-sm-2 control-label">Active</label>
					%{--<span id="active-label" class="input-group-addon property-label"><g:message code="node.active.label" default="Active" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="active-label"><g:formatBoolean boolean="${nodeInstance?.active}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.master}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="master" class="col-sm-2 control-label">Master</label>
					%{--<span id="master-label" class="input-group-addon property-label"><g:message code="node.master.label" default="Master" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="master-label"><g:formatBoolean boolean="${nodeInstance?.master}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.connectivityPlans}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="connectivityPlans" class="col-sm-2 control-label">Connectivity Plans</label>
					%{--<span id="connectivityPlans-label" class="input-group-addon property-label"><g:message code="node.connectivityPlans.label" default="Connectivity Plans" /></span>--}%
					<div class="col-sm-10">
						
						<g:select id="connectivityPlans"
								  name="connectivityPlans.id"
								  class="form-control"
								  from="${mt.omid.rira.ConnectivityPlan.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeInstance?.connectivityPlans*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.dateCreated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="dateCreated" class="col-sm-2 control-label">Date Created</label>
					%{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="node.dateCreated.label" default="Date Created" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${nodeInstance?.dateCreated}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.lastUpdated}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="lastUpdated" class="col-sm-2 control-label">Last Updated</label>
					%{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="node.lastUpdated.label" default="Last Updated" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${nodeInstance?.lastUpdated}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.nodeType}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="nodeType" class="col-sm-2 control-label">Node Type</label>
					%{--<span id="nodeType-label" class="input-group-addon property-label"><g:message code="node.nodeType.label" default="Node Type" /></span>--}%
					<div class="col-sm-10">
						
						<p id="nodeType" class="form-control-static disabled" aria-labelledby="nodeType-label"><g:fieldValue bean="${nodeInstance}" field="nodeType"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.os}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="os" class="col-sm-2 control-label">Os</label>
					%{--<span id="os-label" class="input-group-addon property-label"><g:message code="node.os.label" default="Os" /></span>--}%
					<div class="col-sm-10">
						
						<p id="os" class="form-control-static disabled" aria-labelledby="os-label"><g:fieldValue bean="${nodeInstance}" field="os"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.serverType}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="serverType" class="col-sm-2 control-label">Server Type</label>
					%{--<span id="serverType-label" class="input-group-addon property-label"><g:message code="node.serverType.label" default="Server Type" /></span>--}%
					<div class="col-sm-10">
						
						<p id="serverType" class="form-control-static disabled" aria-labelledby="serverType-label"><g:fieldValue bean="${nodeInstance}" field="serverType"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
		</form>
	%{--</ol>--}%
		<g:form url="[resource:nodeInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${nodeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
