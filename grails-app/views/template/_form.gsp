<div class="form-group ${hasErrors(bean: templateInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="template.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${templateInstance?.name}"/>
</div>

<div class="form-group ${hasErrors(bean: templateInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="template.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="1000" required="" value="${templateInstance?.content}"/>
</div>
