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