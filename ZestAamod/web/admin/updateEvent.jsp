<%@include file="../importPackages.jsp" %>

<%!    Connection conn;
    String ename, action, q;
    PreparedStatement ps;
    int i, j;
    Statement st;
    ResultSet rs;
%>

<%
    try {
        ServletContext cnt = getServletContext();
        conn = org.conn.connect(cnt.getInitParameter("id"), cnt.getInitParameter("pass"));
        st = conn.createStatement();
        rs = st.executeQuery("select ename,eid from events");
%>
<form method="post" action="event.jsp?title=event">
    <h6>select event</h6>
    <select name="ename">
        <%while (rs.next()) {%>
        <option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
        <%
            }
        %>
    </select>
    <label><input type="radio" name="action" value="update"  checked/> update</label>
    <label><input type="radio" name="action" value="delete" /> delete</label>
    <button type="submit" class="btn">
        <div class="icon-update"></div>
        update event
    </button>
</form>

<%
    ename = request.getParameter("ename");
    action = request.getParameter("action");
    if (ename != null && action != null) {
        if (action.equals("update")) {

            st = conn.createStatement();
            rs = st.executeQuery("select * from events where eid='" + ename + "'");
            if (rs.next()) {
%>
<form method="POST" action="updateEventAction.jsp">
    <h5>Event ID : <%=rs.getString("eid")%></h5>
    <input type="hidden" name="eid" value="<%=rs.getString("eid")%>"/>
    <h6>Event name</h6>
    <input type="text" name="ename" value="<%=rs.getString("ename")%>" required="" placeholder="event name"/>
    <h6>no of participants</h6>
    <input type="number" name="group" value="<%=rs.getInt("group")%>" min="1" required="" placeholder="no of participants"/>
    <h6>associated club</h6>
    <select name="club">
        <%
            st = conn.createStatement();
            String club = rs.getString("club");
            String sex = rs.getString("sex");
            String type = rs.getString("type");
            rs = st.executeQuery("select cid from club");
            while (rs.next()) {
        %>
        <option <% if (club.equals(rs.getString("cid"))) {
                out.print("selected");
            }%> /> <%=rs.getString("cid")%>
        </option>
        <%}%>
    </select>
    <h6>event type</h6>
    <label><input type="radio" name="etype" value="zest" <% if (type.equalsIgnoreCase("zest")) {
            out.println("checked");
        }%> /> Zest</label>
    <label><input type="radio" name="etype" value="Aamod" <% if (type.equalsIgnoreCase("aamod")) {
            out.println("checked");
        }%> /> Aamod</label>
    <hr>
    <label><input type="radio" name="sex" value="both" <% if (sex.equals("both")) {
            out.print("checked");
        }%> /> for both girls and boy</label>
    <label><input type="radio" name="sex" value="female" <% if (sex.equals("female")) {
            out.print("checked");
        }%> /> girls</label>
    <label><input type="radio" name="sex" value="male" <% if (sex.equals("male")) {
            out.print("checked");
        }%> /> boys</label>
    <button class="btn" type="submit">
        <div class="icon-update"></div>
        update event
    </button>
</form>
<%}
            } else if (action.equals("delete")) {
                int l = st.executeUpdate("ALTER TABLE `participation` DROP COLUMN " + ename);
                i = st.executeUpdate("DELETE FROM `events` WHERE `eid`='" + ename + "'");
                j = st.executeUpdate("DELETE FROM `team` WHERE `eid`='" + ename + "'");
                if (i > 0) {
                    response.sendRedirect("./event.jsp?title=event&msgs=event deleted sucessfully");
                } else {
                    response.sendRedirect("./event.jsp?title=event&msg=some error occuered");
                }
            }
        } else {
        }

    } catch (Exception e) {
        response.sendRedirect("./event.jsp?title=event&msg=some error occuered" + e);
    } finally {
        boolean b = org.conn.close(conn);
    }
%>
