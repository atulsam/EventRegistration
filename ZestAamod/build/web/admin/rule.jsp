<%@include file="../import.jsp" %>
<%@include file="headerCommon.jsp" %>
<%@include file="adminInfo.jsp" %>


<div style="float: left; padding-left: 13%;padding-top: 5%;">
    <h3>Add College Rule</h3><br><br>
    <%@include file="addclgrules.jsp" %>
</div>
<div style="float: right; padding-right: 13%;padding-top: 5%;">
    <h3>Change College Rule</h3><br><br>
    <%@include file="changeRules.jsp" %>
</div>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>
<div style="clear: both;"><br></div>
<%@include file="footerCommon.jsp" %>