
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
		<form class="form-horizontal" role="form">
			
			<g:if test="${nodeInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.profile}">
				<div class="form-group">
					<label for="profile" class="col-sm-2 control-label">Profile</label>
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
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.active}">
				<div class="form-group">
					<label for="active" class="col-sm-2 control-label">Active</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="active-label"><g:formatBoolean boolean="${nodeInstance?.active}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.master}">
				<div class="form-group">
					<label for="master" class="col-sm-2 control-label">Master</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="master-label"><g:formatBoolean boolean="${nodeInstance?.master}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.connectivityPlans}">
				<div class="form-group">
					<label for="connectivityPlans" class="col-sm-2 control-label">Connectivity Plans</label>
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
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.dateCreated}">
				<div class="form-group">
					<label for="dateCreated" class="col-sm-2 control-label">Date Created</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${nodeInstance?.dateCreated}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.lastUpdated}">
				<div class="form-group">
					<label for="lastUpdated" class="col-sm-2 control-label">Last Updated</label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${nodeInstance?.lastUpdated}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.nodeType}">
				<div class="form-group">
					<label for="nodeType" class="col-sm-2 control-label">Node Type</label>
					<div class="col-sm-10">
						
						<g:select id="nodeType"
								  name="nodeType.id"
								  class="form-control"
								  from="${mt.omid.rira.NodeType.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeInstance?.nodeType?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.os}">
				<div class="form-group">
					<label for="os" class="col-sm-2 control-label">Os</label>
					<div class="col-sm-10">
						
						<g:select id="os"
								  name="os.id"
								  class="form-control"
								  from="${mt.omid.rira.OS.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeInstance?.os?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${nodeInstance?.serverType}">
				<div class="form-group">
					<label for="serverType" class="col-sm-2 control-label">Server Type</label>
					<div class="col-sm-10">
						
						<g:select id="serverType"
								  name="serverType.id"
								  class="form-control"
								  from="${mt.omid.rira.ServerType.list()}"
								  optionKey="id"
								  size="10"
								  value="${nodeInstance?.serverType?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
		</form>
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
