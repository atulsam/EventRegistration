<%@include file="headerCommon.jsp" %>
<%@include file="adminInfo.jsp" %>

<div style="float: left; padding-left: 13%;padding-top: 5%;">
    <h3>Unregister Event</h3><br><br>
    <%@include file="unregisterEvent.jsp" %>
</div>
<div style="float: right; padding-right: 13%;padding-top: 5%;">
    <h3>Unregister Team</h3><br><br>
    <%@include file="unregisterTeam.jsp" %>
</div>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>

<%--

<br>  <a href="./addclub.jsp">add club</a>
<br>  <a href="./addevent.jsp">add event</a>
<br>  <a href="./addclgrules.jsp">Add College Rules</a>
<br>  <a href="./changeRules.jsp">Change college rules</a>
<br>   <a href="./updateClub.jsp">Update club </a>
<br>   <a href="./updateEvent.jsp">Update event </a>

<br>  <a href="../logout.jsp">logout</a>
--%>
<%@include file="footerCommon.jsp" %>