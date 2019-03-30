<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>

<div style="float: left; padding-left: 13%;padding-top: 5%;text-align: left;">
    <h3>Alumni Registration</h3><br><br>
    <form action="passOutAction.jsp" method="post" >
        <input type="text" name="name" required="" placeholder="name" /><br>
        <input type="number" name="mobile" required="" min="1000000000" max="9999999999" placeholder="mobile no" /><br>
        <input type="number" required="" max="2013" min="1990" name="batch" placeholder="batch" />
        <h6>Select course</h6>
        <label><input type="radio" name="course" value="B. Tech" checked="">&nbsp;B. Tech</label>
        <label><input type="radio" name="course" value="M. Tech">&nbsp;M. Tech</label>
        <label><input type="radio" name="course" value="B. Pharma">&nbsp;B. Pharma</label>
        <label><input type="radio" name="course" value="M. Pharma">&nbsp;M. Pharma</label>
        <label><input type="radio" name="course" value="MBA">&nbsp;MBA</label>
        <label><input type="radio" name="course" value="MCA">&nbsp;MCA</label>
        <button class="btn">
            <div class="icon-check"></div>
            Register
        </button>
    </form>
</div>
<div style="float: right; padding-right: 8%;padding-top: 5%;">
    <h3>Alumni Registered</h3><br><br>
    <div style="width:400px;height:400px;overflow:auto;" >
        <div id="div_print">
            <%@include file="passOutPrint.jsp" %>
        </div>
    </div>
    <br>
    <button type="button" class="btn" onClick="printdiv('div_print');">
        <div class="icon-print"></div>
        print
    </button>
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