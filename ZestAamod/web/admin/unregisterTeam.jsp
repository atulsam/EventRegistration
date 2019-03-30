
<form action="unregister.jsp" >
    <input type="hidden" name="title" value="unregister" >
    <input type="number" name="tid" placeholder="team id" min="20000" required="" ><br>
    <button class="btn">
        <div class="icon-search"></div>
        Search
    </button>
</form>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    Connection connC = null;
    ResultSet ResT = null;
    String[] pids;
%>

<%
    String tid = request.getParameter("tid");
    if (tid != null && tid.trim() != "") {
        try {
            ServletContext sccc = getServletContext();
            connC = org.conn.connect(sccc.getInitParameter("id"), sccc.getInitParameter("pass"));
            ResT = connC.createStatement().executeQuery("select names,nop,eid from team where tid='" + tid + "'");
            if (ResT.next()) {
                pids = new String[ResT.getInt(2)];
                String rpid = ResT.getString(1);
                pids = rpid.split(",");
%>
<form action="unregisterTeamAction.jsp">
    <input type="hidden" name="title" value="register" >
    <input type="hidden" name="tid" value="<%= tid%>">
    <input type="hidden" name="eid" value="<%= ResT.getString(3)%>">
    <%
        for (String s : pids) {
            out.println("<input type='hidden' value='" + s + "' name='opids'>");
            out.println("<label><input type='checkbox' checked='' name='pids' value='" + s + "' >&nbsp;" + s + "</label>");
        }
    %>
    <button class="btn">
        <div class="icon-check"></div>
        Update
    </button>
</form>
<%
            } else {
                out.println("<div class='alert'>no such team exists</div>");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            boolean b = org.conn.close(connC);
        }
    }
%>