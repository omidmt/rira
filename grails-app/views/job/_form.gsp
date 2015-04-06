<%@ page import="mt.omid.rira.Job" %>



<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="job.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" maxlength="50" required="" value="${jobInstance?.name}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'description', 'error')} ">
        <label for="description">
            <g:message code="job.description.label" default="Description" />
            
        </label>
        <g:textArea name="description" cols="40" rows="5" maxlength="500" value="${jobInstance?.description}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'log', 'error')} ">
        <label for="log">
            <g:message code="job.log.label" default="Log" />
            
        </label>
        <g:textArea name="log" cols="40" rows="5" maxlength="100000" value="${jobInstance?.log}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'status', 'error')} ">
        <label for="status">
            <g:message code="job.status.label" default="Status" />
            
        </label>
        <g:select name="status" from="${mt.omid.rira.JobStatus?.values()}" keys="${mt.omid.rira.JobStatus.values()*.name()}" value="${jobInstance?.status?.name()}"  noSelection="['': '']"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'endTime', 'error')} required">
        <label for="endTime">
            <g:message code="job.endTime.label" default="End Time" />
            <span class="required-indicator">*</span>
        </label>
        <input type=text name="endTime" id="endTime" precision="day" value="${jobInstance?.endTime?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: jobInstance, field: 'startTime', 'error')} required">
        <label for="startTime">
            <g:message code="job.startTime.label" default="Start Time" />
            <span class="required-indicator">*</span>
        </label>
        <input type=text name="startTime" id="startTime" precision="day" value="${jobInstance?.startTime?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

    </div>
</div>

