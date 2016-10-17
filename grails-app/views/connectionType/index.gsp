

<%@ page import="mt.omid.rira.ConnectionType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'connectionType.label', default: 'ConnectionType')}" />
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
		<div id="list-connectionType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'connectionType.name.label', default: 'Name')}" />
					
						
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${connectionTypeInstanceList}" status="i" var="connectionTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${connectionTypeInstance.id}">${fieldValue(bean: connectionTypeInstance, field: "name")}</g:link></td>
					
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${connectionTypeInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
