<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="rira">
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
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
		%{--<g:if test="\${flash.message}">--}%
			%{--<div class="alert message" role="status">\${flash.message}</div>--}%
		%{--</g:if>--}%
		<form class="form-horizontal" role="form">
			<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
			allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
			props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
			Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
			props.each { p -> %>
			<g:if test="\${${propertyName}?.${p.name}}">
				<div class="form-group">
					<label for="${p.name}" class="col-sm-2 control-label">${p.naturalName}</label>
					<div class="col-sm-10">
						<%  if (p.isEnum()) { %>
						<p id="${p.name}" class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
						<%  } else if (p.oneToMany || p.manyToMany) { %>
						<g:select id="${p.name}"
								  name="${p.name}.id"
								  class="form-control"
								  from="\${${p.referencedDomainClass?.clazz.name}.list()}"
								  optionKey="id"
								  size="10"
								  value="\${${propertyName}?.${p.name}*.id}"
								  class="many-to-many"
								  multiple="multiple"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						<%  } else if (p.manyToOne || p.oneToOne) { %>
						<g:select id="${p.name}"
								  name="${p.name}.id"
								  class="form-control"
								  from="\${${p.referencedDomainClass?.clazz.name}.list()}"
								  optionKey="id"
								  size="10"
								  value="\${${propertyName}?.${p.name}?.id}"
								  class="many-to-one"
								  disabled="disabled"
								  noSelection="['null': '']"/>
						<%  } else if (p.type == Boolean || p.type == boolean) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></p>
						<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></p>
						<%  } else if ( domainClass.constrainedProperties[p.name]?.password ) { %>
						<%  } else if (!p.type.isArray()) { %>
						<p class="form-control-static disabled" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
						<%  } %>
					</div>
				</div>
			</g:if>
			<%  } %>
		</form>
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
