<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>

<div style="float: left; padding-left: 13%;padding-top: 5%;">
    <h3>Register New User</h3><br><br>
    <%@include file="register.jsp" %>
</div>

<div style="float: right; padding-right: 13%;padding-top: 5%;">
    <h3>Update User Info</h3><br><br>
    <%@include file="update.jsp" %>
</div>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>

<%@include file="footerCommon.jsp" %>