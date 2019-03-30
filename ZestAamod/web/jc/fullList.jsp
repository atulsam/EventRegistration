<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>

<div style="float: left; padding-left: 25%;padding-top: 5%;">
    <h3>Select College</h3><br><br>
    <%@include file="showParticipantsByCollege.jsp" %>
</div>
<div style="float: right; padding-top: 5%;">
    <h3>Participants List of All Colleges</h3><br><br>
    <form action="fullList_1.jsp" method="post">
        <input type="submit" value="Get Full List">
    </form>
    
</div>
<div style="clear: both;"><br></div>

<div class="centered">
    <%@include file="showParticipantsByCollegeAction.jsp" %>
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

