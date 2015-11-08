<%@ page import="mt.omid.rira.Applico" %>



    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="applico.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="50" required="" value="${applicoInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'path', 'error')} required">
        <label for="path" class="col-sm-3 control-label">
            <g:message code="applico.path.label" default="Path" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="path" cols="40" rows="5" maxlength="255" required="" value="${applicoInstance?.path}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'description', 'error')} ">
        <label for="description" class="col-sm-3 control-label">
            <g:message code="applico.description.label" default="Description" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${applicoInstance?.description}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'iconPath', 'error')} ">
        <label for="iconPath" class="col-sm-3 control-label">
            <g:message code="applico.iconPath.label" default="Icon Path" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="iconPath" cols="40" rows="5" maxlength="255" value="${applicoInstance?.iconPath}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'family', 'error')} ">
        <label for="family" class="col-sm-3 control-label">
            <g:message code="applico.family.label" default="Family" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="family" class="form-control"  maxlength="50" value="${applicoInstance?.family}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'server', 'error')} ">
        <label for="server" class="col-sm-3 control-label">
            <g:message code="applico.server.label" default="Server" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="server" class="form-control"  maxlength="100" value="${applicoInstance?.server}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'port', 'error')} ">
        <label for="port" class="col-sm-3 control-label">
            <g:message code="applico.port.label" default="Port" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="port" class="form-control"  maxlength="5" value="${applicoInstance?.port}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: applicoInstance, field: 'context', 'error')} ">
        <label for="context" class="col-sm-3 control-label">
            <g:message code="applico.context.label" default="Context" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="context" class="form-control"  maxlength="100" value="${applicoInstance?.context}"/>

		</div>
    </div>

