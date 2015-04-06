<%@ page import="mt.omid.rira.Konfig" %>



<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: konfigInstance, field: 'key', 'error')} required">
        <label for="key">
            <g:message code="konfig.key.label" default="Key" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="key" maxlength="200" required="" value="${konfigInstance?.key}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: konfigInstance, field: 'value', 'error')} required">
        <label for="value">
            <g:message code="konfig.value.label" default="Value" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea name="value" cols="40" rows="5" maxlength="1000" required="" value="${konfigInstance?.value}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: konfigInstance, field: 'group', 'error')} ">
        <label for="group">
            <g:message code="konfig.group.label" default="Group" />
            
        </label>
        <g:textField name="group" value="${konfigInstance?.group}"/>

    </div>
</div>

