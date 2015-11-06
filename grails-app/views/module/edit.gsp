<%@ page import="mt.omid.rira.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
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
		<div id="edit-module" class="content scaffold-edit" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${moduleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${moduleInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="moduleInstance" url="[resource:moduleInstance, action:'update']" method="PUT" class="form-horizontal" role="form" >
				<g:hiddenField name="version" value="${moduleInstance?.version}" />
					<g:render template="form"/>
					<g:actionSubmit class="save" form="moduleInstance" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
    </div>
	</body>
</html>
