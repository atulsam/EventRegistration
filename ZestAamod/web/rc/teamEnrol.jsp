<%@include file="../importPackages.jsp" %>
<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>

<%!    Connection connct;
    Statement stmnt;
    ResultSet rset = null;
    String ppID;
%>
<%
    ServletContext Co = getServletContext();
    connct = org.conn.connect(Co.getInitParameter("id"), Co.getInitParameter("pass"));
    try {
        stmnt = connct.createStatement();
        rset = stmnt.executeQuery("select `eid`,`ename`,`club` from `events` where `type`='zest' and `group` >1 order by club ");
        String event = "";
        //out.print(" <br><br><br> Zest events  <br><br><br>");
%>
<div style="float: left; padding-left: 20%;padding-top: 5%;">
    <h3>Zest Events</h3>
    <form action="teamEnrol2.jsp?title=team" method="post">
        <% while (rset.next()) {
                if (!event.equals(rset.getString(3))) {
                    out.print("<br><h5>club : " + rset.getString(3) + "</h5>");
                    //out.println("<br<br><br>");
                }
                event = rset.getString(3);
        %>
        <label><input type="radio" name="eid" value="<%=rset.getString(1)%>"/>&nbsp;<%=rset.getString(2)%></label>
            <%
                }%>
</div><div style="float: right; padding-right: 20%;padding-top: 5%;">
    <h3>Aamod Events</h3>
    <%
        rset = stmnt.executeQuery("select `eid`,`ename`,`club` from `events` where `type`='Aamod' and `group` >1 order by club  ");
        while (rset.next()) {
            if (!event.equals(rset.getString(3))) {
                out.print("<br><h5>club : " + rset.getString(3) + "</h5>");
                //out.println("<br><br><br>");
            }
            event = rset.getString(3);
    %>
    <label><input type="radio" name="eid" value="<%=rset.getString(1)%>"/>&nbsp;<%=rset.getString(2)%></label>
        <%
            }
        %>


</div>
<br>
<div style="padding-left: 45%;clear: both;">
    <button class="btn">
        <div  class="icon-check"></div>
        select event
    </button>
</div>
</form>

<%
    } catch (Exception e) {
        out.print(e);

    } finally {
        boolean b = org.conn.close(connct);
    }
%>
<br><br><br>

<%@include file="footerCommon.jsp" %>