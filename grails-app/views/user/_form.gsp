<%@ page import="mt.omid.rira.User" %>



    <div class="form-group ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="user.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${userInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
        <label for="email" class="col-sm-3 control-label">
            <g:message code="user.email.label" default="Email" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field type="email" name="email" class="form-control"  required="" value="${userInstance?.email}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
        <label for="password" class="col-sm-3 control-label">
            <g:message code="user.password.label" default="Password" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="password" class="form-control"  maxlength="255"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'passwordConfirmation', 'error')} ">
        <label for="passwordConfirmation" class="col-sm-3 control-label">
            <g:message code="user.passwordConfirmation.label" default="Password Confirmation" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="passwordConfirmation" class="form-control" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'description', 'error')} ">
        <label for="description" class="col-sm-3 control-label">
            <g:message code="user.description.label" default="Description" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${userInstance?.description}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'accountExpiry', 'error')} ">
        <label for="accountExpiry" class="col-sm-3 control-label">
            <g:message code="user.accountExpiry.label" default="Account Expiry" />
            
        </label>
		<div class="col-sm-6">
        	<input type=text name="accountExpiry" id="accountExpiry" precision="day" value="${userInstance?.accountExpiry?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpiry', 'error')} ">
        <label for="passwordExpiry" class="col-sm-3 control-label">
            <g:message code="user.passwordExpiry.label" default="Password Expiry" />
            
        </label>
		<div class="col-sm-6">
        	<input type=text name="passwordExpiry" id="passwordExpiry" precision="day" value="${userInstance?.passwordExpiry?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'lastLogin', 'error')} ">
        <label for="lastLogin" class="col-sm-3 control-label">
            <g:message code="user.lastLogin.label" default="Last Login" />
            
        </label>
		<div class="col-sm-6">
        	<input type=text name="lastLogin" id="lastLogin" precision="day" value="${userInstance?.lastLogin?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'locked', 'error')} ">
        <label for="locked" class="col-sm-3 control-label">
            <g:message code="user.locked.label" default="Locked" />
            
        </label>
		<div class="col-sm-6">
        	<g:checkBox name="locked" value="${userInstance?.locked}" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'failedLogins', 'error')} required">
        <label for="failedLogins" class="col-sm-3 control-label">
            <g:message code="user.failedLogins.label" default="Failed Logins" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="failedLogins" class="form-control"  type="number" value="${userInstance.failedLogins}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'forcePasswordChange', 'error')} ">
        <label for="forcePasswordChange" class="col-sm-3 control-label">
            <g:message code="user.forcePasswordChange.label" default="Force Password Change" />
            
        </label>
		<div class="col-sm-6">
        	<g:checkBox name="forcePasswordChange" value="${userInstance?.forcePasswordChange}" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
        <label for="phone" class="col-sm-3 control-label">
            <g:message code="user.phone.label" default="Phone" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="phone" class="form-control"  pattern="${userInstance.constraints.phone.matches}" value="${userInstance?.phone}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'instantMessaging', 'error')} ">
        <label for="instantMessaging" class="col-sm-3 control-label">
            <g:message code="user.instantMessaging.label" default="Instant Messaging" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="instantMessaging" class="form-control"  value="${userInstance?.instantMessaging}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'notifGroup', 'error')} ">
        <label for="notifGroup" class="col-sm-3 control-label">
            <g:message code="user.notifGroup.label" default="Notif Group" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="notifGroup" class="form-control"  from="${mt.omid.rira.ntfy.NotificationGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.notifGroup*.id}" class="many-to-many"/>
<div class="new-item"><a class="new-item-link" href="#" data-toggle="modal" data-target="#rDialog" onclick="loadDialog( '${request.contextPath}/NotificationGroup/createEmbeded', '#notifGroup' )"> New Notification Group</a></div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'roles', 'error')} ">
        <label for="roles" class="col-sm-3 control-label">
            <g:message code="user.roles.label" default="Roles" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="roles" class="form-control"  from="${mt.omid.rira.Role.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.roles*.id}" class="many-to-many"/>
<div class="new-item"><a class="new-item-link" href="#" data-toggle="modal" data-target="#rDialog" onclick="loadDialog( '${request.contextPath}/Role/createEmbeded', '#roles' )"> New Role</a></div>

		</div>
    </div>

