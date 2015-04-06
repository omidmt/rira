
<%@ page import="mt.omid.rira.Node" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#show-node" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="show-node" class="content scaffold-show" role="main">
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list node">--}%
            <form class="form-horizontal" role="form">
			
				<g:if test="${nodeInstance?.name}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputname" class="col-sm-2 control-label">name</label>
					%{--<span id="name-label" class="input-group-addon property-label"><g:message code="node.name.label" default="Name" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeInstance}" field="name"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.profile}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprofile" class="col-sm-2 control-label">profile</label>
					%{--<span id="profile-label" class="input-group-addon property-label"><g:message code="node.profile.label" default="Profile" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="profile-label"><g:link controller="nodeProfile" action="show" id="${nodeInstance?.profile?.id}">${nodeInstance?.profile?.encodeAsHTML()}</g:link></pjjj>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.nodeType}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputnodeType" class="col-sm-2 control-label">nodeType</label>
					%{--<span id="nodeType-label" class="input-group-addon property-label"><g:message code="node.nodeType.label" default="Node Type" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="nodeType" class="form-control-static disabled" aria-labelledby="nodeType-label"><g:fieldValue bean="${nodeInstance}" field="nodeType"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.serverType}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputserverType" class="col-sm-2 control-label">serverType</label>
					%{--<span id="serverType-label" class="input-group-addon property-label"><g:message code="node.serverType.label" default="Server Type" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="serverType" class="form-control-static disabled" aria-labelledby="serverType-label"><g:fieldValue bean="${nodeInstance}" field="serverType"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.loginMethod}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputloginMethod" class="col-sm-2 control-label">loginMethod</label>
					%{--<span id="loginMethod-label" class="input-group-addon property-label"><g:message code="node.loginMethod.label" default="Login Method" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="loginMethod" class="form-control-static disabled" aria-labelledby="loginMethod-label"><g:fieldValue bean="${nodeInstance}" field="loginMethod"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.os}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputos" class="col-sm-2 control-label">os</label>
					%{--<span id="os-label" class="input-group-addon property-label"><g:message code="node.os.label" default="Os" /></span>--}%
                    <div class="col-sm-10">
					
						<p id="os" class="form-control-static disabled" aria-labelledby="os-label"><g:fieldValue bean="${nodeInstance}" field="os"/></p>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.active}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputactive" class="col-sm-2 control-label">active</label>
					%{--<span id="active-label" class="input-group-addon property-label"><g:message code="node.active.label" default="Active" /></span>--}%
                    <div class="col-sm-10">
					
                        <p class="form-control-static disabled" aria-labelledby="active-label"><g:formatBoolean boolean="${nodeInstance?.active}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.master}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputmaster" class="col-sm-2 control-label">master</label>
					%{--<span id="master-label" class="input-group-addon property-label"><g:message code="node.master.label" default="Master" /></span>--}%
                    <div class="col-sm-10">
					
                        <p class="form-control-static disabled" aria-labelledby="master-label"><g:formatBoolean boolean="${nodeInstance?.master}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.ip1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputip1" class="col-sm-2 control-label">ip1</label>
					%{--<span id="ip1-label" class="input-group-addon property-label"><g:message code="node.ip1.label" default="Ip1" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ip1-label"><g:fieldValue bean="${nodeInstance}" field="ip1"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.port1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputport1" class="col-sm-2 control-label">port1</label>
					%{--<span id="port1-label" class="input-group-addon property-label"><g:message code="node.port1.label" default="Port1" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="port1-label"><g:fieldValue bean="${nodeInstance}" field="port1"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.user1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser1" class="col-sm-2 control-label">user1</label>
					%{--<span id="user1-label" class="input-group-addon property-label"><g:message code="node.user1.label" default="User1" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user1-label"><g:fieldValue bean="${nodeInstance}" field="user1"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.password1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassword1" class="col-sm-2 control-label">password1</label>
					%{--<span id="password1-label" class="input-group-addon property-label"><g:message code="node.password1.label" default="Password1" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.privateKey1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprivateKey1" class="col-sm-2 control-label">privateKey1</label>
					%{--<span id="privateKey1-label" class="input-group-addon property-label"><g:message code="node.privateKey1.label" default="Private Key1" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="privateKey1-label"><g:fieldValue bean="${nodeInstance}" field="privateKey1"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.passphrase1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassphrase1" class="col-sm-2 control-label">passphrase1</label>
					%{--<span id="passphrase1-label" class="input-group-addon property-label"><g:message code="node.passphrase1.label" default="Passphrase1" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.publicKey1}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpublicKey1" class="col-sm-2 control-label">publicKey1</label>
					%{--<span id="publicKey1-label" class="input-group-addon property-label"><g:message code="node.publicKey1.label" default="Public Key1" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="publicKey1-label"><g:fieldValue bean="${nodeInstance}" field="publicKey1"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.ip2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputip2" class="col-sm-2 control-label">ip2</label>
					%{--<span id="ip2-label" class="input-group-addon property-label"><g:message code="node.ip2.label" default="Ip2" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ip2-label"><g:fieldValue bean="${nodeInstance}" field="ip2"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.port2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputport2" class="col-sm-2 control-label">port2</label>
					%{--<span id="port2-label" class="input-group-addon property-label"><g:message code="node.port2.label" default="Port2" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="port2-label"><g:fieldValue bean="${nodeInstance}" field="port2"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.user2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser2" class="col-sm-2 control-label">user2</label>
					%{--<span id="user2-label" class="input-group-addon property-label"><g:message code="node.user2.label" default="User2" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user2-label"><g:fieldValue bean="${nodeInstance}" field="user2"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.password2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassword2" class="col-sm-2 control-label">password2</label>
					%{--<span id="password2-label" class="input-group-addon property-label"><g:message code="node.password2.label" default="Password2" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.privateKey2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprivateKey2" class="col-sm-2 control-label">privateKey2</label>
					%{--<span id="privateKey2-label" class="input-group-addon property-label"><g:message code="node.privateKey2.label" default="Private Key2" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="privateKey2-label"><g:fieldValue bean="${nodeInstance}" field="privateKey2"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.passphrase2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassphrase2" class="col-sm-2 control-label">passphrase2</label>
					%{--<span id="passphrase2-label" class="input-group-addon property-label"><g:message code="node.passphrase2.label" default="Passphrase2" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.publicKey2}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpublicKey2" class="col-sm-2 control-label">publicKey2</label>
					%{--<span id="publicKey2-label" class="input-group-addon property-label"><g:message code="node.publicKey2.label" default="Public Key2" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="publicKey2-label"><g:fieldValue bean="${nodeInstance}" field="publicKey2"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.ip3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputip3" class="col-sm-2 control-label">ip3</label>
					%{--<span id="ip3-label" class="input-group-addon property-label"><g:message code="node.ip3.label" default="Ip3" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ip3-label"><g:fieldValue bean="${nodeInstance}" field="ip3"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.port3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputport3" class="col-sm-2 control-label">port3</label>
					%{--<span id="port3-label" class="input-group-addon property-label"><g:message code="node.port3.label" default="Port3" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="port3-label"><g:fieldValue bean="${nodeInstance}" field="port3"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.user3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser3" class="col-sm-2 control-label">user3</label>
					%{--<span id="user3-label" class="input-group-addon property-label"><g:message code="node.user3.label" default="User3" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user3-label"><g:fieldValue bean="${nodeInstance}" field="user3"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.password3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassword3" class="col-sm-2 control-label">password3</label>
					%{--<span id="password3-label" class="input-group-addon property-label"><g:message code="node.password3.label" default="Password3" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.privateKey3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprivateKey3" class="col-sm-2 control-label">privateKey3</label>
					%{--<span id="privateKey3-label" class="input-group-addon property-label"><g:message code="node.privateKey3.label" default="Private Key3" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="privateKey3-label"><g:fieldValue bean="${nodeInstance}" field="privateKey3"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.passphrase3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassphrase3" class="col-sm-2 control-label">passphrase3</label>
					%{--<span id="passphrase3-label" class="input-group-addon property-label"><g:message code="node.passphrase3.label" default="Passphrase3" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.publicKey3}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpublicKey3" class="col-sm-2 control-label">publicKey3</label>
					%{--<span id="publicKey3-label" class="input-group-addon property-label"><g:message code="node.publicKey3.label" default="Public Key3" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="publicKey3-label"><g:fieldValue bean="${nodeInstance}" field="publicKey3"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.ip4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputip4" class="col-sm-2 control-label">ip4</label>
					%{--<span id="ip4-label" class="input-group-addon property-label"><g:message code="node.ip4.label" default="Ip4" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ip4-label"><g:fieldValue bean="${nodeInstance}" field="ip4"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.port4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputport4" class="col-sm-2 control-label">port4</label>
					%{--<span id="port4-label" class="input-group-addon property-label"><g:message code="node.port4.label" default="Port4" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="port4-label"><g:fieldValue bean="${nodeInstance}" field="port4"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.user4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputuser4" class="col-sm-2 control-label">user4</label>
					%{--<span id="user4-label" class="input-group-addon property-label"><g:message code="node.user4.label" default="User4" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="user4-label"><g:fieldValue bean="${nodeInstance}" field="user4"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.password4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassword4" class="col-sm-2 control-label">password4</label>
					%{--<span id="password4-label" class="input-group-addon property-label"><g:message code="node.password4.label" default="Password4" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.privateKey4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputprivateKey4" class="col-sm-2 control-label">privateKey4</label>
					%{--<span id="privateKey4-label" class="input-group-addon property-label"><g:message code="node.privateKey4.label" default="Private Key4" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="privateKey4-label"><g:fieldValue bean="${nodeInstance}" field="privateKey4"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.passphrase4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpassphrase4" class="col-sm-2 control-label">passphrase4</label>
					%{--<span id="passphrase4-label" class="input-group-addon property-label"><g:message code="node.passphrase4.label" default="Passphrase4" /></span>--}%
                    <div class="col-sm-10">
					
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.publicKey4}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputpublicKey4" class="col-sm-2 control-label">publicKey4</label>
					%{--<span id="publicKey4-label" class="input-group-addon property-label"><g:message code="node.publicKey4.label" default="Public Key4" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="publicKey4-label"><g:fieldValue bean="${nodeInstance}" field="publicKey4"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.dateCreated}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
					%{--<span id="dateCreated-label" class="input-group-addon property-label"><g:message code="node.dateCreated.label" default="Date Created" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${nodeInstance?.dateCreated}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${nodeInstance?.lastUpdated}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
					%{--<span id="lastUpdated-label" class="input-group-addon property-label"><g:message code="node.lastUpdated.label" default="Last Updated" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${nodeInstance?.lastUpdated}" /></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
            </form>
			%{--</ol>--}%
			<g:form url="[resource:nodeInstance, action:'delete']" method="DELETE">
                <div class="btn-group">
                <fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${nodeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
                </div>
			</g:form>
		</div>
    </div>
	</body>
</html>
