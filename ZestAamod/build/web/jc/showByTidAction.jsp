<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>
<%!    Connection con;
    Statement st, st1, st2;
    ResultSet rs = null, rs1 = null, rs2;
    String pid, eid, tid, q1, id, q;
    boolean status;
    int ii = 0, p;
%>
<center>
    <%
        ii = 0;
        tid = request.getParameter("tid");
        String pids[] = null;
        int as = 0;
        if (tid != null) {
            ServletContext cext = getServletContext();
            con = org.conn.connect(cext.getInitParameter("id"), cext.getInitParameter("pass"));

            try {
                q = "select names,eid from team where tid='" + tid + "'";
                rs = con.createStatement().executeQuery(q);
                if (rs.next()) {
                    pids = (rs.getString(1)).split(",");
                    eid = rs.getString(2);
                    as++;
                }
                if (as > 0) {
                    q1 = "select ename,club,type from events where eid='" + eid + "'";
                    rs1 = con.createStatement().executeQuery(q1);

                    if (rs1.next()) {
                        out.println("<div style='text-align: left;padding-left: 13%;'><h6>Team Id : " + tid + "</h6>");
                        out.println("<h6>Event Name : " + rs1.getString(1) + "</h6>");
                        out.println("<h6>club : " + rs1.getString(2) + "</h6>");
                        String xx=rs1.getString(3);
                        if(xx.equalsIgnoreCase("zest"))
                            xx="Zest";
                        out.println("<h6>Type : " + xx + "</h6></div>");
                    }
    %>

    <table width="75%"  border="1px">
        <thead>
            <tr>
                <th>S. No</th>
                <th>PID</th>
                <th>Participant Name</th>
                <th>college</th>
                <th>Roll No</th>
                <th>Gender</th>
                <th>Phone No</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (String z : pids) {
                    q = "select name ,college1,rollno,sex,phone from participant  where pid='" + z + "'";
                    rs = con.createStatement().executeQuery(q);
                    if (rs.next()) {
            %>

            <tr  <% if (ii % 2 != 0) {
                out.print("style='background-color: #d1f7ff;' ");
            }%> >
                <td><%=(++ii)%></td>
                <td><%=z%></td>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>   
            </tr>

            <%
                    }
                }

            %>
        </tbody>
    </table>
    <br><br><center>
        <button type="button" class="btn" onClick="printdiv('div_print');">
            <div class="icon-print"></div>
            print
        </button>
    </center>
    <%  } else {
            out.println("<div class='alert'>no record found</div>");
        }
    %>
</center>   

<%
        } catch (Exception e) {
            out.println(e);
        } finally {
            boolean b = org.conn.close(con);
        }
    }
%>