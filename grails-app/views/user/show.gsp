<%@ page import="mt.omid.rira.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    %{--<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
    <br/>

    <div class="navbar">
        <div class="nav">
            <ul class="nav nav-pills">
                <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message
                        code="default.home.label"/></a></li>
                <li><g:link class="label label-primary list" action="index"><g:message code="default.list.label"
                                                                                       args="[entityName]"/></g:link></li>
                <li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label"
                                                                                           args="[entityName]"/></g:link></li>
            </ul>
        </div>
    </div>

    <div id="show-user" class="content scaffold-show" role="main">
    %{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
        <g:if test="${flash.message}">
            <div class="alert message" role="status">${flash.message}</div>
        </g:if>
    %{--<ol class="property-list user">--}%
        <form class="form-horizontal" role="form">

            <g:if test="${userInstance?.name}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputname" class="col-sm-2 control-label">name</label>
                    %{--<span id="name-label" class="input-group-addon property-label"><g:message code="user.name.label" default="Name" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue
                                bean="${userInstance}" field="name"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.email}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputemail" class="col-sm-2 control-label">email</label>
                    %{--<span id="email-label" class="input-group-addon property-label"><g:message code="user.email.label" default="Email" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="email-label"><g:fieldValue
                                bean="${userInstance}" field="email"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.description}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdescription" class="col-sm-2 control-label">description</label>
                    %{--<span id="description-label" class="input-group-addon property-label"><g:message code="user.description.label" default="Description" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue
                                bean="${userInstance}" field="description"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.accountExpiry}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputaccountExpiry" class="col-sm-2 control-label">accountExpiry</label>
                    %{--<span id="accountExpiry-label" class="input-group-addon property-label"><g:message code="user.accountExpiry.label" default="Account Expiry" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="accountExpiry-label"><g:formatDate
                                date="${userInstance?.accountExpiry}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.passwordExpiry}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpasswordExpiry" class="col-sm-2 control-label">passwordExpiry</label>
                    %{--<span id="passwordExpiry-label" class="input-group-addon property-label"><g:message code="user.passwordExpiry.label" default="Password Expiry" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="passwordExpiry-label"><g:formatDate
                                date="${userInstance?.passwordExpiry}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.lastLogin}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlastLogin" class="col-sm-2 control-label">lastLogin</label>
                    %{--<span id="lastLogin-label" class="input-group-addon property-label"><g:message code="user.lastLogin.label" default="Last Login" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="lastLogin-label"><g:formatDate
                                date="${userInstance?.lastLogin}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.locked}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlocked" class="col-sm-2 control-label">locked</label>
                    %{--<span id="locked-label" class="input-group-addon property-label"><g:message code="user.locked.label" default="Locked" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="locked-label"><g:formatBoolean
                                boolean="${userInstance?.locked}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.failedLogins}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputfailedLogins" class="col-sm-2 control-label">failedLogins</label>
                    %{--<span id="failedLogins-label" class="input-group-addon property-label"><g:message code="user.failedLogins.label" default="Failed Logins" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="failedLogins-label"><g:fieldValue
                                bean="${userInstance}" field="failedLogins"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.forcePasswordChange}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputforcePasswordChange" class="col-sm-2 control-label">forcePasswordChange</label>
                    %{--<span id="forcePasswordChange-label" class="input-group-addon property-label"><g:message code="user.forcePasswordChange.label" default="Force Password Change" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled"
                           aria-labelledby="forcePasswordChange-label"><g:formatBoolean
                                boolean="${userInstance?.forcePasswordChange}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.roles}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputroles" class="col-sm-2 control-label">roles</label>
                    %{--<span id="roles-label" class="input-group-addon property-label"><g:message code="user.roles.label" default="Roles" /></span>--}%
                    <div class="col-sm-10">

                        <g:each in="${userInstance.roles}" var="r">
                            <p class="form-control-static disabled" aria-labelledby="roles-label"><g:link
                                    controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></p>
                        </g:each>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.notifGroup}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputnotifGroup" class="col-sm-2 control-label">notifGroup</label>
                    %{--<span id="notifGroup-label" class="input-group-addon property-label"><g:message code="user.notifGroup.label" default="Notif Group" /></span>--}%
                    <div class="col-sm-10">

                        <g:each in="${userInstance.notifGroup}" var="n">
                            <p class="form-control-static disabled" aria-labelledby="notifGroup-label"><g:link
                                    controller="notificationGroup" action="show"
                                    id="${n.id}">${n?.encodeAsHTML()}</g:link></p>
                        </g:each>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.phone}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputphone" class="col-sm-2 control-label">phone</label>
                    %{--<span id="phone-label" class="input-group-addon property-label"><g:message code="user.phone.label" default="Phone" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="phone-label"><g:fieldValue
                                bean="${userInstance}" field="phone"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.instantMessaging}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputinstantMessaging" class="col-sm-2 control-label">instantMessaging</label>
                    %{--<span id="instantMessaging-label" class="input-group-addon property-label"><g:message code="user.instantMessaging.label" default="Instant Messaging" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="instantMessaging-label"><g:fieldValue
                                bean="${userInstance}" field="instantMessaging"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.dateCreated}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
                    %{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate
                                date="${userInstance?.dateCreated}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

            <g:if test="${userInstance?.lastUpdated}">
            %{--<li class="fieldcontain">--}%

                <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
                    %{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span>--}%
                    <div class="col-sm-10">

                        <p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate
                                date="${userInstance?.lastUpdated}"/></p>

                    </div>
                    %{--</li>--}%
                </div>
            </g:if>

        </form>
    %{--</ol>--}%
        <g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
            <div class="btn-group">
                <fieldset class="form-group">
                    <g:link class="edit btn btn-default" action="edit" resource="${userInstance}"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                    <g:actionSubmit class="delete btn btn-default" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
