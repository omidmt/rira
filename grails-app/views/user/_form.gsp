<%@ page import="mt.omid.rira.User" %>



<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="user.name.label" default="Name"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" maxlength="100" required="" value="${userInstance?.name}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
        <label for="email">
            <g:message code="user.email.label" default="Email"/>
            <span class="required-indicator">*</span>
        </label>
        <g:field type="email" name="email" required="" value="${userInstance?.email}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
        <label for="password">
            <g:message code="user.password.label" default="Password"/>

        </label>
        <g:field type="password" name="password" maxlength="255"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'passwordConfirmation', 'error')} ">
        <label for="passwordConfirmation">
            <g:message code="user.passwordConfirmation.label" default="Password Confirmation"/>

        </label>
        <g:field type="password" name="passwordConfirmation"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
        <label for="description">
            <g:message code="user.description.label" default="Description"/>

        </label>
        <g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${userInstance?.description}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'accountExpiry', 'error')} ">
        <label for="accountExpiry">
            <g:message code="user.accountExpiry.label" default="Account Expiry"/>

        </label>
        <input type=text name="accountExpiry" id="accountExpiry" precision="day"
               value="${userInstance?.accountExpiry?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'passwordExpiry', 'error')} ">
        <label for="passwordExpiry">
            <g:message code="user.passwordExpiry.label" default="Password Expiry"/>

        </label>
        <input type=text name="passwordExpiry" id="passwordExpiry" precision="day"
               value="${userInstance?.passwordExpiry?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'lastLogin', 'error')} ">
        <label for="lastLogin">
            <g:message code="user.lastLogin.label" default="Last Login"/>

        </label>
        <input type=text name="lastLogin" id="lastLogin" precision="day"
               value="${userInstance?.lastLogin?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'locked', 'error')} ">
        <label for="locked">
            <g:message code="user.locked.label" default="Locked"/>

        </label>
        <g:checkBox name="locked" value="${userInstance?.locked}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'failedLogins', 'error')} required">
        <label for="failedLogins">
            <g:message code="user.failedLogins.label" default="Failed Logins"/>
            <span class="required-indicator">*</span>
        </label>
        <g:field name="failedLogins" type="number" value="${userInstance.failedLogins}" required=""/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'forcePasswordChange', 'error')} ">
        <label for="forcePasswordChange">
            <g:message code="user.forcePasswordChange.label" default="Force Password Change"/>

        </label>
        <g:checkBox name="forcePasswordChange" value="${userInstance?.forcePasswordChange}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
        <label for="roles">
            <g:message code="user.roles.label" default="Roles"/>

        </label>
        <g:select name="roles" from="${mt.omid.rira.Role.list()}" multiple="multiple" optionKey="id" size="5"
                  value="${userInstance?.roles*.id}" class="many-to-many"/><div class="new-item"><a
            class="new-item-link" href="/Role/create">New roles</a></div>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'notifGroup', 'error')} ">
        <label for="notifGroup">
            <g:message code="user.notifGroup.label" default="Notif Group"/>

        </label>
        <g:select name="notifGroup" from="${mt.omid.rira.ntfy.NotificationGroup.list()}" multiple="multiple"
                  optionKey="id" size="5" value="${userInstance?.notifGroup*.id}" class="many-to-many"/><div
            class="new-item"><a class="new-item-link" href="/NotificationGroup/create">New notifGroup</a></div>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
        <label for="phone">
            <g:message code="user.phone.label" default="Phone"/>

        </label>
        <g:textField name="phone" pattern="${userInstance.constraints.phone.matches}" value="${userInstance?.phone}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'instantMessaging', 'error')} ">
        <label for="instantMessaging">
            <g:message code="user.instantMessaging.label" default="Instant Messaging"/>

        </label>
        <g:textField name="instantMessaging" value="${userInstance?.instantMessaging}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'applicos', 'error')} ">
        <label for="applicos">
            <g:message code="user.applicos.label" default="Applicos"/>

        </label>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: userInstance, field: 'rights', 'error')} ">
        <label for="rights">
            <g:message code="user.rights.label" default="Rights"/>

        </label>

    </div>
</div>

