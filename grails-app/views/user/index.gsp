<html>
<head>
    <meta name="layout" content="rira">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <br/>

    <div class="navbar">
        <div class="nav">
            <ul class="nav nav-pills">
                <li><a class="label label-default home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/></a>
                </li>
                <li><g:link class="label label-primary create" action="create">
                <g:message code="default.new.label" args="[entityName]"/>
                </g:link></li>
            </ul>
        </div>
    </div>

    <div id="list-user" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Name')}"/>
                <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}"/>
                <g:sortableColumn property="description" title="${message(code: 'user.description.label', default: 'Description')}"/>
                <g:sortableColumn property="accountExpiry" title="${message(code: 'user.accountExpiry.label', default: 'Account Expiry')}"/>
                <g:sortableColumn property="passwordExpiry" title="${message(code: 'user.passwordExpiry.label', default: 'Password Expiry')}"/>
                <g:sortableColumn property="lastLogin" title="${message(code: 'user.lastLogin.label', default: 'Last Login')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" status="i" var="userInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "name")}</g:link></td>
                    <td>${fieldValue(bean: userInstance, field: "email")}</td>
                    <td>${fieldValue(bean: userInstance, field: "description")}</td>
                    <td><g:formatDate date="${userInstance.accountExpiry}"/></td>
                    <td><g:formatDate date="${userInstance.passwordExpiry}"/></td>
                    <td><g:formatDate date="${userInstance.lastLogin}"/></td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <ul class="pagination">
            <g:paginate total="${userInstanceCount ?: 0}"/>
        </ul>
    </div>
</div>
</body>
</html>
