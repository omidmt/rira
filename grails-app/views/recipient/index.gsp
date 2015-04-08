<html>
	<head>
		<g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
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
		<div id="list-recipient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
						<g:sortableColumn property="email" title="${message(code: 'recipient.email.label', default: 'Email')}" />
						<g:sortableColumn property="phone" title="${message(code: 'recipient.phone.label', default: 'Phone')}" />
						<g:sortableColumn property="instantMessaging" title="${message(code: 'recipient.instantMessaging.label', default: 'Instant Messaging')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipientInstanceList}" status="i" var="recipientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${recipientInstance.id}">${fieldValue(bean: recipientInstance, field: "email")}</g:link></td>
						<td>${fieldValue(bean: recipientInstance, field: "phone")}</td>
						<td>${fieldValue(bean: recipientInstance, field: "instantMessaging")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipientInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
	</body>
</html>
