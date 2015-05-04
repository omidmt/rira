<%@ page import="mt.omid.rira.NodeProfile" %>



    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="nodeProfile.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${nodeProfileInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'baseDir', 'error')} required">
        <label for="baseDir" class="col-sm-3 control-label">
            <g:message code="nodeProfile.baseDir.label" default="Base Dir" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="baseDir" class="form-control"  maxlength="255" required="" value="${nodeProfileInstance?.baseDir}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultGroup', 'error')} required">
        <label for="defaultGroup" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultGroup.label" default="Default Group" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="defaultGroup" class="form-control"  maxlength="255" required="" value="${nodeProfileInstance?.defaultGroup}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultGroupId', 'error')} required">
        <label for="defaultGroupId" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultGroupId.label" default="Default Group Id" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="defaultGroupId" class="form-control"  type="number" min="1" max="65500" value="${nodeProfileInstance.defaultGroupId}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultShell', 'error')} required">
        <label for="defaultShell" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultShell.label" default="Default Shell" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="defaultShell" class="form-control"  maxlength="255" required="" value="${nodeProfileInstance?.defaultShell}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultPasswordMinAge', 'error')} required">
        <label for="defaultPasswordMinAge" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultPasswordMinAge.label" default="Default Password Min Age" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="defaultPasswordMinAge" class="form-control"  type="number" value="${nodeProfileInstance.defaultPasswordMinAge}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultPasswordMaxAge', 'error')} required">
        <label for="defaultPasswordMaxAge" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultPasswordMaxAge.label" default="Default Password Max Age" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="defaultPasswordMaxAge" class="form-control"  type="number" value="${nodeProfileInstance.defaultPasswordMaxAge}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultPasswordWarning', 'error')} required">
        <label for="defaultPasswordWarning" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultPasswordWarning.label" default="Default Password Warning" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="defaultPasswordWarning" class="form-control"  type="number" value="${nodeProfileInstance.defaultPasswordWarning}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeProfileInstance, field: 'defaultConnectivityPlans', 'error')} ">
        <label for="defaultConnectivityPlans" class="col-sm-3 control-label">
            <g:message code="nodeProfile.defaultConnectivityPlans.label" default="Default Connectivity Plans" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="defaultConnectivityPlans" cols="40" rows="5" maxlength="1500" value="${nodeProfileInstance?.defaultConnectivityPlans}"/>

		</div>
    </div>

