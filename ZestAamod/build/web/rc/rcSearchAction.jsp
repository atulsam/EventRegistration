<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>
<%!    Connection con;
    Statement st, st1, st2;
    ResultSet rs = null, rs1 = null, rs2;
    String pid, eid, text, q1, id, q, type;
    boolean status;
    int ii = 0, p;
%>
<%
    text = request.getParameter("text");
    type = request.getParameter("type");
    ServletContext Cntext = getServletContext();
    con = org.conn.connect(Cntext.getInitParameter("id"), Cntext.getInitParameter("pass"));
    ii = 0;
    try {
        if (text != null && type != null) {
            text = text + "%";
            q = "select pid,name,college1,phone,rollno,sex from participant where " + type + " like '" + text + "'";
            rs = con.createStatement().executeQuery(q);
%>
<center>
    <table width="75%"  border="1px">
        <thead>
            <tr>
                <th>S. No</th>
                <th>PID</th>
                <th>Participant Name</th>
                <th>college</th>
                <th>Phone No</th>
                <th>Roll No</th>
                <th>Gender</th>

            </tr>
        </thead>
        <tbody>

            <%
                while (rs.next()) {
            %>

            <tr  <% if (ii % 2 != 0) {
                out.print("style='background-color: #d1f7ff;' ");
            }%> >
                <td><%=(++ii)%></td>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>   
                <td><%=rs.getString(6)%></td>   
            </tr>

            <%
                }
            %>
        </tbody>
    </table>
</center>
<br><br><center>
    <button type="button" class="btn" onClick="printdiv('div_print');">
        <div class="icon-print"></div>
        print
    </button>
</center>
<%
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(con);
    }

%>
