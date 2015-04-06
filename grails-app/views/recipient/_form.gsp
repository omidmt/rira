<%@ page import="mt.omid.rira.ntfy.Recipient" %>



<div class="form-group ${hasErrors(bean: recipientInstance, field: 'name', 'error')}">
    <label for="name">
        <g:message code="recipient.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${recipientInstance?.name}"/>

</div>

<div class="form-group ${hasErrors(bean: recipientInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="recipient.email.label" default="Email" />
        <span class="required-indicator">*</span>
    </label>
    <g:field type="email" name="email" required="" value="${recipientInstance?.email}"/>

</div>

<div class="form-group ${hasErrors(bean: recipientInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="recipient.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" pattern="${recipientInstance.constraints.phone.matches}" value="${recipientInstance?.phone}"/>

</div>

<div class="form-group ${hasErrors(bean: recipientInstance, field: 'instantMessaging', 'error')} ">
	<label for="instantMessaging">
		<g:message code="recipient.instantMessaging.label" default="Instant Messaging" />
		
	</label>
	<g:textField name="instantMessaging" value="${recipientInstance?.instantMessaging}"/>

</div>

<div class="form-group ${hasErrors(bean: recipientInstance, field: 'notifGroup', 'error')} ">
	<label for="notifGroup">
		<g:message code="recipient.notifGroup.label" default="Notif Group" />
		
	</label>
	<g:select name="notifGroup" from="${mt.omid.rira.ntfy.NotificationGroup.list()}" multiple="multiple" optionKey="id" size="5" value="${recipientInstance?.notifGroup*.id}" class="many-to-many"/>

</div>

