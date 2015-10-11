

<%@ page import="mt.omid.rira.Audit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'audit.label', default: 'Audit')}" />
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
		<div id="list-audit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="dateTime" title="${message(code: 'audit.dateTime.label', default: 'Date Time')}" />
					
						<g:sortableColumn property="user" title="${message(code: 'audit.user.label', default: 'User')}" />
					
						<g:sortableColumn property="origin" title="${message(code: 'audit.origin.label', default: 'Origin')}" />
					
						<g:sortableColumn property="message" title="${message(code: 'audit.message.label', default: 'Message')}" />
					
						
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${auditInstanceList}" status="i" var="auditInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${auditInstance.id}">${fieldValue(bean: auditInstance, field: "dateTime")}</g:link></td>
					
						<td>${fieldValue(bean: auditInstance, field: "user")}</td>
					
						<td>${fieldValue(bean: auditInstance, field: "origin")}</td>
					
						<td>${fieldValue(bean: auditInstance, field: "message")}</td>
					
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${auditInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
