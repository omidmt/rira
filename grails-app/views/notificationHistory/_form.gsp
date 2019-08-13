<%@ page import="mt.omid.rira.ntfy.NotificationHistory" %>
    <div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'user', 'error')} required">
        <label for="user" class="col-sm-3 control-label">
            <g:message code="notificationHistory.user.label" default="User" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="user" class="form-control"  maxlength="50" required="" value="${notificationHistoryInstance?.user}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'message', 'error')} required">
        <label for="message" class="col-sm-3 control-label">
            <g:message code="notificationHistory.message.label" default="Message" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="message" cols="40" rows="5" maxlength="1000" required="" value="${notificationHistoryInstance?.message}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'recipients', 'error')} required">
        <label for="recipients" class="col-sm-3 control-label">
            <g:message code="notificationHistory.recipients.label" default="Recipients" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="recipients" cols="40" rows="5" maxlength="2000" required="" value="${notificationHistoryInstance?.recipients}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: notificationHistoryInstance, field: 'sendDate', 'error')} required">
        <label for="sendDate" class="col-sm-3 control-label">
            <g:message code="notificationHistory.sendDate.label" default="Send Date" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<input type=text name="sendDate" id="sendDate" precision="day" value="${notificationHistoryInstance?.sendDate?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

