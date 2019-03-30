<%@include file="../importPackages.jsp" %>
<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>
<%
    int pd, ii = 0;
    ServletContext cot = getServletContext();
    Connection c = org.conn.connect(cot.getInitParameter("id"), cot.getInitParameter("pass"));
    try {
%>
<center>
    <div id="div_print" class="centered" >
        <table border="1" width="100%"  >
            <thead>
                <tr>
                    <th width="2%" >S.No.</th>
                    <th width="4%" >PID</th>
                    <th width="6%" >Name</th>
                    <th>College</th>
                    <th width="5%" >Roll No.</th>
                    <th width="30%" >Zest Events</th>
                    <th width="30%" >Aamod Events</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String q = "select pid from participation";
                    ResultSet r, r1, r2;
                    r = c.createStatement().executeQuery(q);
                    out.write("<h3> Participats List of All Colleges </h3>");
                    while (r.next()) {
                        pd = r.getInt(1);
                        String q1 = "select p.name , p.college1 , p.rollno ,ps.* from participant as p,participation as ps where ps.pid='" + pd + "' and p.pid='" + pd + "'";
                        String q2 = "select eid,ename,club,type from events order by club";
                        String id, ze = "", ae = "";
                        r1 = c.createStatement().executeQuery(q1);
                        r2 = c.createStatement().executeQuery(q2);
                        if (r1.next()) {
                            while (r2.next()) {
                                id = r1.getString(("ps." + r2.getString(1)));
                                if (!id.equals("nop")) {
                                    if (r2.getString(4).equals("zest")) {
                                        ze = ze + r2.getString(2) + ",";
                                    } else {
                                        ae = ae + r2.getString(2) + ",";
                                    }
                                }
                            }
                            String print = "";
                            if (ii % 2 != 0) {
                                print = "#d1f7ff";
                            } else {
                                print = "white";
                            }
                            out.println("<tr style='background-color:" + print + ";'>");
                            out.println("<td>" + ++ii + "</td>");
                            out.println("<td>" + pd + "</td>");
                            out.println("<td>" + r1.getString(1) + "</td>");
                            out.println("<td>" + r1.getString(2) + "</td>");
                            out.println("<td>" + r1.getString(3) + "</td>");
                            out.println("<td>" + ze + "</td>");
                            out.println("<td>" + ae + "</td>");
                            out.println("</tr>");
                        }

                    }
                %>
            </tbody>
        </table>
        <br><br><center>
            <button type="button" class="btn" onClick="printdiv('div_print');">
                <div class="icon-print"></div>
                print
            </button><br><br><br><br>
            </div> 
        </center>
        <%
            } catch (Exception e) {
                out.println(e);
            } finally {
                boolean b = org.conn.close(c);
            }
        %>
        <%@include file="footerCommon.jsp" %>