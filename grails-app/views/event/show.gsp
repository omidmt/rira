
<%@ page import="mt.omid.rira.Event" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	%{--<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
	<div id="show-event" class="content scaffold-show" role="main">
	%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
		<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
		</g:if>
	%{--<ol class="property-list event">--}%
		<form class="form-horizontal" role="form">
			
			<g:if test="${eventInstance?.severity}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="severity" class="col-sm-2 control-label">Severity</label>
					%{--<span id="severity-label" class="input-group-addon property-label"><g:message code="event.severity.label" default="Severity" /></span>--}%
					<div class="col-sm-10">
						
						<p id="severity" class="form-control-static disabled" aria-labelledby="severity-label"><g:fieldValue bean="${eventInstance}" field="severity"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.time}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="time" class="col-sm-2 control-label">Time</label>
					%{--<span id="time-label" class="input-group-addon property-label"><g:message code="event.time.label" default="Time" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="time-label"><g:formatDate date="${eventInstance?.time}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.header}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="header" class="col-sm-2 control-label">Header</label>
					%{--<span id="header-label" class="input-group-addon property-label"><g:message code="event.header.label" default="Header" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="header-label"><g:fieldValue bean="${eventInstance}" field="header"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.description}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="description" class="col-sm-2 control-label">Description</label>
					%{--<span id="description-label" class="input-group-addon property-label"><g:message code="event.description.label" default="Description" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}" field="description"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.sender}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="sender" class="col-sm-2 control-label">Sender</label>
					%{--<span id="sender-label" class="input-group-addon property-label"><g:message code="event.sender.label" default="Sender" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="sender-label"><g:fieldValue bean="${eventInstance}" field="sender"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.impact}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="impact" class="col-sm-2 control-label">Impact</label>
					%{--<span id="impact-label" class="input-group-addon property-label"><g:message code="event.impact.label" default="Impact" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="impact-label"><g:fieldValue bean="${eventInstance}" field="impact"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.resolution}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="resolution" class="col-sm-2 control-label">Resolution</label>
					%{--<span id="resolution-label" class="input-group-addon property-label"><g:message code="event.resolution.label" default="Resolution" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="resolution-label"><g:fieldValue bean="${eventInstance}" field="resolution"/></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
			<g:if test="${eventInstance?.fixed}">
			%{--<li class="fieldcontain">--}%
				<div class="form-group">
					%{--<span class="input-group-addon">@</span>--}%
					<label for="fixed" class="col-sm-2 control-label">Fixed</label>
					%{--<span id="fixed-label" class="input-group-addon property-label"><g:message code="event.fixed.label" default="Fixed" /></span>--}%
					<div class="col-sm-10">
						
						<p class="form-control-static disabled" aria-labelledby="fixed-label"><g:formatBoolean boolean="${eventInstance?.fixed}" /></p>
						
					</div>
					%{--</li>--}%
				</div>
			</g:if>
			
		</form>
	%{--</ol>--}%
		<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
			<div class="btn-group">
				<fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</div>
		</g:form>
	</div>
</div>
</body>
</html>
