<%@ import="mt.omid.rira.Konfig" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>	<html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>	<html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>	<html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="CAMP"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

		<asset:stylesheet href="rira.css"/>
		<asset:javascript src="rira.js"/>

		<asset:stylesheet href="bootstrap/bootstrap.css" />
		<asset:javascript src="bootstrap/bootstrap.js" />

		<asset:stylesheet href="font-awesome/css/font-awesome.min.css" />
		<asset:stylesheet src="fstyle.css" />

		%{-- Jasny --}%
		<asset:stylesheet src="jasny/css/jasny-bootstrap.css" media="screen" />
		<asset:stylesheet src="jasny/jasny-reveal.css" media="screen" />

		<asset:javascript src="util.js" />

		<asset:javascript src="sticky/jquery.sticky.js" />
		<asset:javascript src="sticky/jquery.localscroll-1.2.7-min.js" />
		<asset:javascript src="sticky/jquery.scrollTo-1.4.2-min.js" />
		<asset:javascript src="sticky/smooth-scroll.js" />

		<asset:javascript src="moments.js" />
		<asset:javascript src="bootstrap-datepicker.js" />
		<asset:stylesheet href="bootstrap-datepicker.css" />

		<asset:javascript src="jasny/js/jasny-bootstrap.js" />

	<g:layoutHead/>

	<r:layoutResources />
	</head>
	<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">%{-- centerMrgn--}%
				<button type="button" class="navbar-toggle" id="toggleMenu">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">${Konfig.KONFIGS.appName}</a>
			</div>
			<div class="navbar-collapse collapse" id="navbar-collapse-01">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">Home</a></li>
					<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#about">About</a></li>
					<li><g:link controller="user" action="settings" data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true">Setting</g:link></li>
					<li><g:link mapping="logout" data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true">Sign Out</g:link></li>

				</ul>
			</div><!-- /.navbar-collapse -->
		</div>
	</div>
	<div class="navmenu navmenu-default navmenu-inverse navmenu-fixed-left col-md-4" id="navmenu">
	<g:if test="${applicos}" >
		<g:each in="${applicos.groupBy( {it.family} ).sort({it.key})}" var="group">
		<ul class="nav navmenu-nav nav-sidebar">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">${group.key}<b class="caret"></b></a>
				<ul class="navmenu-nav">
					<g:each in="${group.value.sort({it.name})}" var="applico">
					<li data-toggle="expand" data-target=".nav-collapse" title="${applico.description}"><a href="${request.contextPath}/${applico.path}">${applico.name}</a></li>
					</g:each>
				</ul>
			</li>
		</ul>
		</g:each>
	</g:if>
	</div>
	<div class="canvas col-md-8" id="canvas">
	<div class="">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<g:if test="${flash.error}">
					<div class="alert alert-danger" role="status" style="display: block">${flash.error}</div>
				</g:if>
				<g:if test="${flash.success}">
					<div class="alert alert-success" role="status" style="display: block">${flash.success}</div>
				</g:if>
				<g:if test="${flash.message}">
					<div class="alert alert-info" role="status" style="display: block">${flash.message}</div>
				</g:if>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">%{-- col-md-offset-1--}%
				<div class="row">
					<div class="">
						<g:layoutBody/>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<r:layoutResources />
	<div class="modal fade r-modal" id="rDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog r-modal-dialog">
			<div class="modal-content r-modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="rDialogLabel"></h4>
				</div>
				<div id="rDialogBody" class="modal-body r-modal-body">
					Loading ...
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="rDialogSaveBtn">Save</button>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>
