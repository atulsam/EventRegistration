<%@include file="../import.jsp" %>
<%@include file="headerCommon.jsp" %>
<%@include file="adminInfo.jsp" %>

<div style="float: left; padding-left: 13%;padding-top: 5%;">
    <h3>Add Club</h3><br>
    <%@include file="addclub.jsp" %>
</div>
<div style="float: right; padding-right: 13%;padding-top: 5%;">
    <h3>Update Club</h3><br>
    <%@include file="updateClub.jsp" %>
</div>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>


<%@include file="footerCommon.jsp" %>