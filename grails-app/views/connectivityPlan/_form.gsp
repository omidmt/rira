<%@ page import="mt.omid.rira.ConnectivityPlan" %>



    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${connectivityPlanInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'ip', 'error')} ">
        <label for="ip" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.ip.label" default="IP" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="ip" class="form-control"  value="${connectivityPlanInstance?.ip}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'port', 'error')} required">
        <label for="port" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.port.label" default="Port" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="port" class="form-control"  type="number" value="${connectivityPlanInstance.port}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'type', 'error')} required">
        <label for="type" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.type.label" default="Type" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select id="type" name="type.id" class="many-to-one form-control"  from="${mt.omid.rira.ConnectionType.list()}" optionKey="id" required="" value="${connectivityPlanInstance?.type?.id}"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/ConnectionType/createEmbeded', '#type' )"> New Type</a>
</div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'user', 'error')} ">
        <label for="user" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.user.label" default="User" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="user" class="form-control"  maxlength="100" value="${connectivityPlanInstance?.user}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'password', 'error')} ">
        <label for="password" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.password.label" default="Password" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="password" class="form-control"  maxlength="1500"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'passwordConfirmation', 'error')} ">
        <label for="passwordConfirmation" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.passwordConfirmation.label" default="Password Confirmation" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="passwordConfirmation" class="form-control" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'privateKey', 'error')} ">
        <label for="privateKey" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.privateKey.label" default="Private Key" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="privateKey" cols="40" rows="15" maxlength="3000" value="${connectivityPlanInstance?.privateKey}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'passphrase', 'error')} ">
        <label for="passphrase" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.passphrase.label" default="Passphrase" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="passphrase" class="form-control"  maxlength="1500"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'publicKey', 'error')} ">
        <label for="publicKey" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.publicKey.label" default="Public Key" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="publicKey" cols="40" rows="15" maxlength="3000" value="${connectivityPlanInstance?.publicKey}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'certificate', 'error')} ">
        <label for="certificate" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.certificate.label" default="Certificate" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="certificate" cols="40" rows="15" maxlength="10000" value="${connectivityPlanInstance?.certificate}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: connectivityPlanInstance, field: 'node', 'error')} ">
        <label for="node" class="col-sm-3 control-label">
            <g:message code="connectivityPlan.node.label" default="Node" />
            
        </label>
		<div class="col-sm-6">
        	<g:select id="node" name="node.id" class="many-to-one form-control"  from="${mt.omid.rira.Node.list()}" optionKey="id" value="${connectivityPlanInstance?.node?.id}" noSelection="['null': '']"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/Node/createEmbeded', '#node' )"> New Node</a>
</div>

		</div>
    </div>


