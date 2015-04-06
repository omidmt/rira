<%--
  Created by IntelliJ IDEA.
  User: eomimeh
  Date: 6/21/14
  Time: 2:33 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
  <title>Notification Admin</title>
</head>
<body>
<ul class="nav nav-tabs" id="tab">
    <li class="active"><a href="#recp" data-toggle="tab">Recipients</a></li>
    <li><a href="#group" data-toggle="tab">Notification Groups</a></li>
    %{--<li><a href="#messages" data-toggle="tab">Messages</a></li>--}%
    %{--<li><a href="#settings" data-toggle="tab">Settings</a></li>--}%
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="recp">...</div>
    <div class="tab-pane" id="group">...</div>
    %{--<div class="tab-pane" id="messages">...</div>--}%
    %{--<div class="tab-pane" id="settings">...</div>--}%
</div>
</body>
</html>

<script type="text/javascript" >
    $(function () {
        $('#tab a:last').tab('show')
    });
</script>