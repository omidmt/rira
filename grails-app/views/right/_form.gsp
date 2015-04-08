<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: rightInstance, field: 'act', 'error')} required">
        <label for="act">
            <g:message code="right.act.label" default="Act" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="act" required="" value="${rightInstance?.act}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: rightInstance, field: 'ctrl', 'error')} required">
        <label for="ctrl">
            <g:message code="right.ctrl.label" default="Ctrl" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="ctrl" required="" value="${rightInstance?.ctrl}"/>
    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: rightInstance, field: 'applico', 'error')} ">
        <label for="applico">
            <g:message code="right.applico.label" default="Applico" />
        </label>
        <g:select id="applico" name="applico.id" from="${mt.omid.rira.Applico.list()}" optionKey="id" value="${rightInstance?.applico?.id}" class="many-to-one" noSelection="['null': '']"/><div class="new-item"><a class="new-item-link" href="/Applico/create"> New applico</a></div>
    </div>
</div>

