

<%@ page import="mt.omid.rira.Invitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'invitation.label', default: 'Invitation')}" />
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
		<div id="list-invitation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'invitation.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'invitation.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="accountExpiry" title="${message(code: 'invitation.accountExpiry.label', default: 'Account Expiry')}" />
					
						<th><g:message code="invitation.role.label" default="Role" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'invitation.dateCreated.label', default: 'Date Created')}" />
					
						
						<th></th>
						
						
						<th></th>
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${invitationInstanceList}" status="i" var="invitationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${invitationInstance.id}">${fieldValue(bean: invitationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: invitationInstance, field: "email")}</td>
					
						<td><g:formatDate date="${invitationInstance.accountExpiry}" /></td>
                    
						<td>${fieldValue(bean: invitationInstance, field: "role")}</td>
					
						<td><g:formatDate date="${invitationInstance.dateCreated}" /></td>
                    
					
						<td class="text-center">
							<g:link action="clone" role="button" resource="${invitationInstance}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					
					
						<td class="text-center">
						<g:form url="[resource:invitationInstance, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${invitationInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
