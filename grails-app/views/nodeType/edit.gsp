<%@ page import="mt.omid.rira.NodeType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'nodeType.label', default: 'NodeType')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary  list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="edit-nodeType" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${nodeTypeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${nodeTypeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="nodeTypeInstance" url="[resource:nodeTypeInstance, action:'update']" method="PUT" class="form-horizontal" role="form" >
				<g:hiddenField name="version" value="${nodeTypeInstance?.version}" />
					<g:render template="form"/>
					<g:actionSubmit class="save" form="nodeTypeInstance" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
    </div>
	</body>
</html>
