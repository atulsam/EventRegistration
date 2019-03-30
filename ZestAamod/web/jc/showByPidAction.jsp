<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>
<%!    Connection con;
    Statement st, st1, st2;
    ResultSet rs = null, rs1 = null;
    String pid, eid, gender, q1, id, college, q;
    boolean status;
    int ii = 0, p;
%>
<center>
    <%
        ii = 0;
        pid = request.getParameter("pid");
        if (pid != null) {
            ServletContext ctext = getServletContext();
            con = org.conn.connect(ctext.getInitParameter("id"), ctext.getInitParameter("pass"));
            try {
                q = "select p.name ,p.college1,p.rollno,p.sex,p.phone,ps.* from participation as ps,participant as p where p.pid='" + pid + "' and ps.pid='" + pid + "'";
                rs = con.createStatement().executeQuery(q);
                if (rs.next()) {
                    out.println("<div style='text-align: left;padding-left: 13%;'><h6>Pid     : " + pid + "</h6>");
                    out.println("<h6>Name    : " + rs.getString("p.name") + "</h6>");
                    out.println("<h6>College : " + rs.getString("p.college1") + "</h6>");
                    out.println("<h6>Roll no : " + rs.getString("p.rollno") + "</h6>");
                    out.println("<h6>Gender  : " + rs.getString("p.sex") + "</h6>");
                    out.println("<h6>Phone no: " + rs.getString("p.phone") + "</h6>");
                    q1 = "select eid,ename,club,type from events";
                    rs1 = con.createStatement().executeQuery(q1);
                    out.println("<br>Participated Events are :-<br></div>");
    %>

    <table width="75%"  border="1px">
        <thead>
            <tr>
                <th>S. No</th>
                <th>Event Name</th>
                <th>club</th>
                <th>type</th>
            </tr>
        </thead>
        <tbody>

            <%
                while (rs1.next()) {
                    id = rs.getString("ps." + rs1.getString(1));
                    if (!id.equals("nop")) {
                        //out.println((++ii)+" : "+rs1.getString(2));
%>
            <tr  <% if (ii % 2 != 0) {
                    out.print("style='background-color: #d1f7ff;' ");
                }%> >
                <td><%=(++ii)%></td>

                <td><%=rs1.getString(2)%>
                <td><%=rs1.getString(3)%>
                <td><%
                        String xx=rs1.getString(4);
                        if(xx.equalsIgnoreCase("zest"))
                            xx="Zest";
                        out.println(xx);
                %>
            </tr>

            <%
                    }
                }
            %>
        </tbody>
    </table></center>
<br><br><center>
    <button type="button" class="btn" onClick="printdiv('div_print');">
        <div class="icon-print"></div>
        print
    </button>
</center>
<%
            } else {
                out.print("<div class='alert' />no recor found</div>");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            boolean b = org.conn.close(con);
        }
    }
%>