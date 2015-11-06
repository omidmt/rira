<%@ page import="mt.omid.rira.NodeType" %>



    <div class="form-group ${hasErrors(bean: nodeTypeInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="nodeType.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="20" required="" value="${nodeTypeInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeTypeInstance, field: 'modules', 'error')} ">
        <label for="modules" class="col-sm-3 control-label">
            <g:message code="nodeType.modules.label" default="Modules" />
            
        </label>
		<div class="col-sm-6">
        	<g:select name="modules" class="form-control"  from="${mt.omid.rira.Module.list()}" multiple="multiple" optionKey="id" size="5" value="${nodeTypeInstance?.modules*.id}" class="many-to-many"/>
<div class="new-item"><a class="new-item-link" href="#" data-toggle="modal" data-target="#rDialog" onclick="loadDialog( '${request.contextPath}/Module/createEmbeded', '#modules' )"> New Modules</a></div>

		</div>
    </div>

