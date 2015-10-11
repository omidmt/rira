<%@ page import="mt.omid.rira.Role" %>



    <div class="form-group ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="role.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${roleInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: roleInstance, field: 'rights', 'error')} ">
        <label for="rights" class="col-sm-3 control-label">
            <g:message code="role.rights.label" default="Rights" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="rights" class="form-control"  from="${mt.omid.rira.Right.list()}" multiple="multiple" optionKey="id" size="5" value="${roleInstance?.rights*.id}" class="many-to-many"/>
<div class="new-item"><a class="new-item-link" href="#" data-toggle="modal" data-target="#rDialog" onclick="loadDialog( '${request.contextPath}/Right/createEmbeded', '#rights' )"> New rights</a></div>

		</div>
    </div>

