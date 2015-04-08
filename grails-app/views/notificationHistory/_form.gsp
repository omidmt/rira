<div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="notificationHistory.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" maxlength="50" required="" value="${notificationHistoryInstance?.user}"/>
</div>

<div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="notificationHistory.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="message" cols="40" rows="5" maxlength="1000" required="" value="${notificationHistoryInstance?.message}"/>
</div>

<div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'recipients', 'error')} required">
	<label for="recipients">
		<g:message code="notificationHistory.recipients.label" default="Recipients" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="recipients" cols="40" rows="5" maxlength="2000" required="" value="${notificationHistoryInstance?.recipients}"/>
</div>

<div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'sendDate', 'error')} required">
	<label for="sendDate">
		<g:message code="notificationHistory.sendDate.label" default="Send Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="sendDate" precision="day"  value="${notificationHistoryInstance?.sendDate}"  />
</div>
