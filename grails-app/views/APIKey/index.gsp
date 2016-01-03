

<%@ page import="mt.omid.rira.APIKey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'APIKey.label', default: 'APIKey')}" />
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
		<div id="list-APIKey" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<th><g:message code="APIKey.user.label" default="User" /></th>
					
						<g:sortableColumn property="allowedIPs" title="${message(code: 'APIKey.allowedIPs.label', default: 'Allowed IP s')}" />
					
						<g:sortableColumn property="maxPerDay" title="${message(code: 'APIKey.maxPerDay.label', default: 'Max Per Day')}" />
					
						<g:sortableColumn property="maxPerMonth" title="${message(code: 'APIKey.maxPerMonth.label', default: 'Max Per Month')}" />
					
						<g:sortableColumn property="totalMax" title="${message(code: 'APIKey.totalMax.label', default: 'Total Max')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${APIKeyInstanceList}" status="i" var="APIKeyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${APIKeyInstance.id}">${fieldValue(bean: APIKeyInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: APIKeyInstance, field: "allowedIPs")}</td>
					
						<td>${fieldValue(bean: APIKeyInstance, field: "maxPerDay")}</td>
					
						<td>${fieldValue(bean: APIKeyInstance, field: "maxPerMonth")}</td>
					
						<td>${fieldValue(bean: APIKeyInstance, field: "totalMax")}</td>
					
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${APIKeyInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:APIKeyInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${APIKeyInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
