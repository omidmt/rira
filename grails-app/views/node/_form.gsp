<%@ page import="mt.omid.rira.Node" %>



    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'name', 'error')} required">
        <label for="name" class="col-sm-3 control-label">
            <g:message code="node.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:textField name="name" class="form-control"  maxlength="50" required="" value="${nodeInstance?.name}"/>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'profile', 'error')} ">
        <label for="profile" class="col-sm-3 control-label">
            <g:message code="node.profile.label" default="Profile" />
            
        </label>
		<div class="col-sm-6">
        	<g:select id="profile" name="profile.id" class="form-control"  from="${mt.omid.rira.NodeProfile.list()}" optionKey="id" value="${nodeInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/NodeProfile/createEmbeded', '#profile' )"> New Profile</a>
</div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'active', 'error')} ">
        <label for="active" class="col-sm-3 control-label">
            <g:message code="node.active.label" default="Active" />
            
        </label>
		<div class="col-sm-6">
        	<g:checkBox name="active" value="${nodeInstance?.active}" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'master', 'error')} ">
        <label for="master" class="col-sm-3 control-label">
            <g:message code="node.master.label" default="Master" />
            
        </label>
		<div class="col-sm-6">
        	<g:checkBox name="master" value="${nodeInstance?.master}" />

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'connectivityPlans', 'error')} ">
        <label for="connectivityPlans" class="col-sm-3 control-label">
            <g:message code="node.connectivityPlans.label" default="Connectivity Plans" />
            
        </label>
		<div class="col-sm-6">
        	
<ul id="connectivityPlans" class="one-to-many" data-link="'${request.contextPath}/connectivityPlan/show'">
<g:each in="${nodeInstance?.connectivityPlans?}" var="c">
    <li><g:link controller="connectivityPlan" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">

<div class="new-item">

<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/connectivityPlan/createEmbeded?node.id=${nodeInstance?.id}', '#connectivityPlans', '#connectivityPlans' )"> New Connectivity Plan</a>

</div>
</li>
</ul>


		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'nodeType', 'error')} required">
        <label for="nodeType" class="col-sm-3 control-label">
            <g:message code="node.nodeType.label" default="Node Type" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select id="nodeType" name="nodeType.id" class="form-control"  from="${mt.omid.rira.NodeType.list()}" optionKey="id" required="" value="${nodeInstance?.nodeType?.id}" class="many-to-one"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/NodeType/createEmbeded', '#nodeType' )"> New Node Type</a>
</div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'os', 'error')} required">
        <label for="os" class="col-sm-3 control-label">
            <g:message code="node.os.label" default="OS" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select id="os" name="os.id" class="form-control"  from="${mt.omid.rira.OS.list()}" optionKey="id" required="" value="${nodeInstance?.os?.id}" class="many-to-one"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/OS/createEmbeded', '#os' )"> New Os</a>
</div>

		</div>
    </div>

    <div class="form-group ${hasErrors(bean: nodeInstance, field: 'serverType', 'error')} required">
        <label for="serverType" class="col-sm-3 control-label">
            <g:message code="node.serverType.label" default="Server Type" />
            <span class="required-indicator">*</span>
        </label>
		<div class="col-sm-6">
        	<g:select id="serverType" name="serverType.id" class="form-control"  from="${mt.omid.rira.ServerType.list()}" optionKey="id" required="" value="${nodeInstance?.serverType?.id}" class="many-to-one"/>
<div class="new-item">
<a class="new-item-link" data-toggle="modal" data-target="#rDialog" href="#" onclick="loadDialog( '${request.contextPath}/ServerType/createEmbeded', '#serverType' )"> New Server Type</a>
</div>

		</div>
    </div>

