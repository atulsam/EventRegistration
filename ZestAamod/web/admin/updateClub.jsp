<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    String cname, q;
    int mnp;
    PreparedStatement ps;
    int i, j;
    ResultSet rs;
    Statement st;
%>

<%
    try {
        ServletContext cxt = getServletContext();
        con = org.conn.connect(cxt.getInitParameter("id"), cxt.getInitParameter("pass"));
        st = con.createStatement();
        rs = st.executeQuery("select cid from club ");
        String action = request.getParameter("action");
%>

<form method="POST" action="updateClubAction.jsp">
    <h5>club name</h5>
    <select name="cname">
        <%while (rs.next()) {%>
        <option><%=rs.getString(1)%></option>
        <%
            }
        %>
    </select>
    <label> <input type="radio" name="action" value="update"  checked/> update </label>
    <label><input type="radio" name="action" value="delete" /> delete</label>
    <button type="submit" class="btn">
        <div class="icon-update"></div>
        update club
    </button>
</form>
<%
    if (action != null && action != "" && request.getParameter("mnp") != null && request.getParameter("mnp") != "" && request.getParameter("cname") != null && request.getParameter("mnp") != "") {
%>
<form method="post" action="updateClubAction.jsp">
    <input type="hidden" name="action" value="update">
    <h5>club selected : <%=request.getParameter("cname")%> </h5>
    <input type="hidden" name="cid" value="<%=request.getParameter("cname")%>">
    <input type="number" name="mnp" value="<%=request.getParameter("mnp")%>" required placeholder="no. of participant" min="1"><br>
    <button type="submit" class="btn">
        <div class="icon-update"></div>
        update
    </button>
</form>
<%
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(con);
    }
%>
${param.msg}