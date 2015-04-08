<%--
  @author eomimeh
--%>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
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
                <g:form url="[controller: 'user', action:'updatePassword']" name="updatePasswordForm" id="updatePasswordForm" class="form-horizontal" role="form" >
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
                    <input type="hidden" value="" id="cyph" name="cyph" />
                    <input type="submit" value="Save" name="submit" id="submit" >
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
