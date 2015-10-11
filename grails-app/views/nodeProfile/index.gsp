

<%@ page import="mt.omid.rira.NodeProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'nodeProfile.label', default: 'NodeProfile')}" />
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
		<div id="list-nodeProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'nodeProfile.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="baseDir" title="${message(code: 'nodeProfile.baseDir.label', default: 'Base Dir')}" />
					
						<g:sortableColumn property="defaultGroup" title="${message(code: 'nodeProfile.defaultGroup.label', default: 'Default Group')}" />
					
						<g:sortableColumn property="defaultGroupId" title="${message(code: 'nodeProfile.defaultGroupId.label', default: 'Default Group Id')}" />
					
						<g:sortableColumn property="defaultShell" title="${message(code: 'nodeProfile.defaultShell.label', default: 'Default Shell')}" />
					
						<g:sortableColumn property="defaultPasswordMinAge" title="${message(code: 'nodeProfile.defaultPasswordMinAge.label', default: 'Default Password Min Age')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${nodeProfileInstanceList}" status="i" var="nodeProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nodeProfileInstance.id}">${fieldValue(bean: nodeProfileInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: nodeProfileInstance, field: "baseDir")}</td>
					
						<td>${fieldValue(bean: nodeProfileInstance, field: "defaultGroup")}</td>
					
						<td>${fieldValue(bean: nodeProfileInstance, field: "defaultGroupId")}</td>
					
						<td>${fieldValue(bean: nodeProfileInstance, field: "defaultShell")}</td>
					
						<td>${fieldValue(bean: nodeProfileInstance, field: "defaultPasswordMinAge")}</td>
					
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${nodeProfileInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:nodeProfileInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${nodeProfileInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
