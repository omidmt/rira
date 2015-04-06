
<%@ page import="mt.omid.rira.Right" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right.label', default: 'Right')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#list-right" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-right" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="act" title="${message(code: 'right.act.label', default: 'Act')}" />
					
						<g:sortableColumn property="ctrl" title="${message(code: 'right.ctrl.label', default: 'Ctrl')}" />
					
						<th><g:message code="right.applico.label" default="Applico" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${rightInstanceList}" status="i" var="rightInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${rightInstance.id}">${fieldValue(bean: rightInstance, field: "act")}</g:link></td>
					
						<td>${fieldValue(bean: rightInstance, field: "ctrl")}</td>
					
						<td>${fieldValue(bean: rightInstance, field: "applico")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="${rightInstanceCount ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
