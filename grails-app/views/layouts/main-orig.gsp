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
        <asset:stylesheet src="flatui/flat-ui.css" />


        <asset:javascript src="flatui/jquery-ui-1.10.3.custom.min.js" />
        <asset:javascript src="flatui/jquery.ui.touch-punch.min.js" />
        <asset:javascript src="flatui/bootstrap-select.js" />
        <asset:javascript src="flatui/bootstrap-switch.js" />
        <asset:javascript src="flatui/flatui-checkbox.js" />
        <asset:javascript src="flatui/flatui-radio.js" />
        <asset:javascript src="flatui/jquery.tagsinput.js" />
        <asset:javascript src="flatui/jquery.placeholder.js" />

    <g:layoutHead/>

    <r:layoutResources />
	</head>
	<body>
    <div class="container">
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
        <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <g:if test="${flash.error}">
                <div class="alert alert-danger" role="status" style="display: block">${flash.error}</div>
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
                %{--<div class="">--}%
                    %{--Test<br>--}%
                %{--</div>--}%
            </div>
        </div>
        </div>
		<div class="footer" role="contentinfo"></div>
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
    </div>
    <r:layoutResources />
	</body>
</html>
