<%@ page import="mt.omid.rira.Right" %>



    <div class="form-group ${hasErrors(bean: rightInstance, field: 'act', 'error')} required">
        <label for="act" class="col-sm-3 control-label">
            <g:message code="right.act.label" default="Act" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="act" class="form-control"  required="" value="${rightInstance?.act}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: rightInstance, field: 'ctrl', 'error')} required">
        <label for="ctrl" class="col-sm-3 control-label">
            <g:message code="right.ctrl.label" default="Ctrl" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="ctrl" class="form-control"  required="" value="${rightInstance?.ctrl}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: rightInstance, field: 'applico', 'error')} ">
        <label for="applico" class="col-sm-3 control-label">
            <g:message code="right.applico.label" default="Applico" />
            
        </label>
		<div class="col-sm-6">
        	<g:select id="applico" name="applico.id" class="form-control"  from="${mt.omid.rira.Applico.list()}" optionKey="id" value="${rightInstance?.applico?.id}" class="many-to-one" noSelection="['null': '']"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/Applico/createEmbeded', '#applico' )"> New applico</a>
</div>

		</div>
    </div>

