<%@ page import="mt.omid.rira.Job" %>



    <div class="form-group ${hasErrors(bean: jobInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="job.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="50" required="" value="${jobInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: jobInstance, field: 'description', 'error')} ">
        <label for="description" class="col-sm-3 control-label">
            <g:message code="job.description.label" default="Description" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${jobInstance?.description}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: jobInstance, field: 'log', 'error')} ">
        <label for="log" class="col-sm-3 control-label">
            <g:message code="job.log.label" default="Log" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="log" cols="40" rows="5" maxlength="100000" value="${jobInstance?.log}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: jobInstance, field: 'status', 'error')} ">
        <label for="status" class="col-sm-3 control-label">
            <g:message code="job.status.label" default="Status" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="status" class="form-control"  from="${mt.omid.rira.JobStatus?.values()}" keys="${mt.omid.rira.JobStatus.values()*.name()}" value="${jobInstance?.status?.name()}"  noSelection="['': '']"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: jobInstance, field: 'endTime', 'error')} required">
        <label for="endTime" class="col-sm-3 control-label">
            <g:message code="job.endTime.label" default="End Time" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<input type=text name="endTime" id="endTime" precision="day" value="${jobInstance?.endTime?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: jobInstance, field: 'startTime', 'error')} required">
        <label for="startTime" class="col-sm-3 control-label">
            <g:message code="job.startTime.label" default="Start Time" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<input type=text name="startTime" id="startTime" precision="day" value="${jobInstance?.startTime?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

