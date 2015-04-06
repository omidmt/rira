
<%@ page import="mt.omid.rira.Right" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right.label', default: 'Right')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#show-right" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
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
		<div id="show-right" class="content scaffold-show" role="main">
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="alert message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list right">--}%
            <form class="form-horizontal" role="form">
			
				<g:if test="${rightInstance?.act}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputact" class="col-sm-2 control-label">act</label>
					%{--<span id="act-label" class="input-group-addon property-label"><g:message code="right.act.label" default="Act" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="act-label"><g:fieldValue bean="${rightInstance}" field="act"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${rightInstance?.ctrl}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputctrl" class="col-sm-2 control-label">ctrl</label>
					%{--<span id="ctrl-label" class="input-group-addon property-label"><g:message code="right.ctrl.label" default="Ctrl" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="ctrl-label"><g:fieldValue bean="${rightInstance}" field="ctrl"/></p>
                    
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
				<g:if test="${rightInstance?.applico}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="inputapplico" class="col-sm-2 control-label">applico</label>
					%{--<span id="applico-label" class="input-group-addon property-label"><g:message code="right.applico.label" default="Applico" /></span>--}%
                    <div class="col-sm-10">
					
						<p class="form-control-static disabled" aria-labelledby="applico-label"><g:link controller="applico" action="show" id="${rightInstance?.applico?.id}">${rightInstance?.applico?.encodeAsHTML()}</g:link></pjjj>
					
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			
            </form>
			%{--</ol>--}%
			<g:form url="[resource:rightInstance, action:'delete']" method="DELETE">
                <div class="btn-group">
                <fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="${rightInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
                </div>
			</g:form>
		</div>
    </div>
	</body>
</html>
