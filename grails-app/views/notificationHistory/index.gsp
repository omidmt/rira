<html>
	<head>
		<g:set var="entityName" value="${message(code: 'notificationHistory.label', default: 'NotificationHistory')}" />
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
		<div id="list-notificationHistory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
						<g:sortableColumn property="user" title="${message(code: 'notificationHistory.user.label', default: 'User')}" />
						<g:sortableColumn property="message" title="${message(code: 'notificationHistory.message.label', default: 'Message')}" />
						<g:sortableColumn property="recipients" title="${message(code: 'notificationHistory.recipients.label', default: 'Recipients')}" />
						<g:sortableColumn property="sendDate" title="${message(code: 'notificationHistory.sendDate.label', default: 'Send Date')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${notificationHistoryInstanceList}" status="i" var="notificationHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${notificationHistoryInstance.id}">${fieldValue(bean: notificationHistoryInstance, field: "user")}</g:link></td>
						<td>${fieldValue(bean: notificationHistoryInstance, field: "message")}</td>
						<td>${fieldValue(bean: notificationHistoryInstance, field: "recipients")}</td>
						<td><g:formatDate date="${notificationHistoryInstance.sendDate}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${notificationHistoryInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
	</body>
</html>
