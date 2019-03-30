<%@include file="../importPackages.jsp" %>
<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>

<%! Connection connectn;
    Statement stateme;
    ResultSet resltset = null, resltset1 = null;
    String eventid, temid, tnames;
    int incr, noprt, grpprt;
%>

<%
    if (request.getParameter("msg") != null && request.getParameter("msg") != "") {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    }
    if (request.getParameter("msgs") != null && request.getParameter("msgs") != "") {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>

<%
    temid = request.getParameter("tid");
    ServletContext Context6 = getServletContext();
    connectn = org.conn.connect(Context6.getInitParameter("id"), Context6.getInitParameter("pass"));
    if (temid == null) {
%>
<div style="padding-top: 3%">
    <center>
        <form method="post" action="updateTeam.jsp?title=updateTeam">
            <input type="number" name="tid" min="20000" max="99999" required="" placeholder="team id"/><br>
            <button class="btn">
                <div class="icon-update"></div>
                update
            </button>
        </form>
    </center>
</div>
<%} else {
%>

<form action="updateTeamAction.jsp" method="post">
    <%
        try {
            stateme = connectn.createStatement();
            resltset = stateme.executeQuery("select eid,names,nop from team where tid='" + temid + "'");
            tnames = "";
            eventid = "";
            noprt = 0;
            if (!resltset.next()) {
    %>
    <div style="padding-top: 3%">
        <center>
            <form method="post" action="updateTeam.jsp?title=updateTeam">
                <input type="number" name="tid" min="20000" max="99999" required="" placeholder="team id"/><br>
                <button class="btn">
                    <div class="icon-update"></div>
                    update
                </button>
            </form>
            <br><br><br>
            <div class="alert">No such team exists</div>
        </center>
    </div>
    <%    } else {
        eventid = resltset.getString(1);
        noprt = resltset.getInt(3);
        tnames = resltset.getString(2);
        ResultSet rssz = connectn.createStatement().executeQuery("select ename ,type,sex,club from events where eid='" + eventid + "'");
        String[] n = new String[noprt];
        out.println("<h3>Team Id :- " + temid + "</h3>");
        if (rssz.next()) {
    %>
    <h4>Enrolled Event :- <%= rssz.getString(1)%></h4>
    <h5>Type :- <%if(rssz.getString(2).equalsIgnoreCase("zest")) out.println("Zest");%></h5>
    <h5>Allowed For :- <%= rssz.getString(3)%></h5>
    <h5>Club :- <%= rssz.getString(4)%></h5>
    <%
        }
        n = tnames.split(",");
    %>
    <center>
        <br><br>
        <%
            for (incr = 0; incr < n.length; incr++) {
        %>

        <input type="text" value="<%=n[incr]%>" disabled /><br>

        <%
            }
            resltset1 = stateme.executeQuery("select `group` from events where eid='" + eventid + "'");
            if (resltset1.next()) {
                grpprt = resltset1.getInt(1);
                //out.println(grp+" "+noprt);
            }
            if (noprt < grpprt) {
                for (int a = 0; a < (grpprt - noprt); a++) {
        %>
        <input type="number" name="p" placeholder="<%=("participant id ") + (noprt + a + 1)%>" min="1000" max="9999" /><br>
        <%
            }
        %>
        <input type="hidden" name="tid" value="<%=temid%>"/>
        <input type="hidden" name="eid" value="<%=eventid%>"/>
        <%
            }
        %>
        <button class="btn">
            <div class="icon-update"></div>
            update
        </button>
        <%
                    }
                } catch (Exception e) {
                    out.print(e);
                } finally {
                    boolean b = org.conn.close(connectn);
                }
            }
        %>
    </center>
</form>
<%@include file="footerCommon.jsp" %>