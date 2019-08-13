<%@ page import="mt.omid.rira.ntfy.NotificationHistory" %>
<!DOCTYPE html>
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
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="user" title="${message(code: 'notificationHistory.user.label', default: 'User')}" />
					
						<g:sortableColumn property="message" title="${message(code: 'notificationHistory.message.label', default: 'Message')}" />
					
						<g:sortableColumn property="recipients" title="${message(code: 'notificationHistory.recipients.label', default: 'Recipients')}" />
					
						<g:sortableColumn property="sendDate" title="${message(code: 'notificationHistory.sendDate.label', default: 'Send Date')}" />
					
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${notificationHistoryInstanceList}" status="i" var="notificationHistoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${notificationHistoryInstance.id}">${fieldValue(bean: notificationHistoryInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: notificationHistoryInstance, field: "message")}</td>
					
						<td>${fieldValue(bean: notificationHistoryInstance, field: "recipients")}</td>
					
						<td><g:formatDate date="${notificationHistoryInstance.sendDate}" /></td>
                    
					
					
						<td class="text-center">
						<g:form url="[resource:notificationHistoryInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${notificationHistoryInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
