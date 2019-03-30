<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>
<div style="padding-top: 4%;">
    <center>
        <form action="showByPid.jsp" method="get">
            <input type="number" name="pid" placeholder="participant id" required="" min="1000" max="9999"/><br>
            <input type="hidden" value="pid" name="title"/>
            <button type="submit" class="btn">
                <div class="icon-search"></div>
                search details
            </button>
        </form>
    </center>
</div>
<div id="div_print" class="centered">
<%@include file="showByPidAction.jsp" %>
</div>
<%@include file="footerCommon.jsp" %>