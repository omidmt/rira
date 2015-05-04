
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
		%{--<a href="#list-node" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
