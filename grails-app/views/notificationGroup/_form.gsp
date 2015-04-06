<%@ page import="mt.omid.rira.ntfy.NotificationGroup" %>



<div class="form-group ${hasErrors(bean: notificationGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="notificationGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${notificationGroupInstance?.name}"/>

</div>

<div class="form-group ${hasErrors(bean: notificationGroupInstance, field: 'recipients', 'error')} ">
	<label for="recipients">
		<g:message code="notificationGroup.recipients.label" default="Recipients" />
		
	</label>
	<g:select name="recipients" from="${mt.omid.rira.ntfy.Recipient.list()}" multiple="multiple" optionKey="id" size="5" value="${notificationGroupInstance?.recipients*.id}" class="many-to-many"/>

</div>

