<%@ page import="mt.omid.rira.ntfy.NotificationGroup" %>



    <div class="form-group ${hasErrors(bean: notificationGroupInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="notificationGroup.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${notificationGroupInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: notificationGroupInstance, field: 'recipients', 'error')} ">
        <label for="recipients" class="col-sm-3 control-label">
            <g:message code="notificationGroup.recipients.label" default="Recipients" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="recipients" class="form-control"  from="${mt.omid.rira.ntfy.Recipient.list()}" multiple="multiple" optionKey="id" size="5" value="${notificationGroupInstance?.recipients*.id}" class="many-to-many"/>
<div class="new-item"><a class="new-item-link" href="#" data-toggle="modal" data-target="#rDialog" onclick="loadDialog( '${request.contextPath}/Recipient/createEmbeded', '#recipients' )"> New Recipients</a></div>

		</div>
    </div>

