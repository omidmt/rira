<%@ page import="mt.omid.rira.Invitation" %>



    <div class="form-group ${hasErrors(bean: invitationInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="invitation.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="50" required="" value="${invitationInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: invitationInstance, field: 'email', 'error')} required">
        <label for="email" class="col-sm-3 control-label">
            <g:message code="invitation.email.label" default="Email" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:field type="email" name="email" class="form-control"  required="" value="${invitationInstance?.email}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: invitationInstance, field: 'accountExpiry', 'error')} ">
        <label for="accountExpiry" class="col-sm-3 control-label">
            <g:message code="invitation.accountExpiry.label" default="Account Expiry" />
            
        </label>
		<div class="col-sm-6">
        	<input type=text name="accountExpiry" id="accountExpiry" precision="day" value="${invitationInstance?.accountExpiry?.format('EEE MMM dd HH:mm:ss yyyy')}" class="datepicker" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: invitationInstance, field: 'role', 'error')} ">
        <label for="role" class="col-sm-3 control-label">
            <g:message code="invitation.role.label" default="Role" />
            
        </label>
		<div class="col-sm-6">
        	<g:select id="role" name="role.id" class="form-control"  from="${mt.omid.rira.Role.list()}" optionKey="id" value="${invitationInstance?.role?.id}" class="many-to-one" noSelection="['null': '']"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/Role/createEmbeded', '#role' )"> New Role</a>
</div>

		</div>
    </div>

