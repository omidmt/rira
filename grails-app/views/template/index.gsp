
<%@ page import="mt.omid.rira.ntfy.Template" %>
<!DOCTYPE html>
<html>
	<head>
		%{--<meta name="layout" content="main">--}%
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#list-template" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-template" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'template.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'template.content.label', default: 'Content')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${templateInstanceList}" status="i" var="templateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${templateInstance.id}">${fieldValue(bean: templateInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: templateInstance, field: "content")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${templateInstanceCount ?: 0}" />
			</div>
		</div>
    </div>
	</body>
</html>
