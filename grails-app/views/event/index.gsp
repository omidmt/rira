
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
		%{--<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
					
						<g:sortableColumn property="time" title="${message(code: 'event.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="header" title="${message(code: 'event.header.label', default: 'Header')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'event.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="sender" title="${message(code: 'event.sender.label', default: 'Sender')}" />
					
						<g:sortableColumn property="impact" title="${message(code: 'event.impact.label', default: 'Impact')}" />
					
						<g:sortableColumn property="resolution" title="${message(code: 'event.resolution.label', default: 'Resolution')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "time")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "header")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "sender")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "impact")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "resolution")}</td>
					
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
