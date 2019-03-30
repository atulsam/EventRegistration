<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.conn.*" %>
<%    
    Connection conct = null;
    ResultSet r, r1, r2;
    int i, j, k;
    String pid, q, q1, q2, id;
%>
<%    
    ServletContext scc = getServletContext();
    conct = org.conn.connect(scc.getInitParameter("id"), scc.getInitParameter("pass"));
    try {
        pid = request.getParameter("pid");
        if (pid == null) {
%>
<form method="post" action="unregister.jsp">
    <input type="hidden" name="title" value="unregister" />
    <input type="number" name="pid" placeholder="participant id" required="" min="1000" max="9999"/><br>
    <button class="btn">
        <div class="icon-search"></div>
        Search
    </button>
</form>

<%} else {
    q = "select * from participation where pid=" + pid;
    q1 = "select eid,ename,club,type from events";
    r = conct.createStatement().executeQuery(q);
    r1 = conct.createStatement().executeQuery(q1);
    if (r.next()) {
%>
<form method="get" action="unregisterEventAction.jsp">
    <input type="hidden" name="pid" value="<%=pid%>" placeholder="PID"/>
    <input type="number" name="pid" value="<%=pid%>"  disabled="" />

    <%        
        while (r1.next()) {
            //out.println("a<br>");
            id = r.getString(r1.getString(1));
            if (!(id.equalsIgnoreCase("nop")) && id.equals(pid)) {
                // out.println("<br>"+r1.getString(2));
                %>
    <label><input type="checkbox" name="event" value=<%=r1.getString(1)%> /><%=r1.getString(2)%></label>

    <%                
            }
        }
    %>
    <br><button class="btn">
        <div class="icon-check"></div>
        Update
    </button>
</form>          
<%                
                String m = request.getParameter("msg");
                if (m != null) {
                    out.println(m);
                }
            } else {
                out.println("paticipant " + pid + " is not registered..");
            }
        }
        
    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(conct);
    }
    

%>
