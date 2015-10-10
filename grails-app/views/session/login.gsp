<%--
  @author eomimeh
--%>

<html>
<head>
    <meta name="layout" content="rira">
    <title>CAMP Sign In</title>
    <asset:javascript src="pidcrypt/string_extend.js" />
    <asset:javascript src="pidcrypt/seedrandom.js" />
    <asset:javascript src="pidcrypt/pidcrypt_util.js" />
    <asset:javascript src="pidcrypt/pidcrypt.js" />
    <asset:javascript src="pidcrypt/md5.js" />
    <asset:javascript src="pidcrypt/aes_core.js" />
    <asset:javascript src="pidcrypt/aes_cbc.js" />
    <asset:javascript src="pidcrypt/asn1.js" />
    <asset:javascript src="pidcrypt/jsbn.js" />
    <asset:javascript src="pidcrypt/rsa.js" />
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="login-form">
                <g:form url="[controller: 'Session', action:'save']" name="loginForm" id="loginForm" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Username" id="username" name="username" />
                        <label class="login-field-icon fui-user" for="username"></label>
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control login-field" value="" placeholder="Password" id="password" name="password" />
                        <label class="login-field-icon fui-lock" for="password"></label>
                    </div>
                    <input type="hidden" value="" id="cd" name="cd" />
                    <input type="hidden" value="" id="sk" name="sk" />
                    <input type="submit" style="width: 0px; height: 0px; opacity: 0;" id="submitBtn" name="submitBtn">
                    <a class="btn btn-primary btn-lg btn-block" href="#" onclick="$(this).closest('form').submit();">Sign in</a>
                </g:form>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">;
<g:if test="${mt.omid.rira.Konfig.KONFIGS['pemPublicKey']}" >
var mypubkey = `<%=mt.omid.rira.Konfig.KONFIGS['pemPublicKey']%>`;
</g:if>
</script>

</body>
</html>
