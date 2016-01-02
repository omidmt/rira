<%@ page import="mt.omid.rira.Konfig" %>
Invitation to <%= Konfig.KONFIGS.appName %>

Dear <%=name%>,

You are invited to join <%=Konfig.KONFIGS.appName%>. You can activate your user in <%=Konfig.KONFIGS.appName%> by following this link:

http://<%="${Konfig.KONFIGS.localAddress}${createLink(controller: 'register', action: 'accept', params:[id: uid])}"%>


Your email address is your user name to enter.

Best Regards
<%=Konfig.KONFIGS.appName%> Admin