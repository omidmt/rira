<%--
  @author eomimeh
--%>

<html>
<head>
    <meta name="layout" content="rira">
    <title>CAMP Sign In</title>
</head>

<body>
<div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="login-form">
            <g:form url="[controller: 'Session', action:'save']" name="loginForm" id="loginForm" class="form-horizontal" role="form" >
            <div class="form-group">
                <input type="text" class="form-control login-field" value="" placeholder="Enter usernamee" id="username" name="username" />
                <label class="login-field-icon fui-user" for="username"></label>
            </div>

            <div class="form-group">
                <input type="password" class="form-control login-field" value="" placeholder="Password" id="password" name="password" />
                <label class="login-field-icon fui-lock" for="password"></label>
            </div>
            <input type="hidden" value="" id="cyph" name="cyph" />
            <input type="submit" class="hide">
            <a class="btn btn-primary btn-lg btn-block" href="#" onclick="$(this).closest('form').submit();">Sign in</a>
            </g:form>
        </div>
      </div>
    </div>
</div>

<script type="application/javascript">
$( "#loginForm" ).submit( signin );
</script>

</body>
</html>
