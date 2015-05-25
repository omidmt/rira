<%@ page import="mt.omid.rira.DataConnection" %>



    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="dataConnection.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${dataConnectionInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'dsClass', 'error')} required">
        <label for="dsClass" class="col-sm-3 control-label">
            <g:message code="dataConnection.dsClass.label" default="Ds Class" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="dsClass" cols="40" rows="5" maxlength="1000" required="" value="${dataConnectionInstance?.dsClass}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'driver', 'error')} required">
        <label for="driver" class="col-sm-3 control-label">
            <g:message code="dataConnection.driver.label" default="Driver" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="driver" cols="40" rows="5" maxlength="1000" required="" value="${dataConnectionInstance?.driver}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'url', 'error')} required">
        <label for="url" class="col-sm-3 control-label">
            <g:message code="dataConnection.url.label" default="Url" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="url" cols="40" rows="5" maxlength="1000" required="" value="${dataConnectionInstance?.url}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'username', 'error')} ">
        <label for="username" class="col-sm-3 control-label">
            <g:message code="dataConnection.username.label" default="Username" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="username" class="form-control"  maxlength="100" value="${dataConnectionInstance?.username}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'password', 'error')} ">
        <label for="password" class="col-sm-3 control-label">
            <g:message code="dataConnection.password.label" default="Password" />
            
        </label>
		<div class="col-sm-6">
        	<g:field type="password" name="password" class="form-control"  maxlength="100"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataConnectionInstance, field: 'others', 'error')} ">
        <label for="others" class="col-sm-3 control-label">
            <g:message code="dataConnection.others.label" default="Others" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="others" cols="40" rows="5" maxlength="2000" value="${dataConnectionInstance?.others}"/>

		</div>
    </div>

