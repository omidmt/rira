<g:form id="${propertyName}" url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %> class="form-horizontal" role="form" >
	<g:render template="form"/>
</g:form>