<%@ page import="mt.omid.rira.APIKey" %>



    <div class="form-group ${hasErrors(bean: APIKeyInstance, field: 'user', 'error')} required">
        <label for="user" class="col-sm-3 control-label">
            <g:message code="APIKey.user.label" default="User" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select id="user" name="user.id" class="form-control"  from="${mt.omid.rira.User.list()}" optionKey="id" required="" value="${APIKeyInstance?.user?.id}" class="many-to-one"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/User/createEmbeded', '#user' )"> New User</a>
</div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: APIKeyInstance, field: 'allowedIPs', 'error')} ">
        <label for="allowedIPs" class="col-sm-3 control-label">
            <g:message code="APIKey.allowedIPs.label" default="Allowed IP s" />
            
        </label>
		<div class="col-sm-6">
        	<g:textArea name="allowedIPs" cols="40" rows="5" maxlength="1000" value="${APIKeyInstance?.allowedIPs}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: APIKeyInstance, field: 'maxPerDay', 'error')} required">
        <label for="maxPerDay" class="col-sm-3 control-label">
            <g:message code="APIKey.maxPerDay.label" default="Max Per Day" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="maxPerDay" class="form-control"  type="number" value="${APIKeyInstance.maxPerDay}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: APIKeyInstance, field: 'maxPerMonth', 'error')} required">
        <label for="maxPerMonth" class="col-sm-3 control-label">
            <g:message code="APIKey.maxPerMonth.label" default="Max Per Month" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="maxPerMonth" class="form-control"  type="number" value="${APIKeyInstance.maxPerMonth}" required=""/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: APIKeyInstance, field: 'totalMax', 'error')} required">
        <label for="totalMax" class="col-sm-3 control-label">
            <g:message code="APIKey.totalMax.label" default="Total Max" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field name="totalMax" class="form-control"  type="number" value="${APIKeyInstance.totalMax}" required=""/>

		</div>
    </div>

