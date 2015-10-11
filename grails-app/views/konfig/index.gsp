

<%@ page import="mt.omid.rira.Konfig" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'konfig.label', default: 'Konfig')}" />
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
					<li><g:link class="label label-warning" action="refreshCache">Refresh Cache</g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-konfig" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="key" title="${message(code: 'konfig.key.label', default: 'Key')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'konfig.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="group" title="${message(code: 'konfig.group.label', default: 'Group')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'konfig.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'konfig.lastUpdated.label', default: 'Last Updated')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${konfigInstanceList}" status="i" var="konfigInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${konfigInstance.id}">${fieldValue(bean: konfigInstance, field: "key")}</g:link></td>
					
						<td>${fieldValue(bean: konfigInstance, field: "value")}</td>
					
						<td>${fieldValue(bean: konfigInstance, field: "group")}</td>
					
						<td><g:formatDate date="${konfigInstance.dateCreated}" /></td>
                    
						<td><g:formatDate date="${konfigInstance.lastUpdated}" /></td>
                    
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${konfigInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:konfigInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${konfigInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
