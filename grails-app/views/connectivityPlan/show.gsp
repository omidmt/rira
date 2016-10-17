
<%@ page import="mt.omid.rira.ConnectivityPlan" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'connectivityPlan.label', default: 'ConnectivityPlan')}" />
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
	<div id="show-connectivityPlan" class="content scaffold-show" role="main">
		<form class="form-horizontal" role="form">
			
			<g:if test="${connectivityPlanInstance?.name}">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.name.label" default="Name" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${connectivityPlanInstance}" field="name"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.ip}">
				<div class="form-group">
					<label for="ip" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.ip.label" default="Ip" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="ip-label"><g:fieldValue bean="${connectivityPlanInstance}" field="ip"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.port}">
				<div class="form-group">
					<label for="port" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.port.label" default="Port" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="port-label"><g:fieldValue bean="${connectivityPlanInstance}" field="port"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.type}">
				<div class="form-group">
					<label for="type" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.type.label" default="Type" /></label>
					<div class="col-sm-10">
						
						<g:select id="type"
								  name="type.id"
								  class="form-control"
								  from="${mt.omid.rira.ConnectionType.list()}"
								  optionKey="id"
								  size="10"
								  value="${connectivityPlanInstance?.type?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.user}">
				<div class="form-group">
					<label for="user" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.user.label" default="User" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="user-label"><g:fieldValue bean="${connectivityPlanInstance}" field="user"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.password}">
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.password.label" default="Password" /></label>
					<div class="col-sm-10">
						
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.privateKey}">
				<div class="form-group">
					<label for="privateKey" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.privateKey.label" default="Private Key" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="privateKey-label"><g:fieldValue bean="${connectivityPlanInstance}" field="privateKey"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.passphrase}">
				<div class="form-group">
					<label for="passphrase" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.passphrase.label" default="Passphrase" /></label>
					<div class="col-sm-10">
						
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.publicKey}">
				<div class="form-group">
					<label for="publicKey" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.publicKey.label" default="Public Key" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="publicKey-label"><g:fieldValue bean="${connectivityPlanInstance}" field="publicKey"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.certificate}">
				<div class="form-group">
					<label for="certificate" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.certificate.label" default="Certificate" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="certificate-label"><g:fieldValue bean="${connectivityPlanInstance}" field="certificate"/></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.node}">
				<div class="form-group">
					<label for="node" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.node.label" default="Node" /></label>
					<div class="col-sm-10">
						
						<g:select id="node"
								  name="node.id"
								  class="form-control"
								  from="${mt.omid.rira.Node.list()}"
								  optionKey="id"
								  size="10"
								  value="${connectivityPlanInstance?.node?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.dateCreated}">
				<div class="form-group">
					<label for="dateCreated" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.dateCreated.label" default="Date Created" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${connectivityPlanInstance?.dateCreated}" /></p>
						
					</div>
				</div>
			</g:if>
			
			<g:if test="${connectivityPlanInstance?.lastUpdated}">
				<div class="form-group">
					<label for="lastUpdated" class="col-sm-2 control-label"><g:message code="ConnectivityPlan.lastUpdated.label" default="Last Updated" /></label>
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${connectivityPlanInstance?.lastUpdated}" /></p>
						
					</div>
				</div>
			</g:if>
			
		</form>
		<g:form url="[resource:connectivityPlanInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${connectivityPlanInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
