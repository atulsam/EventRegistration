<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@include file="../importPackages.jsp" %>
<%@include file="loginDetail.jsp" %>

<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>

<%!    Connection connec;
    Statement statem = null;
    ResultSet rsltst = null, rsltst1;
    String prtID, gen, q,name;
    String[] reid, eids;
    int i = 0, j = 0;
%>

<%
    try {
        prtID = request.getParameter("pid");
        gen = request.getParameter("gender");
        name = request.getParameter("name");
        if (prtID != null && gen != null && prtID != "" && gen != "") {
%>
<form action="eventEnrolAction.jsp" method="post" >
    <h3>P Id : ${param.pid}  </h3> 
    <h4>Name: <%=name%></h4>
    <table border="0" width="100%" >

        <tr style="text-align: center;"><td  ><h3>Zest Events</h3></td><td><h3>Aamod Events</h3></td><td><h3>Registered Events</h3></td></tr>
        <tr>
        <input type="hidden"  name="pid" value="${param.pid}"  placeholder="participant id"/>
        <%
            ServletContext Cxt = getServletContext();
            connec = org.conn.connect(Cxt.getInitParameter("id"), Cxt.getInitParameter("pass"));
            statem = connec.createStatement();
            reid = request.getParameter("reid").split(",");
            String eve = "";

            statem = connec.createStatement();
            if (gen != null && gen.equals("male")) {
                gen = "female";
            } else {
                gen = "male";
            }
            q = "select `eid`,`ename`,`club` from `events` where type='zest' and `group` =1 and `sex`!='" + gen + "'";
            for (String s1 : reid) {
                q = q + " and `eid` != '" + s1 + "'";
            }
            q = q + " order by club ";
            rsltst = statem.executeQuery(q);
        %>
        <td style="vertical-align: top;padding-left: 30px;">

            <%
                //out.println("<br><br><br>ZEST EVENTS :- <br><br><br>");

                while (rsltst.next()) {
                    if (!eve.equals(rsltst.getString(3))) {
                        //out.println("<br<br><br><br<br><br><br<br>");
                        out.print("<br><h5>club name : " + rsltst.getString(3) + "</h5>");
                        //out.println("<br>");
                    }
                    eve = rsltst.getString(3);
                    out.println("<label><input type='checkbox' id='zest' name='eid' value='" + rsltst.getString(1) + "' /> " + rsltst.getString(2) + "</label>");
                }
                q = "";
                eve = "";
                q = "select `eid`,`ename`,`club` from `events` where `type`='aamod' and `group` =1 and `sex`!='" + gen + "'";
                for (String s1 : reid) {
                    q = q + " and `eid` != '" + s1 + "'";
                }
                q = q + " order by club ";
                rsltst1 = connec.createStatement().executeQuery(q);
            %>
        </td><td style="vertical-align: top;padding-left: 30px;">
            <%
                //out.println("<br><br><br> AAMOD EVENTS :-<br><br><br>");
                while (rsltst1.next()) {
                    if (!eve.equals(rsltst1.getString(3))) {
                        //out.println("<br<br><br><br<br><br><br<br>");
                        out.print("<br><h5>club name : " + rsltst1.getString(3) + "</h5>");
                        //out.println("<br>");
                    }
                    eve = rsltst1.getString(3);
                    out.println("<label><input type='checkbox' id='zest' name='eid' value='" + rsltst1.getString(1) + "' /> " + rsltst1.getString(2) + "</label>");
                }
            %>
        </td>
        <td style="vertical-align: top;padding-left: 30px;">
            <%
                if (reid != null && reid[0] != "") {
                    out.println("<br>");

                    for (String s1 : reid) {
                        rsltst = connec.createStatement().executeQuery("select ename from events where eid='" + s1 + "'");
                        if (rsltst.next()) {
                            out.println(rsltst.getString(1) + "<br>");
                        }
                    }
                }
            %>
        </td>
        </tr>
        <tr style="text-align: center;">
            <td colspan="3">
                <button class="btn">
                    <div  class="icon-check"></div>
                    Enroll Events
                </button>
            </td>
        </tr>
    </table>
</form>
<%
} else {
%>
<div style="padding-top: 3%">
    <center>
        <form action="eventEnrolAction.jsp" method="post" >
            <input type="number" name="pid" placeholder="participant id" min="1000" max="9999" required=""/><br>
            <button class="btn">
                <div class="icon-update"></div>
                Enroll Event
            </button>
        </form>
    </center>
</div>
<%    }
    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(connec);
    }
%>
<%
    if (request.getParameter("msg") != null) {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    } else if (request.getParameter("msgs") != null) {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>
<%@include file="footerCommon.jsp" %>