<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		%{--<title><g:layoutTitle default="Grails"/></title>--}%
        <title>Notification Admin</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		%{--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">--}%
		%{--<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">--}%
		%{--<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">--}%
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%
        %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">--}%
        %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.css')}" type="text/css">--}%

        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

		<g:layoutHead/>
		<g:javascript library="application"/>
        <g:javascript library="bootstrap"/>
        <asset:stylesheet src="rira.css"/>
        <asset:javascript src="rira.js"/>
		<r:layoutResources />
	</head>
	<body>
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
        <div class="col-md-4 col-md-offset-4">
            <g:if test="${flash.error}">
                <div class="alert alert-danger" role="status" style="display: block">${flash.error}</div>
            </g:if>
            <g:if test="${flash.message}">
                <div class="alert alert-info" role="status" style="display: block">${flash.message}</div>
            </g:if>
        </div>
        <div class="col-md-10 col-md-offset-1">
            <ul class="nav nav-tabs" id="tab">
                <li class="active"><a href="#recipient" data-toggle="tab">Recipients</a></li>
                <li><a href="#notificationGroup" data-toggle="tab">Notification Groups</a></li>
                <li><a href="#notificationHistory" data-toggle="tab">History</a></li>
                <li><a href="#template" data-toggle="tab">Templates</a></li>
                %{--<li><a href="#messages" data-toggle="tab">Messages</a></li>--}%
                %{--<li><a href="#settings" data-toggle="tab">Settings</a></li>--}%
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="recipient">
                    <%
                    if( controllerName == 'recipient' )
                    {
                    %>
                        <g:layoutBody/>
                    <%
                    }
                    %>
                </div>
                <div class="tab-pane" id="notificationGroup">
                    <%
                    if( controllerName == 'notificationGroup' )
                    {
                    %>
                    <g:layoutBody/>
                    <%
                    }
                    %>
                </div>
                <div class="tab-pane active" id="notificationHistory">
                    <%
                        if( controllerName == 'notificationHistory' )
                        {
                    %>
                    <g:layoutBody/>
                    <%
                        }
                    %>
                </div>
                <div class="tab-pane active" id="template">
                    <%
                        if( controllerName == 'template' )
                        {
                    %>
                    <g:layoutBody/>
                    <%
                        }
                    %>
                </div>
                %{--<div class="tab-pane" id="messages">...</div>--}%
                %{--<div class="tab-pane" id="settings">...</div>--}%
            </div>
        </div>
		<div class="footer" role="contentinfo"></div>
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
		<r:layoutResources />
	</body>
</html>
<script type="text/javascript" >
    $(function () {
//        $('#tab a:last').tab('show')
        $( '#tab a[href="#${controllerName}"]' ).tab( 'show' );
    });

    $( 'a[data-toggle="tab"]' ).on( 'show.bs.tab', function( e )
    {
        var target = $( e.target ).attr( "href" );
        target = target.substring( 1, target.length );
        if( window.location.href.indexOf( target ) < 0 )
            window.location = "/" + target;
    });
</script>
