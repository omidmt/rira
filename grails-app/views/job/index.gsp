
<%@ page import="mt.omid.rira.Job" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#list-job" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-job" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'job.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'job.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="log" title="${message(code: 'job.log.label', default: 'Log')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'job.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="endTime" title="${message(code: 'job.endTime.label', default: 'End Time')}" />
					
						<g:sortableColumn property="startTime" title="${message(code: 'job.startTime.label', default: 'Start Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobInstanceList}" status="i" var="jobInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${jobInstance.id}">${fieldValue(bean: jobInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: jobInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: jobInstance, field: "log").substr}</td>
					
						<td>${fieldValue(bean: jobInstance, field: "status")}</td>
					
						<td><g:formatDate date="${jobInstance.endTime}" /></td>
                    
						<td><g:formatDate date="${jobInstance.startTime}" /></td>
                    
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${jobInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
