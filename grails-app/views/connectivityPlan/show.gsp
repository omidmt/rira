
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
		%{--<a href="#show-connectivityPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list connectivityPlan">--}%
            <form class="form-horizontal" role="form">
			
				<g:if test="${connectivityPlanInstance?.name}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputname" class="col-sm-2 control-label">name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="connectivityPlan.name.label" default="Name" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${connectivityPlanInstance}" field="name"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.ip}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputip" class="col-sm-2 control-label">ip</label>
					%{--<span id="ip-label" class="input-group-addon property-label"><g:message code="connectivityPlan.ip.label" default="Ip" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ip-label"><g:fieldValue bean="${connectivityPlanInstance}" field="ip"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.port}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputport" class="col-sm-2 control-label">port</label>
					%{--<span id="port-label" class="input-group-addon property-label"><g:message code="connectivityPlan.port.label" default="Port" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="port-label"><g:fieldValue bean="${connectivityPlanInstance}" field="port"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.loginMethod}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputloginMethod" class="col-sm-2 control-label">loginMethod</label>
					%{--<span id="loginMethod-label" class="input-group-addon property-label"><g:message code="connectivityPlan.loginMethod.label" default="Login Method" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="loginMethod" class="form-control-static disabled" aria-labelledby="loginMethod-label"><g:fieldValue bean="${connectivityPlanInstance}" field="loginMethod"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.user}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser" class="col-sm-2 control-label">user</label>
					%{--<span id="user-label" class="input-group-addon property-label"><g:message code="connectivityPlan.user.label" default="User" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user-label"><g:fieldValue bean="${connectivityPlanInstance}" field="user"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.password}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassword" class="col-sm-2 control-label">password</label>
					%{--<span id="password-label" class="input-group-addon property-label"><g:message code="connectivityPlan.password.label" default="Password" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.privateKey}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprivateKey" class="col-sm-2 control-label">privateKey</label>
					%{--<span id="privateKey-label" class="input-group-addon property-label"><g:message code="connectivityPlan.privateKey.label" default="Private Key" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="privateKey-label"><g:fieldValue bean="${connectivityPlanInstance}" field="privateKey"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.passphrase}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassphrase" class="col-sm-2 control-label">passphrase</label>
					%{--<span id="passphrase-label" class="input-group-addon property-label"><g:message code="connectivityPlan.passphrase.label" default="Passphrase" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.publicKey}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpublicKey" class="col-sm-2 control-label">publicKey</label>
					%{--<span id="publicKey-label" class="input-group-addon property-label"><g:message code="connectivityPlan.publicKey.label" default="Public Key" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="publicKey-label"><g:fieldValue bean="${connectivityPlanInstance}" field="publicKey"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.node}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputnode" class="col-sm-2 control-label">node</label>
					%{--<span id="node-label" class="input-group-addon property-label"><g:message code="connectivityPlan.node.label" default="Node" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="node-label"><g:link controller="node" action="show" id="${connectivityPlanInstance?.node?.id}">${connectivityPlanInstance?.node?.encodeAsHTML()}</g:link></pjjj>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.dateCreated}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
					%{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="connectivityPlan.dateCreated.label" default="Date Created" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${connectivityPlanInstance?.dateCreated}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${connectivityPlanInstance?.lastUpdated}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
					%{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="connectivityPlan.lastUpdated.label" default="Last Updated" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${connectivityPlanInstance?.lastUpdated}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
            </form>
			%{--</ol>--}%
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
