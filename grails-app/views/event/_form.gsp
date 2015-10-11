<%@ page import="mt.omid.rira.Event" %>



    <div class="form-group ${hasErrors(bean: eventInstance, field: 'severity', 'error')} required">
        <label for="severity" class="col-sm-3 control-label">
            <g:message code="event.severity.label" default="Severity" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select name="severity" class="form-control"  from="${mt.omid.rira.Event$Severity?.values()}" keys="${mt.omid.rira.Event$Severity.values()*.name()}" required="" value="${eventInstance?.severity?.name()}" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'time', 'error')} required">
        <label for="time" class="col-sm-3 control-label">
            <g:message code="event.time.label" default="Time" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<input type=text name="time" id="time" precision="day" value="${eventInstance?.time?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'header', 'error')} required">
        <label for="header" class="col-sm-3 control-label">
            <g:message code="event.header.label" default="Header" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="header" class="form-control"  maxlength="100" required="" value="${eventInstance?.header}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'description', 'error')} required">
        <label for="description" class="col-sm-3 control-label">
            <g:message code="event.description.label" default="Description" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="description" cols="40" rows="5" maxlength="1000" required="" value="${eventInstance?.description}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'sender', 'error')} required">
        <label for="sender" class="col-sm-3 control-label">
            <g:message code="event.sender.label" default="Sender" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="sender" class="form-control"  maxlength="200" required="" value="${eventInstance?.sender}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'impact', 'error')} ">
        <label for="impact" class="col-sm-3 control-label">
            <g:message code="event.impact.label" default="Impact" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="impact" class="form-control"  value="${eventInstance?.impact}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'resolution', 'error')} ">
        <label for="resolution" class="col-sm-3 control-label">
            <g:message code="event.resolution.label" default="Resolution" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="resolution" class="form-control"  value="${eventInstance?.resolution}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: eventInstance, field: 'fixed', 'error')} ">
        <label for="fixed" class="col-sm-3 control-label">
            <g:message code="event.fixed.label" default="Fixed" />
            
        </label>
		<div class="col-sm-6">
        	<g:checkBox name="fixed" value="${eventInstance?.fixed}" />

		</div>
    </div>

