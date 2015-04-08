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
						<g:sortableColumn property="nodeType" title="${message(code: 'node.nodeType.label', default: 'Node Type')}" />
						<g:sortableColumn property="serverType" title="${message(code: 'node.serverType.label', default: 'Server Type')}" />
						<g:sortableColumn property="loginMethod" title="${message(code: 'node.loginMethod.label', default: 'Login Method')}" />
						<g:sortableColumn property="os" title="${message(code: 'node.os.label', default: 'Os')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${nodeInstanceList}" status="i" var="nodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${nodeInstance.id}">${fieldValue(bean: nodeInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: nodeInstance, field: "profile")}</td>
						<td>${fieldValue(bean: nodeInstance, field: "nodeType")}</td>
						<td>${fieldValue(bean: nodeInstance, field: "serverType")}</td>
						<td>${fieldValue(bean: nodeInstance, field: "loginMethod")}</td>
						<td>${fieldValue(bean: nodeInstance, field: "os")}</td>
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
