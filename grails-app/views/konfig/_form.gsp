<%@ page import="mt.omid.rira.Konfig" %>



    <div class="form-group ${hasErrors(bean: konfigInstance, field: 'key', 'error')} required">
        <label for="key" class="col-sm-3 control-label">
            <g:message code="konfig.key.label" default="Key" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="key" class="form-control"  maxlength="200" required="" value="${konfigInstance?.key}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: konfigInstance, field: 'value', 'error')} required">
        <label for="value" class="col-sm-3 control-label">
            <g:message code="konfig.value.label" default="Value" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="value" cols="40" rows="5" maxlength="1000" required="" value="${konfigInstance?.value}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: konfigInstance, field: 'group', 'error')} ">
        <label for="group" class="col-sm-3 control-label">
            <g:message code="konfig.group.label" default="Group" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="group" class="form-control"  value="${konfigInstance?.group}"/>

		</div>
    </div>

