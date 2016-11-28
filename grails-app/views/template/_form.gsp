<%@ page import="mt.omid.rira.ntfy.Template" %>
    <div class="form-group ${hasErrors(bean: templateInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="template.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${templateInstance?.name}"/>
		</div>
    </div>

    <div class="form-group ${hasErrors(bean: templateInstance, field: 'content', 'error')} required">
        <label for="content" class="col-sm-3 control-label">
            <g:message code="template.content.label" default="Content" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="content" cols="40" rows="5" maxlength="1000" required="" value="${templateInstance?.content}"/>
		</div>
    </div>

