

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
					
						
						<th></th>
						
						
						<th></th>
						
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
					
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${dataConnectionInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:dataConnectionInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
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
