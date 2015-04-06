
<%@ page import="mt.omid.rira.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#show-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
		<div id="show-job" class="content scaffold-show" role="main">
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list job">--}%
            <form class="form-horizontal" role="form">
			
				<g:if test="${jobInstance?.name}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputname" class="col-sm-2 control-label">Job Name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="job.name.label" default="Name" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${jobInstance}" field="name"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${jobInstance?.description}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdescription" class="col-sm-2 control-label">Description</label>
					%{--<span id="description-label" class="input-group-addon property-label"><g:message code="job.description.label" default="Description" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue bean="${jobInstance}" field="description"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${jobInstance?.log}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlog" class="col-sm-2 control-label">Log</label>
					%{--<span id="log-label" class="input-group-addon property-label"><g:message code="job.log.label" default="Log" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="log-label"><g:textArea disabled="true" rows="10" cols="50" name="log" value="${jobInstance?.log}"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${jobInstance?.status}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputstatus" class="col-sm-2 control-label">Status</label>
					%{--<span id="status-label" class="input-group-addon property-label"><g:message code="job.status.label" default="Status" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="status2" class="form-control-static disabled" aria-labelledby="status-label"><g:fieldValue bean="${jobInstance}" field="status"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${jobInstance?.endTime}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputendTime" class="col-sm-2 control-label">End Time</label>
					%{--<span id="endTime-label" class="input-group-addon property-label"><g:message code="job.endTime.label" default="End Time" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="endTime-label"><g:formatDate date="${jobInstance?.endTime}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${jobInstance?.startTime}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputstartTime" class="col-sm-2 control-label">Start Time</label>
					%{--<span id="startTime-label" class="input-group-addon property-label"><g:message code="job.startTime.label" default="Start Time" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="startTime-label"><g:formatDate date="${jobInstance?.startTime}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
            </form>
			%{--</ol>--}%
			%{--<g:form url="[resource:jobInstance, action:'delete']" method="DELETE">--}%
                %{--<div class="btn-group">--}%
                %{--<fieldset class="form-group">--}%
					%{--<g:link class="edit btn btn-default" action="edit" resource="${jobInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
					%{--<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				%{--</fieldset>--}%
                %{--</div>--}%
			%{--</g:form>--}%
		</div>
    </div>
	</body>
</html>
