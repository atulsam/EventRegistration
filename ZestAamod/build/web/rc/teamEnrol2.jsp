<%@include file="../importPackages.jsp" %>
<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>

<%
    if (request.getParameter("msg") != null && request.getParameter("msg") != "") {
        out.println("<div class='alert'>" + request.getParameter("msg") + "</div>");
    }
    if (request.getParameter("msgs") != null && request.getParameter("msgs") != "") {
        out.println("<div class='alert-success'>" + request.getParameter("msgs") + "</div>");
    }
%>

<%!    Connection ccoon;
    Statement sstt;
    ResultSet result = null, result1 = null;
    String evid;
    int count, jx;
%>
<%
    evid = request.getParameter("eid");
    ServletContext Context1 = getServletContext();
    ccoon = org.conn.connect(Context1.getInitParameter("id"), Context1.getInitParameter("pass"));
    String type = "", ename = "", sex = "", club = "";
    try {
        count = 0;
        sstt = ccoon.createStatement();
        result = sstt.executeQuery("select ename ,type,sex,club, `group` from events where eid='" + evid + "'");
        if (result.next()) {
            ename = result.getString(1);
            type = result.getString(2);
            if(type.equalsIgnoreCase("zest"))
                type="Zest";
            sex = result.getString(3);
            club = result.getString(4);
            count = result.getInt(5);
        }
%>
Event Selected : <h3><%= ename%></h3>
<h4>Club : <%= club%></h4>
<h4>Type : <%= type%></h4>
<h4>Allowed For : <%= sex%></h4>
<center>
    <br><br>
    <form action="teamEnrolAction.jsp" method="post">
        <h5>enter the P IDs of all Parcipants</h5><br>
        <%


            for (int a = 0; a < count; a++) {
        %>

        <input type="number" name="p" placeholder="<%=("participant ") + (a + 1)%>" min="1000" /><br>

        <%
                }
            } catch (Exception e) {
                out.print(e);
            } finally {
                boolean b = org.conn.close(ccoon);
            }
        %>
        <input type="hidden" name="eid" value="<%=evid%>"><br>
        <button class="btn">
            <div  class="icon-check"></div>
            Enroll Team
        </button>
    </form>
</center>



<%@include file="footerCommon.jsp" %>