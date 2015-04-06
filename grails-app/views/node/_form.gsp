<%@ page import="mt.omid.rira.Node" %>



<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="node.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" maxlength="50" required="" value="${nodeInstance?.name}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'profile', 'error')} ">
        <label for="profile">
            <g:message code="node.profile.label" default="Profile" />
            
        </label>
        <g:select id="profile" name="profile.id" from="${mt.omid.rira.NodeProfile.list()}" optionKey="id" value="${nodeInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/><div class="new-item"><a class="new-item-link" href="/NodeProfile/create"> New profile</a></div>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'nodeType', 'error')} required">
        <label for="nodeType">
            <g:message code="node.nodeType.label" default="Node Type" />
            <span class="required-indicator">*</span>
        </label>
        <g:select name="nodeType" from="${mt.omid.rira.utils.NodeType?.values()}" keys="${mt.omid.rira.utils.NodeType.values()*.name()}" required="" value="${nodeInstance?.nodeType?.name()}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'serverType', 'error')} required">
        <label for="serverType">
            <g:message code="node.serverType.label" default="Server Type" />
            <span class="required-indicator">*</span>
        </label>
        <g:select name="serverType" from="${mt.omid.rira.utils.ServerType?.values()}" keys="${mt.omid.rira.utils.ServerType.values()*.name()}" required="" value="${nodeInstance?.serverType?.name()}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'loginMethod', 'error')} required">
        <label for="loginMethod">
            <g:message code="node.loginMethod.label" default="Login Method" />
            <span class="required-indicator">*</span>
        </label>
        <g:select name="loginMethod" from="${mt.omid.rira.utils.LoginMethod?.values()}" keys="${mt.omid.rira.utils.LoginMethod.values()*.name()}" required="" value="${nodeInstance?.loginMethod?.name()}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'os', 'error')} required">
        <label for="os">
            <g:message code="node.os.label" default="Os" />
            <span class="required-indicator">*</span>
        </label>
        <g:select name="os" from="${mt.omid.rira.utils.OS?.values()}" keys="${mt.omid.rira.utils.OS.values()*.name()}" required="" value="${nodeInstance?.os?.name()}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'active', 'error')} ">
        <label for="active">
            <g:message code="node.active.label" default="Active" />
            
        </label>
        <g:checkBox name="active" value="${nodeInstance?.active}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'master', 'error')} ">
        <label for="master">
            <g:message code="node.master.label" default="Master" />
            
        </label>
        <g:checkBox name="master" value="${nodeInstance?.master}" />

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'ip1', 'error')} ">
        <label for="ip1">
            <g:message code="node.ip1.label" default="Ip1" />
            
        </label>
        <g:textField name="ip1" value="${nodeInstance?.ip1}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'port1', 'error')} required">
        <label for="port1">
            <g:message code="node.port1.label" default="Port1" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="port1" type="number" value="${nodeInstance.port1}" required=""/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'user1', 'error')} ">
        <label for="user1">
            <g:message code="node.user1.label" default="User1" />
            
        </label>
        <g:textField name="user1" maxlength="100" value="${nodeInstance?.user1}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password1', 'error')} ">
        <label for="password1">
            <g:message code="node.password1.label" default="Password1" />
            
        </label>
        <g:field type="password" name="password1" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password1Confirmation', 'error')} ">
        <label for="password1Confirmation">
            <g:message code="node.password1Confirmation.label" default="Password1 Confirmation" />
            
        </label>
        <g:field type="password" name="password1Confirmation"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'privateKey1', 'error')} ">
        <label for="privateKey1">
            <g:message code="node.privateKey1.label" default="Private Key1" />
            
        </label>
        <g:textArea name="privateKey1" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.privateKey1}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'passphrase1', 'error')} ">
        <label for="passphrase1">
            <g:message code="node.passphrase1.label" default="Passphrase1" />
            
        </label>
        <g:field type="password" name="passphrase1" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'publicKey1', 'error')} ">
        <label for="publicKey1">
            <g:message code="node.publicKey1.label" default="Public Key1" />
            
        </label>
        <g:textArea name="publicKey1" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.publicKey1}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'ip2', 'error')} ">
        <label for="ip2">
            <g:message code="node.ip2.label" default="Ip2" />
            
        </label>
        <g:textField name="ip2" value="${nodeInstance?.ip2}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'port2', 'error')} required">
        <label for="port2">
            <g:message code="node.port2.label" default="Port2" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="port2" type="number" value="${nodeInstance.port2}" required=""/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'user2', 'error')} ">
        <label for="user2">
            <g:message code="node.user2.label" default="User2" />
            
        </label>
        <g:textField name="user2" maxlength="100" value="${nodeInstance?.user2}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password2', 'error')} ">
        <label for="password2">
            <g:message code="node.password2.label" default="Password2" />
            
        </label>
        <g:field type="password" name="password2" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password2Confirmation', 'error')} ">
        <label for="password2Confirmation">
            <g:message code="node.password2Confirmation.label" default="Password2 Confirmation" />
            
        </label>
        <g:field type="password" name="password2Confirmation"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'privateKey2', 'error')} ">
        <label for="privateKey2">
            <g:message code="node.privateKey2.label" default="Private Key2" />
            
        </label>
        <g:textArea name="privateKey2" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.privateKey2}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'passphrase2', 'error')} ">
        <label for="passphrase2">
            <g:message code="node.passphrase2.label" default="Passphrase2" />
            
        </label>
        <g:field type="password" name="passphrase2" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'publicKey2', 'error')} ">
        <label for="publicKey2">
            <g:message code="node.publicKey2.label" default="Public Key2" />
            
        </label>
        <g:textArea name="publicKey2" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.publicKey2}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'ip3', 'error')} ">
        <label for="ip3">
            <g:message code="node.ip3.label" default="Ip3" />
            
        </label>
        <g:textField name="ip3" value="${nodeInstance?.ip3}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'port3', 'error')} required">
        <label for="port3">
            <g:message code="node.port3.label" default="Port3" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="port3" type="number" value="${nodeInstance.port3}" required=""/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'user3', 'error')} ">
        <label for="user3">
            <g:message code="node.user3.label" default="User3" />
            
        </label>
        <g:textField name="user3" maxlength="100" value="${nodeInstance?.user3}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password3', 'error')} ">
        <label for="password3">
            <g:message code="node.password3.label" default="Password3" />
            
        </label>
        <g:field type="password" name="password3" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password3Confirmation', 'error')} ">
        <label for="password3Confirmation">
            <g:message code="node.password3Confirmation.label" default="Password3 Confirmation" />
            
        </label>
        <g:field type="password" name="password3Confirmation"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'privateKey3', 'error')} ">
        <label for="privateKey3">
            <g:message code="node.privateKey3.label" default="Private Key3" />
            
        </label>
        <g:textArea name="privateKey3" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.privateKey3}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'passphrase3', 'error')} ">
        <label for="passphrase3">
            <g:message code="node.passphrase3.label" default="Passphrase3" />
            
        </label>
        <g:field type="password" name="passphrase3" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'publicKey3', 'error')} ">
        <label for="publicKey3">
            <g:message code="node.publicKey3.label" default="Public Key3" />
            
        </label>
        <g:textArea name="publicKey3" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.publicKey3}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'ip4', 'error')} ">
        <label for="ip4">
            <g:message code="node.ip4.label" default="Ip4" />
            
        </label>
        <g:textField name="ip4" value="${nodeInstance?.ip4}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'port4', 'error')} required">
        <label for="port4">
            <g:message code="node.port4.label" default="Port4" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="port4" type="number" value="${nodeInstance.port4}" required=""/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'user4', 'error')} ">
        <label for="user4">
            <g:message code="node.user4.label" default="User4" />
            
        </label>
        <g:textField name="user4" maxlength="100" value="${nodeInstance?.user4}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password4', 'error')} ">
        <label for="password4">
            <g:message code="node.password4.label" default="Password4" />
            
        </label>
        <g:field type="password" name="password4" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password4Confirmation', 'error')} ">
        <label for="password4Confirmation">
            <g:message code="node.password4Confirmation.label" default="Password4 Confirmation" />
            
        </label>
        <g:field type="password" name="password4Confirmation"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'privateKey4', 'error')} ">
        <label for="privateKey4">
            <g:message code="node.privateKey4.label" default="Private Key4" />
            
        </label>
        <g:textArea name="privateKey4" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.privateKey4}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'passphrase4', 'error')} ">
        <label for="passphrase4">
            <g:message code="node.passphrase4.label" default="Passphrase4" />
            
        </label>
        <g:field type="password" name="passphrase4" maxlength="1500"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'publicKey4', 'error')} ">
        <label for="publicKey4">
            <g:message code="node.publicKey4.label" default="Public Key4" />
            
        </label>
        <g:textArea name="publicKey4" cols="40" rows="5" maxlength="3000" value="${nodeInstance?.publicKey4}"/>

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password1Decrypted', 'error')} ">
        <label for="password1Decrypted">
            <g:message code="node.password1Decrypted.label" default="Password1 Decrypted" />
            
        </label>
        

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password2Decrypted', 'error')} ">
        <label for="password2Decrypted">
            <g:message code="node.password2Decrypted.label" default="Password2 Decrypted" />
            
        </label>
        

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password3Decrypted', 'error')} ">
        <label for="password3Decrypted">
            <g:message code="node.password3Decrypted.label" default="Password3 Decrypted" />
            
        </label>
        

    </div>
</div>

<div class="row">
    <div class="form-group col-md-6 col-lg-6 ${hasErrors(bean: nodeInstance, field: 'password4Decrypted', 'error')} ">
        <label for="password4Decrypted">
            <g:message code="node.password4Decrypted.label" default="Password4 Decrypted" />
            
        </label>
        

    </div>
</div>

