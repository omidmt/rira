<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">
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
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${nodeInstance?.name}">

					<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${nodeInstance}" field="name"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.profile}">

					<div class="form-group">
					<label for="inputprofile" class="col-sm-2 control-label">profile</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="profile-label"><g:link controller="nodeProfile" action="show" id="${nodeInstance?.profile?.id}">${nodeInstance?.profile?.encodeAsHTML()}</g:link></pjjj>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.nodeType}">

					<div class="form-group">
					<label for="inputnodeType" class="col-sm-2 control-label">nodeType</label>
					<div class="col-sm-10">
						<p id="nodeType" class="form-control-static disabled" aria-labelledby="nodeType-label"><g:fieldValue bean="${nodeInstance}" field="nodeType"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.serverType}">

					<div class="form-group">
					<label for="inputserverType" class="col-sm-2 control-label">serverType</label>
					<div class="col-sm-10">
						<p id="serverType" class="form-control-static disabled" aria-labelledby="serverType-label"><g:fieldValue bean="${nodeInstance}" field="serverType"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.loginMethod}">

					<div class="form-group">
					<label for="inputloginMethod" class="col-sm-2 control-label">loginMethod</label>
					<div class="col-sm-10">
						<p id="loginMethod" class="form-control-static disabled" aria-labelledby="loginMethod-label"><g:fieldValue bean="${nodeInstance}" field="loginMethod"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.os}">

					<div class="form-group">
					<label for="inputos" class="col-sm-2 control-label">os</label>
					<div class="col-sm-10">
						<p id="os" class="form-control-static disabled" aria-labelledby="os-label"><g:fieldValue bean="${nodeInstance}" field="os"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.active}">

					<div class="form-group">
					<label for="inputactive" class="col-sm-2 control-label">active</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="active-label"><g:formatBoolean boolean="${nodeInstance?.active}" /></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.master}">

					<div class="form-group">
					<label for="inputmaster" class="col-sm-2 control-label">master</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="master-label"><g:formatBoolean boolean="${nodeInstance?.master}" /></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.ip1}">

					<div class="form-group">
					<label for="inputip1" class="col-sm-2 control-label">ip1</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="ip1-label"><g:fieldValue bean="${nodeInstance}" field="ip1"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.port1}">

					<div class="form-group">
					<label for="inputport1" class="col-sm-2 control-label">port1</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="port1-label"><g:fieldValue bean="${nodeInstance}" field="port1"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.user1}">

					<div class="form-group">
					<label for="inputuser1" class="col-sm-2 control-label">user1</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="user1-label"><g:fieldValue bean="${nodeInstance}" field="user1"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.password1}">

					<div class="form-group">
					<label for="inputpassword1" class="col-sm-2 control-label">password1</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.privateKey1}">

					<div class="form-group">
					<label for="inputprivateKey1" class="col-sm-2 control-label">privateKey1</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="privateKey1-label"><g:fieldValue bean="${nodeInstance}" field="privateKey1"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.passphrase1}">

					<div class="form-group">
					<label for="inputpassphrase1" class="col-sm-2 control-label">passphrase1</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.publicKey1}">

					<div class="form-group">
					<label for="inputpublicKey1" class="col-sm-2 control-label">publicKey1</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="publicKey1-label"><g:fieldValue bean="${nodeInstance}" field="publicKey1"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.ip2}">

					<div class="form-group">
					<label for="inputip2" class="col-sm-2 control-label">ip2</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="ip2-label"><g:fieldValue bean="${nodeInstance}" field="ip2"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.port2}">

					<div class="form-group">
					<label for="inputport2" class="col-sm-2 control-label">port2</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="port2-label"><g:fieldValue bean="${nodeInstance}" field="port2"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.user2}">

					<div class="form-group">
					<label for="inputuser2" class="col-sm-2 control-label">user2</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="user2-label"><g:fieldValue bean="${nodeInstance}" field="user2"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.password2}">

					<div class="form-group">
					<label for="inputpassword2" class="col-sm-2 control-label">password2</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.privateKey2}">

					<div class="form-group">
					<label for="inputprivateKey2" class="col-sm-2 control-label">privateKey2</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="privateKey2-label"><g:fieldValue bean="${nodeInstance}" field="privateKey2"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.passphrase2}">

					<div class="form-group">
					<label for="inputpassphrase2" class="col-sm-2 control-label">passphrase2</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.publicKey2}">

					<div class="form-group">
					<label for="inputpublicKey2" class="col-sm-2 control-label">publicKey2</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="publicKey2-label"><g:fieldValue bean="${nodeInstance}" field="publicKey2"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.ip3}">

					<div class="form-group">
					<label for="inputip3" class="col-sm-2 control-label">ip3</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="ip3-label"><g:fieldValue bean="${nodeInstance}" field="ip3"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.port3}">

					<div class="form-group">
					<label for="inputport3" class="col-sm-2 control-label">port3</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="port3-label"><g:fieldValue bean="${nodeInstance}" field="port3"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.user3}">

					<div class="form-group">
					<label for="inputuser3" class="col-sm-2 control-label">user3</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="user3-label"><g:fieldValue bean="${nodeInstance}" field="user3"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.password3}">

					<div class="form-group">
					<label for="inputpassword3" class="col-sm-2 control-label">password3</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.privateKey3}">

					<div class="form-group">
					<label for="inputprivateKey3" class="col-sm-2 control-label">privateKey3</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="privateKey3-label"><g:fieldValue bean="${nodeInstance}" field="privateKey3"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.passphrase3}">

					<div class="form-group">
					<label for="inputpassphrase3" class="col-sm-2 control-label">passphrase3</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.publicKey3}">

					<div class="form-group">
					<label for="inputpublicKey3" class="col-sm-2 control-label">publicKey3</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="publicKey3-label"><g:fieldValue bean="${nodeInstance}" field="publicKey3"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.ip4}">

					<div class="form-group">
					<label for="inputip4" class="col-sm-2 control-label">ip4</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="ip4-label"><g:fieldValue bean="${nodeInstance}" field="ip4"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.port4}">

					<div class="form-group">
					<label for="inputport4" class="col-sm-2 control-label">port4</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="port4-label"><g:fieldValue bean="${nodeInstance}" field="port4"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.user4}">

					<div class="form-group">
					<label for="inputuser4" class="col-sm-2 control-label">user4</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="user4-label"><g:fieldValue bean="${nodeInstance}" field="user4"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.password4}">

					<div class="form-group">
					<label for="inputpassword4" class="col-sm-2 control-label">password4</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.privateKey4}">

					<div class="form-group">
					<label for="inputprivateKey4" class="col-sm-2 control-label">privateKey4</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="privateKey4-label"><g:fieldValue bean="${nodeInstance}" field="privateKey4"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.passphrase4}">

					<div class="form-group">
					<label for="inputpassphrase4" class="col-sm-2 control-label">passphrase4</label>
					<div class="col-sm-10">
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.publicKey4}">

					<div class="form-group">
					<label for="inputpublicKey4" class="col-sm-2 control-label">publicKey4</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="publicKey4-label"><g:fieldValue bean="${nodeInstance}" field="publicKey4"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.dateCreated}">

					<div class="form-group">
					<label for="inputdateCreated" class="col-sm-2 control-label">dateCreated</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="dateCreated-label"><g:formatDate date="${nodeInstance?.dateCreated}" /></p>
					</div>
					</div>
				</g:if>

				<g:if test="${nodeInstance?.lastUpdated}">

					<div class="form-group">
					<label for="inputlastUpdated" class="col-sm-2 control-label">lastUpdated</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="lastUpdated-label"><g:formatDate date="${nodeInstance?.lastUpdated}" /></p>
					</div>
					</div>
				</g:if>

			</form>
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
