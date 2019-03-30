<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>
<div style="padding-top: 4%;">
    <center>
        <form action="showByTid.jsp" method="get">
            <input type="number" name="tid" placeholder="team id" required="" min="20000"/><br>
            <input type="hidden" value="tid" name="title"/>
            <button type="submit" class="btn">
                <div class="icon-search"></div>
                search team
            </button>
        </form>
    </center>
</div>
<div id="div_print" class="centered">
<%@include file="showByTidAction.jsp" %>
</div>

<%@include file="footerCommon.jsp" %>