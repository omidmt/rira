<%@ page import="mt.omid.rira.ConnectionType" %>



    <div class="form-group ${hasErrors(bean: connectionTypeInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="connectionType.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${connectionTypeInstance?.name}"/>

		</div>
    </div>

