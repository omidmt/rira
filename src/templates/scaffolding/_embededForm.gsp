<g:form id="${propertyName}" url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %> class="form-horizontal" role="form" >
	<g:render template="form"/>
	%{--<g:submitButton name="create" form="${propertyName}" class="save btn btn-primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />--}%
</g:form>