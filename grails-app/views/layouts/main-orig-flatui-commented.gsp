<%@ import="mt.omid.rira.Konfig" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
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

        <asset:javascript src="util.js" />

        <asset:javascript src="sticky/jquery.sticky.js" />
        <asset:javascript src="sticky/jquery.localscroll-1.2.7-min.js" />
        <asset:javascript src="sticky/jquery.scrollTo-1.4.2-min.js" />
        <asset:javascript src="sticky/smooth-scroll.js" />

        <asset:javascript src="moments.js" />
        <asset:javascript src="bootstrap-datepicker.js" />
        <asset:stylesheet href="bootstrap-datepicker.css" />
    <g:layoutHead/>

    <r:layoutResources />
	</head>
	<body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container ">
            <div class="navbar-header centerMrgn">
                <a class="navbar-brand" data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">${Konfig.KONFIGS.appName}</a>
            </div>
            <div class="collapse navbar-collapse " id="navbar-collapse-01">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">Home</a></li>
                    <li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#about">About</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div>
    <br/><br/>
    <div class="container">
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
        <div class="col-md-8 col-md-offset-1">
            <div class="row">
                <div class="">
                    <g:layoutBody/>
                </div>
            </div>
        </div>
        </div>
		<div class="footer" role="contentinfo"></div>
    </div>
    <r:layoutResources />
	</body>
</html>
