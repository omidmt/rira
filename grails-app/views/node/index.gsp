

<%@ page import="mt.omid.rira.Node" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
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
		<div id="list-node" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'node.name.label', default: 'Name')}" />
					
						<th><g:message code="node.profile.label" default="Profile" /></th>
					
						<g:sortableColumn property="active" title="${message(code: 'node.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="master" title="${message(code: 'node.master.label', default: 'Master')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'node.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'node.lastUpdated.label', default: 'Last Updated')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${nodeInstanceList}" status="i" var="nodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nodeInstance.id}">${fieldValue(bean: nodeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: nodeInstance, field: "profile")}</td>
					
						<td><g:formatBoolean boolean="${nodeInstance.active}" /></td>
					
						<td><g:formatBoolean boolean="${nodeInstance.master}" /></td>
					
						<td><g:formatDate date="${nodeInstance.dateCreated}" /></td>
                    
						<td><g:formatDate date="${nodeInstance.lastUpdated}" /></td>
                    
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${nodeInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:nodeInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${nodeInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
