
<%@ page import="mt.omid.rira.DataConnection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'dataConnection.label', default: 'DataConnection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#list-dataConnection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-dataConnection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'dataConnection.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dsClass" title="${message(code: 'dataConnection.dsClass.label', default: 'Ds Class')}" />
					
						<g:sortableColumn property="driver" title="${message(code: 'dataConnection.driver.label', default: 'Driver')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'dataConnection.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'dataConnection.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'dataConnection.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dataConnectionInstanceList}" status="i" var="dataConnectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dataConnectionInstance.id}">${fieldValue(bean: dataConnectionInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: dataConnectionInstance, field: "dsClass")}</td>
					
						<td>${fieldValue(bean: dataConnectionInstance, field: "driver")}</td>
					
						<td>${fieldValue(bean: dataConnectionInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: dataConnectionInstance, field: "username")}</td>
					
                        <td></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${dataConnectionInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
