<%@ page import="mt.omid.rira.OS" %>



    <div class="form-group ${hasErrors(bean: OSInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="OS.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="20" required="" value="${OSInstance?.name}"/>

		</div>
    </div>

