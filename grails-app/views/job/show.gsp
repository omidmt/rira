<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'job.label', default: 'Job')}" />
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
		<div id="show-job" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			<form class="form-horizontal" role="form">

				<g:if test="${jobInstance?.name}">
					<div class="form-group">
					<label for="inputname" class="col-sm-2 control-label">Job Name</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="name-label"><g:fieldValue bean="${jobInstance}" field="name"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${jobInstance?.description}">
					<div class="form-group">
					<label for="inputdescription" class="col-sm-2 control-label">Description</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue bean="${jobInstance}" field="description"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${jobInstance?.log}">
					<div class="form-group">
					<label for="inputlog" class="col-sm-2 control-label">Log</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="log-label"><g:textArea disabled="true" rows="10" cols="50" name="log" value="${jobInstance?.log}"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${jobInstance?.status}">
					<div class="form-group">
					<label for="inputstatus" class="col-sm-2 control-label">Status</label>
					<div class="col-sm-10">
						<p id="status2" class="form-control-static disabled" aria-labelledby="status-label"><g:fieldValue bean="${jobInstance}" field="status"/></p>
					</div>
					</div>
				</g:if>

				<g:if test="${jobInstance?.endTime}">
					<div class="form-group">
					<label for="inputendTime" class="col-sm-2 control-label">End Time</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="endTime-label"><g:formatDate date="${jobInstance?.endTime}" /></p>
					</div>
					</div>
				</g:if>

				<g:if test="${jobInstance?.startTime}">
					<div class="form-group">
					<label for="inputstartTime" class="col-sm-2 control-label">Start Time</label>
					<div class="col-sm-10">
						<p class="form-control-static disabled" aria-labelledby="startTime-label"><g:formatDate date="${jobInstance?.startTime}" /></p>
					</div>
					</div>
				</g:if>

			</form>
		</div>
	</div>
	</body>
</html>
