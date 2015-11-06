<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.commons.GrailsClassUtils %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="rira">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="container">
		<br/>
        <div class="navbar">
            <div class="nav">
                <ul class="nav nav-pills">
                    <li><a class="label label-default home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="label label-primary create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
		<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<table class="table table-bordered table-striped">
			<thead>
					<tr>
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
						<% if(GrailsClassUtils.getStaticPropertyValue( domainClass.clazz, 'cloneable')) { %>
						<th></th>
						<%}%>
						<% if(GrailsClassUtils.getStaticPropertyValue( domainClass.clazz, 'deletable')) { %>
						<th></th>
						<%}%>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
					<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                    <%          } else if ( domainClass.constrainedProperties[p.name]?.password ) { %>
                        <td></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
					<% if(GrailsClassUtils.getStaticPropertyValue( domainClass.clazz, 'cloneable')) { %>
						<td class="text-center">
							<g:link action="clone" role="button" resource="\${${propertyName}}" data-toggle="tooltip" title="Clone" class="btn btn-info"><span class="glyphicon glyphicon-copy"></span></g:link>
						</td>
					<%}%>
					<% if(GrailsClassUtils.getStaticPropertyValue( domainClass.clazz, 'deletable')) { %>
						<td class="text-center">
						<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
							<button type="submit" data-toggle="tooltip" title="Delete" class="btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');" ><span class="glyphicon glyphicon-trash"></span></button>
							%{--<g:a role="button" data-toggle="tooltip" title="Delete" class="btn btn-danger" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure to delete this ?')}');"><span class="glyphicon glyphicon-trash"></span></a>--}%
						</g:form>
						</td>
					<%}%>
					</tr>
				</g:each>
				</tbody>
			</table>
			<ul class="pagination">
				<g:paginate total="\${${propertyName}Count ?: 0}" />
			</ul>
		</div>
    </div>
	</body>
</html>
