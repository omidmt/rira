<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="role.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" maxlength="100" required="" value="${roleInstance?.name}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: roleInstance, field: 'rights', 'error')} ">
        <label for="rights">
            <g:message code="role.rights.label" default="Rights" />
        </label>
        <g:select name="rights" from="${mt.omid.rira.Right.list()}" multiple="multiple" optionKey="id" size="5" value="${roleInstance?.rights*.id}" class="many-to-many"/><div class="new-item"><a class="new-item-link" href="/Right/create"> New rights</a></div>
    </div>
</div>
