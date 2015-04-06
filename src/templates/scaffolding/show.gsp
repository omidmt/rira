<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		%{--<a href="#show-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="label label-primary  create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="show-${domainClass.propertyName}" class="content scaffold-show" role="main">
			%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
			<g:if test="\${flash.message}">
			<div class="alert message" role="status">\${flash.message}</div>
			</g:if>
			%{--<ol class="property-list ${domainClass.propertyName}">--}%
            <form class="form-horizontal" role="form">
			<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<g:if test="\${${propertyName}?.${p.name}}">
				%{--<li class="fieldcontain">--}%

                    <div class="form-group">
                    %{--<span class="input-group-addon">@</span>--}%
                    <label for="input${p.name}" class="col-sm-2 control-label">${p.name}</label>
					%{--<span id="${p.name}-label" class="input-group-addon property-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></span>--}%
                    <div class="col-sm-10">
					<%  if (p.isEnum()) { %>
						<p id="${p.name}" class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
					<%  } else if (p.oneToMany || p.manyToMany) { %>
						<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></p>
						</g:each>
					<%  } else if (p.manyToOne || p.oneToOne) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></pjjj>
					<%  } else if (p.type == Boolean || p.type == boolean) { %>
                        <p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></p>
                    <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></p>
                    <%  } else if ( domainClass.constrainedProperties[p.name]?.password ) { %>
                    <%  } else if (!p.type.isArray()) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
                    <%  } %>
                    </div>
				%{--</li>--}%
                    </div>
				</g:if>
			<%  } %>
            </form>
			%{--</ol>--}%
			<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
                <div class="btn-group">
                <fieldset class="form-group">
					<g:link class="edit btn btn-default" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-default" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
                </div>
			</g:form>
		</div>
    </div>
	</body>
</html>
