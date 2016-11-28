<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'notificationGroup.label', default: 'NotificationGroup')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="create-notificationGroup" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:hasErrors bean="${notificationGroupInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${notificationGroupInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="notificationGroupInstance" url="[resource:notificationGroupInstance, action:'save']"  class="form-horizontal" role="form" >
					<g:render template="form"/>
					<g:submitButton name="create" form="notificationGroupInstance" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
    </div>
	</body>
</html>
