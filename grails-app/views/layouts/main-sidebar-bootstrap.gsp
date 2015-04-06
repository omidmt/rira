<!DOCTYPE html>
<%@ import="mt.omid.rira.Konfig" %>
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
        %{-- Make FlatUI Activate below --}%
        %{--<asset:stylesheet src="flatui/flat-ui.css" />--}%
        %{--<asset:stylesheet src="flatui/flat-ui-normal.css" />--}%
        %{-- END OF FlatUI Activation --}%
        <asset:stylesheet src="fstyle.css" />
        <asset:stylesheet src="dashboard.css" />

        %{-- Jasny --}%
        <asset:stylesheet src="jasny/css/jasny-bootstrap.css" media="screen" />


        <asset:javascript src="util.js" />
        %{-- Make FlatUI Activate below --}%
        %{--<asset:javascript src="flatui/jquery-ui-1.10.3.custom.min.js" />--}%
        %{--<asset:javascript src="flatui/jquery.ui.touch-punch.min.js" />--}%
        %{--<asset:javascript src="flatui/bootstrap-select.js" />--}%
        %{--<asset:javascript src="flatui/bootstrap-switch.js" />--}%
        %{--<asset:javascript src="flatui/flatui-checkbox.js" />--}%
        %{--<asset:javascript src="flatui/flatui-radio.js" />--}%
        %{--<asset:javascript src="flatui/jquery.tagsinput.js" />--}%
        %{--<asset:javascript src="flatui/jquery.placeholder.js" />--}%
        %{-- END OF FlatUI Activation --}%

        <asset:javascript src="sticky/jquery.sticky.js" />
        <asset:javascript src="sticky/jquery.localscroll-1.2.7-min.js" />
        <asset:javascript src="sticky/jquery.scrollTo-1.4.2-min.js" />
        <asset:javascript src="sticky/smooth-scroll.js" />

        <asset:javascript src="moments.js" />
        <asset:javascript src="bootstrap-datepicker.js" />
        <asset:stylesheet href="bootstrap-datepicker.css" />

        <asset:stylesheet href="jasny/js/jasny-bootstrap.js" />

    <g:layoutHead/>

    <r:layoutResources />
	</head>
	<body>
    %{--<div id="sticker-sticky-wrapper" class="sticky-wrapper" style="height: 56px;">--}%
    %{--<nav class="navbar navbar-default navbar-static-top navbar-lg" role="navigation" id="sticker">--}%
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">%{-- centerMrgn--}%
                %{--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">--}%
                    %{--<span class="sr-only">Toggle navigation</span>--}%
                %{--</button>--}%
                <a class="navbar-brand" data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">${Konfig.KONFIGS.appName}</a>
            </div>
            <div class="navbar-collapse collapse" id="navbar-collapse-01">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#home">Home</a></li>
                    <li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#about">About</a></li>
                    %{--<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#Services">Services</a></li>--}%
                    %{--<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#Portfolio">Portfolio</a></li>--}%
                    %{--<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#News">News</a></li>--}%
                    %{--<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#contact">Contact</a></li>--}%
                    %{--<li><a data-scroll="" data-speed="2000" data-easing="easeOutQuint" data-url="true" href="#" data-toggle="dropdown">Other Pages--}%
                        %{--<span class="caret"></span>--}%
                    %{--</a>--}%
                        %{--<span class="dropdown-arrow"></span>--}%
                        %{--<ul class="dropdown-menu">--}%
                            %{--<li><a href="index1.html">Wide Screen Slider Bottom Bar</a></li>--}%
                            %{--<li><a href="index2.html">Wide Screen Slider Top Bar</a></li>--}%
                            %{--<li><a href="index3.html">Full Screen Image</a></li>--}%
                            %{--<li><a href="index4.html">Full Screen Pattern</a></li>--}%
                            %{--<li><a href="index5.html">Full Screen Video</a></li>--}%
                            %{--<li><a href="blog_full_Width.html">Blog Full Width</a></li>--}%
                            %{--<li><a href="blog_full_Width_TwoColumns.html">Blog Two Columns</a></li>--}%
                            %{--<li><a href="blog_full_Width_ThreeColumns.html">Blog Three Columns</a></li>--}%
                            %{--<li><a href="blog_full_Width_RightSideBar.html">Right SideBar</a></li>--}%
                            %{--<li><a href="blog_full_Width_LeftSideBar.html">Left SideBar</a></li>--}%
                            %{--<li><a href="SinglePageBlog.html">Single Page Blog</a></li>--}%
                            %{--<li><a href="shortcodes.html">Shortcodes</a></li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    %{--</nav>--}%
    </div>
    %{--<br/><br/>--}%
    <div class="container-fluid">
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#">Overview</a></li>
                    <li><a href="#">Reports</a></li>
                    <li><a href="#">Analytics</a></li>
                    <li><a href="#">Export</a></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li><a href="">Nav item</a></li>
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                    <li><a href="">More navigation</a></li>
                </ul>
                <ul class="nav nav-sidebar">
                    <li><a href="">Nav item again</a></li>
                    <li><a href="">One more nav</a></li>
                    <li><a href="">Another nav item</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
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
            </div>
        </div>
        %{--<div class="footer" role="contentinfo"></div>--}%
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
    </div>
    <r:layoutResources />
	</body>
</html>
