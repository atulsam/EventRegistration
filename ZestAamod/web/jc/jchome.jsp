<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>

<div style="float: left; padding-left: 45%;padding-top: 5%;">
    <h3>Select Event name</h3><br><br>
    <%@include file="showParticipantsByEvent.jsp" %>
</div>
<div style="clear: both;"><br></div>

<div class="centered">
    <%@include file="showParticipantByEventAction.jsp" %>
</div>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
    session.setAttribute("msg", "");
%>
<%@include file="footerCommon.jsp" %>