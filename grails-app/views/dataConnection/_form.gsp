<%@ page import="mt.omid.rira.DataConnection" %>



    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="dataSource.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="100" required="" value="${dataSourceInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'dsClass', 'error')} required">
        <label for="dsClass" class="col-sm-3 control-label">
            <g:message code="dataSource.dsClass.label" default="Ds Class" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="dsClass" cols="40" rows="5" maxlength="1000" required="" value="${dataSourceInstance?.dsClass}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'driver', 'error')} required">
        <label for="driver" class="col-sm-3 control-label">
            <g:message code="dataSource.driver.label" default="Driver" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="driver" cols="40" rows="5" maxlength="1000" required="" value="${dataSourceInstance?.driver}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'url', 'error')} required">
        <label for="url" class="col-sm-3 control-label">
            <g:message code="dataSource.url.label" default="Url" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textArea name="url" cols="40" rows="5" maxlength="1000" required="" value="${dataSourceInstance?.url}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'username', 'error')} ">
        <label for="username" class="col-sm-3 control-label">
            <g:message code="dataSource.username.label" default="Username" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="username" class="form-control"  maxlength="100" value="${dataSourceInstance?.username}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'password', 'error')} ">
        <label for="password" class="col-sm-3 control-label">
            <g:message code="dataSource.password.label" default="Password" />
            
        </label>
		<div class="col-sm-6">
        	<g:textField name="password" class="form-control"  maxlength="100" value="${dataSourceInstance?.password}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: dataSourceInstance, field: 'others', 'error')} ">
        <label for="others" class="col-sm-3 control-label">
            <g:message code="dataSource.others.label" default="Others" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="others" cols="40" rows="5" maxlength="2000" value="${dataSourceInstance?.others}"/>

		</div>
    </div>

