<%@ page import="mt.omid.rira.ntfy.Recipient" %>
    <div class="form-group ${hasErrors(bean: recipientInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="recipient.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="45" required="" value="${recipientInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: recipientInstance, field: 'email', 'error')} required">
        <label for="email" class="col-sm-3 control-label">
            <g:message code="recipient.email.label" default="Email" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field type="email" name="email" class="form-control"  required="" value="${recipientInstance?.email}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: recipientInstance, field: 'phone', 'error')} ">
        <label for="phone" class="col-sm-3 control-label">
            <g:message code="recipient.phone.label" default="Phone" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="phone" class="form-control"  pattern="${recipientInstance.constraints.phone.matches}" value="${recipientInstance?.phone}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: recipientInstance, field: 'instantMessaging', 'error')} ">
        <label for="instantMessaging" class="col-sm-3 control-label">
            <g:message code="recipient.instantMessaging.label" default="Instant Messaging" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="instantMessaging" class="form-control"  value="${recipientInstance?.instantMessaging}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: recipientInstance, field: 'notifGroup', 'error')} ">
        <label for="notifGroup" class="col-sm-3 control-label">
            <g:message code="recipient.notifGroup.label" default="Notif Group" />
        </label>
		<div class="col-sm-6">
            <g:select name="notifGroup" from="${mt.omid.rira.ntfy.NotificationGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${recipientInstance?.notifGroup*.id}" class="many-to-many"/>
		</div>
    </div>

