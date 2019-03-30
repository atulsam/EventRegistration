<%@include file="../importPackages.jsp" %>
<%@include file="loginDetail.jsp" %>
<%
    String eiid = request.getParameter("eid");
    Connection connnection = null;
    ResultSet rs1, rs2, rs3, rs4;
    int g = 0;
    String q = "", id, qq, ssss;
    String[] pids;
    int ii1 = 0;

%>
<div id="div_print">
    <%
        try {
            ServletContext cxt = getServletContext();
            connnection = org.conn.connect(cxt.getInitParameter("id"), cxt.getInitParameter("pass"));
            if (eiid != null) {



                rs1 = connnection.createStatement().executeQuery("select ename,club,sex,type,`group` from events where eid ='" + eiid + "'");
                if (rs1.next()) {
                    String xx=rs1.getString(4);
                    if(xx.equalsIgnoreCase("zest")){
                        xx="Zest";
                    }
                    out.print("<div class='centered2'><h6>Event Name :-  " + rs1.getString(1) + "</h6><h6>Club Name :- " + rs1.getString(2));
                    out.println("</h6><h6> Type :-  " + xx + "</h6><h6>allowed for :- " + rs1.getString(3) + "</h6></div> <br><br>");
                    g = rs1.getInt(5);
                }
                q = "select distinct " + eiid + " from participation where " + eiid + "!='nop'";
                rs2 = connnection.createStatement().executeQuery(q);
                if (g == 1) {
    %>
   
    <table  border="1px" width="100%" >
        <thead>
            <tr>
                <th>S.NO</th>
                <th>PID</th>
                <th>Name</th>
                <th>College</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs2.next()) {
                    id = rs2.getString(1);
                    qq = "select pid,name,college1 from participant where pid='" + id + "'";
                    rs3 = connnection.createStatement().executeQuery(qq);
                    if (rs3.next()) {
            %>
            <tr  <% if (ii1 % 2 != 0) {
                    out.print("style='background-color: #d1f7ff;' ");
                }%> >
                <td><%=(++ii1)%></td>
                <td>
                    <a href="./showByPid.jsp?title=pid&pid=<% out.println(rs3.getString(1));%>" > <%=rs2.getString(1)%></a>
                </td>
                <td><%=rs3.getString(2)%></td>
                <td><%=rs3.getString(3)%></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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
    <%
    } else {
    %>

    <table  border="1px" width="100%">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>T.ID</th>
                <th width="40%" >Team Members</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Marks</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>

            <%     while (rs2.next()) {
                    id = rs2.getString(1);
                    qq = "select tid,names from team where tid=" + id;
                    rs3 = connnection.createStatement().executeQuery(qq);
                    if (rs3.next()) {
                        ssss = rs3.getString(2);
                        pids = ssss.split(",");
            %>
            <tr  <% if (ii1 % 2 != 0) {
                    out.print("style='background-color: #d1f7ff;' ");
                }%> >
                <td><%=(++ii1)%></td>
                <td>
                    <a href="./showByTid.jsp?title=tid&tid=<% out.print(rs3.getString(1));%>" > <%=rs3.getString(1)%></a>
                </td>
                <td><%

                    for (String e : pids) {
                        rs4 = connnection.createStatement().executeQuery("select name from participant where pid=" + e);
                        if (rs4.next())
                    %>
                    <a href="./showByPid.jsp?title=pid&pid=<% out.print(e);%>" ><%= rs4.getString(1)%>(<%=e%>)</a>&nbsp;
                    <%
                        }
                    %>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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
    <%
        }
    %>
</div>    
<%
        }
    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(connnection);
    }
%>

