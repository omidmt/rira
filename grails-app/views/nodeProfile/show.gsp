
<%@ page import="mt.omid.rira.NodeProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
                    <label for="inputname" class="col-sm-2 control-label">name</label>
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
                    <label for="inputbaseDir" class="col-sm-2 control-label">baseDir</label>
					%{--<span id="baseDir-label" class="input-group-addon property-label"><g:message code="nodeProfile.baseDir.label" default="Base Dir" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="baseDir-label"><g:fieldValue bean="${nodeProfileInstance}" field="baseDir"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.primaryGroup}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprimaryGroup" class="col-sm-2 control-label">primaryGroup</label>
					%{--<span id="primaryGroup-label" class="input-group-addon property-label"><g:message code="nodeProfile.primaryGroup.label" default="Primary Group" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="primaryGroup-label"><g:fieldValue bean="${nodeProfileInstance}" field="primaryGroup"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.groupId}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputgroupId" class="col-sm-2 control-label">groupId</label>
					%{--<span id="groupId-label" class="input-group-addon property-label"><g:message code="nodeProfile.groupId.label" default="Group Id" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="groupId-label"><g:fieldValue bean="${nodeProfileInstance}" field="groupId"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.defaultShell}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdefaultShell" class="col-sm-2 control-label">defaultShell</label>
					%{--<span id="defaultShell-label" class="input-group-addon property-label"><g:message code="nodeProfile.defaultShell.label" default="Default Shell" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="defaultShell-label"><g:fieldValue bean="${nodeProfileInstance}" field="defaultShell"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.passwordMinAge}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpasswordMinAge" class="col-sm-2 control-label">passwordMinAge</label>
					%{--<span id="passwordMinAge-label" class="input-group-addon property-label"><g:message code="nodeProfile.passwordMinAge.label" default="Password Min Age" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="passwordMinAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordMinAge"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.passwordMaxAge}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpasswordMaxAge" class="col-sm-2 control-label">passwordMaxAge</label>
					%{--<span id="passwordMaxAge-label" class="input-group-addon property-label"><g:message code="nodeProfile.passwordMaxAge.label" default="Password Max Age" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="passwordMaxAge-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordMaxAge"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeProfileInstance?.passwordWarning}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpasswordWarning" class="col-sm-2 control-label">passwordWarning</label>
					%{--<span id="passwordWarning-label" class="input-group-addon property-label"><g:message code="nodeProfile.passwordWarning.label" default="Password Warning" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="passwordWarning-label"><g:fieldValue bean="${nodeProfileInstance}" field="passwordWarning"/></p>
                    
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
