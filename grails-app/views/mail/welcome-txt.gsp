<%@ page import="mt.omid.rira.Konfig" %>
Welcome to <%= Konfig.KONFIGS.appName %>

Dear <%= user.name %>,

Your account on <%=Konfig.KONFIGS.appName%> is activated. You can start using it now.
<%=Konfig.KONFIGS.appName%> at http://<%="${Konfig.KONFIGS.localAddress}${request.contextPath}"%>/


Your email address is your user Id to enter.
<g:if test="${Konfig.KONFIGS.sendPasswordInMail}">Your password is <%=password%> <br/>
</g:if>
Please change it as soon as possible in settings section.

Best Regards
<%=Konfig.KONFIGS.appName%> Admin