
<%@ page import="mt.omid.rira.ConnectivityPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'connectivityPlan.label', default: 'ConnectivityPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#list-connectivityPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-connectivityPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'connectivityPlan.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="ip" title="${message(code: 'connectivityPlan.ip.label', default: 'Ip')}" />
					
						<g:sortableColumn property="port" title="${message(code: 'connectivityPlan.port.label', default: 'Port')}" />
					
						<g:sortableColumn property="loginMethod" title="${message(code: 'connectivityPlan.loginMethod.label', default: 'Login Method')}" />
					
						<g:sortableColumn property="user" title="${message(code: 'connectivityPlan.user.label', default: 'User')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'connectivityPlan.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${connectivityPlanInstanceList}" status="i" var="connectivityPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${connectivityPlanInstance.id}">${fieldValue(bean: connectivityPlanInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: connectivityPlanInstance, field: "ip")}</td>
					
						<td>${fieldValue(bean: connectivityPlanInstance, field: "port")}</td>
					
						<td>${fieldValue(bean: connectivityPlanInstance, field: "loginMethod")}</td>
					
						<td>${fieldValue(bean: connectivityPlanInstance, field: "user")}</td>
					
                        <td></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${connectivityPlanInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
