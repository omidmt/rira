<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="navbar">
        <div class="nav">
            <ul class="nav nav-pills">
                <li><a class="label label-default home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/></a></li>
                <li><g:link class="label label-primary  list" action="index">
                <g:message code="default.list.label" args="[entityName]"/>
                </g:link></li>
                <li><g:link class="label label-primary  create" action="create">
                <g:message code="default.new.label" args="[entityName]"/>
                </g:link></li>
            </ul>
        </div>
    </div>

    <div id="edit-user" class="content scaffold-edit" role="main">
        <g:if test="${flash.message}">
            <div class="alert message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${userInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}"/>
                    </li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource: userInstance, action: 'update']" method="PUT">
            <g:hiddenField name="version" value="${userInstance?.version}"/>
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <fieldset class="form-group">
                <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
