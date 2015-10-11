

<%@ page import="mt.omid.rira.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="severity" title="${message(code: 'event.severity.label', default: 'Severity')}" />
					
						<g:sortableColumn property="time" title="${message(code: 'event.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="header" title="${message(code: 'event.header.label', default: 'Header')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'event.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="sender" title="${message(code: 'event.sender.label', default: 'Sender')}" />
					
						<g:sortableColumn property="impact" title="${message(code: 'event.impact.label', default: 'Impact')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "severity")}</g:link></td>
					
						<td><g:formatDate date="${eventInstance.time}" /></td>
                    
						<td>${fieldValue(bean: eventInstance, field: "header")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "sender")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "impact")}</td>
					
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${eventInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
