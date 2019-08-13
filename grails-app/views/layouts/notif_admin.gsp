<g:applyLayout name="rira">
	<!DOCTYPE html>
    <!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
    <!--[if IE 7 ]>	<html lang="en" class="no-js ie7"> <![endif]-->
    <!--[if IE 8 ]>	<html lang="en" class="no-js ie8"> <![endif]-->
    <!--[if IE 9 ]>	<html lang="en" class="no-js ie9"> <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Notification Admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

	<g:layoutHead/>
	<r:layoutResources />
</head>
<body>
<div class="col-md-10 col-md-offset-1">
	<ul class="nav nav-tabs" id="tab">
		<li class="active"><a href="#recipient" data-toggle="tab">Recipients</a></li>
		<li><a href="#notificationGroup" data-toggle="tab">Notification Groups</a></li>
		<li><a href="#notificationHistory" data-toggle="tab">History</a></li>
		<li><a href="#template" data-toggle="tab">Templates</a></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane active" id="recipient">
			<g:if test="${controllerName == 'recipient'}">
				<g:layoutBody/>
			</g:if>
		</div>
		<div class="tab-pane" id="notificationGroup">
			<g:if test="${controllerName == 'notificationGroup'}">
				<g:layoutBody/>
			</g:if>
		</div>
		<div class="tab-pane active" id="notificationHistory">
			<g:if test="${controllerName == 'notificationHistory'}">
				<g:layoutBody/>
			</g:if>
		</div>
		<div class="tab-pane active" id="template">
			<g:if test="${controllerName == 'template'}">
				<g:layoutBody/>
			</g:if>
		</div>
	</div>
</div>
<div class="footer" role="contentinfo"></div>
<r:layoutResources />
<script type="text/javascript" >
	$(function () {
		$('#tab a[href="#${controllerName}"]').tab('show');
	});

	$( 'a[data-toggle="tab"]' ).on( 'show.bs.tab', function( e )
	{
		var target = $( e.target ).attr( "href" );
		target = target.substring( 1, target.length );
		if( window.location.href.indexOf( target ) < 0 )
			window.location = window.grails.baseUrl + target;
	});
</script>
</body>
</html>
</g:applyLayout>