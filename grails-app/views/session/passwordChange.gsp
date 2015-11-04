<%--
  @author eomimeh
--%>
<html>
<head>
    <meta name="layout" content="rira">
    <title>Change Settings</title>
    <asset:javascript src="pidcrypt/string_extend.js" />
    <asset:javascript src="pidcrypt/seedrandom.js" />
    <asset:javascript src="pidcrypt/pidcrypt_util.js" />
    <asset:javascript src="pidcrypt/pidcrypt.js" />
    <asset:javascript src="pidcrypt/prng4.js" />
    <asset:javascript src="pidcrypt/rng.js" />
    <asset:javascript src="pidcrypt/md5.js" />
    <asset:javascript src="pidcrypt/aes_core.js" />
    <asset:javascript src="pidcrypt/aes_cbc.js" />
    <asset:javascript src="pidcrypt/asn1.js" />
    <asset:javascript src="pidcrypt/jsbn.js" />
    <asset:javascript src="pidcrypt/rsa.js" />
</head>

<body>
<div class="container">
    <g:hasErrors bean="${user}">
        <div class="row">
            <div class="col-md-6 alert alert-danger">
                <ul class="errors" role="alert">
                    <g:eachError bean="${user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </div>
    </g:hasErrors>
    <div class="row">
        <div class="col-md-4">
            <div class="login-form">
                <g:form url="[controller: 'session', action:'updatePassword']" name="updatePasswordForm" id="updatePasswordForm" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label class="login-field-icon fui-lock" for="curPass">Current Password</label>
                        <input type="password" class="form-control login-field" value="" placeholder="Current Password" id="curPass" name="curPass" />
                    </div>
                    <div class="form-group">
                        <label class="login-field-icon fui-lock" for="newPass">New Password</label>
                        <input type="password" class="form-control login-field" value="" placeholder="New Password" id="newPass" name="newPass" />
                    </div>
                    <div class="form-group">
                        <label class="login-field-icon fui-lock" for="confPass">Confirm Password</label>
                        <input type="password" class="form-control login-field" value="" placeholder="Confirm Password" id="confPass" name="confPass" />
                    </div>
                    <input type="hidden" value="" id="cd" name="cd" />
                    <input type="hidden" value="" id="sk" name="sk" />
                    <input type="hidden" value="${userId}" id="id" name="id" />
                    <input type="submit" value="Save" name="submit" id="submit" onclick="updatePassword()" >
                </g:form>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    <g:if test="${mt.omid.rira.Konfig.KONFIGS['pemPublicKey']}" >
    var mypubkey = `<%=mt.omid.rira.Konfig.KONFIGS['pemPublicKey']%>`;
    </g:if>
</script>
</body>
</html>
