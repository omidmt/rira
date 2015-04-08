<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="nodeProfile.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" maxlength="100" required="" value="${nodeProfileInstance?.name}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'baseDir', 'error')} required">
        <label for="baseDir">
            <g:message code="nodeProfile.baseDir.label" default="Base Dir" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="baseDir" cols="40" rows="5" maxlength="255" required="" value="${nodeProfileInstance?.baseDir}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'primaryGroup', 'error')} required">
        <label for="primaryGroup">
            <g:message code="nodeProfile.primaryGroup.label" default="Primary Group" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="primaryGroup" cols="40" rows="5" maxlength="255" required="" value="${nodeProfileInstance?.primaryGroup}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'groupId', 'error')} required">
        <label for="groupId">
            <g:message code="nodeProfile.groupId.label" default="Group Id" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="groupId" type="number" value="${nodeProfileInstance.groupId}" required=""/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'defaultShell', 'error')} required">
        <label for="defaultShell">
            <g:message code="nodeProfile.defaultShell.label" default="Default Shell" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="defaultShell" cols="40" rows="5" maxlength="255" required="" value="${nodeProfileInstance?.defaultShell}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'passwordMinAge', 'error')} required">
        <label for="passwordMinAge">
            <g:message code="nodeProfile.passwordMinAge.label" default="Password Min Age" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="passwordMinAge" type="number" value="${nodeProfileInstance.passwordMinAge}" required=""/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'passwordMaxAge', 'error')} required">
        <label for="passwordMaxAge">
            <g:message code="nodeProfile.passwordMaxAge.label" default="Password Max Age" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="passwordMaxAge" type="number" value="${nodeProfileInstance.passwordMaxAge}" required=""/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeProfileInstance, field: 'passwordWarning', 'error')} required">
        <label for="passwordWarning">
            <g:message code="nodeProfile.passwordWarning.label" default="Password Warning" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="passwordWarning" type="number" value="${nodeProfileInstance.passwordWarning}" required=""/>
    </div>
</div>
