<%--
  @author eomimeh
--%>

<html>
<head>
    <meta name="layout" content="main">
  <title>Notification Admin</title>
</head>
<body>
<ul class="nav nav-tabs" id="tab">
    <li class="active"><a href="#recp" data-toggle="tab">Recipients</a></li>
    <li><a href="#group" data-toggle="tab">Notification Groups</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="recp">...</div>
    <div class="tab-pane" id="group">...</div>
</div>
</body>
</html>

<script type="text/javascript" >
$(function () {
    $('#tab a:last').tab('show')
});
</script>
