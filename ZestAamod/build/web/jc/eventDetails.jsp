<%@include file="../importPackages.jsp" %>
<%@include file="headerCommon.jsp" %>
<%@include file="jcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>
<%
    int pd, ii = 0;
    ServletContext coot = getServletContext();
    Connection c = org.conn.connect(coot.getInitParameter("id"), coot.getInitParameter("pass"));
    try {
%>
<center>
    
    
    <div id="div_print" class="centered" >
        <table border="1" width="75%" >
            <thead>
                <tr>
                    <th width="3%" >S.No.</th>
                    <th >Event Name</th>
                    <th width="10%" >Type</th>
                    <th width="10%" >MNP</th>
                    <th width="20%" >Club</th>
                    <th width="10%" >Allowed For</th>
                </tr>
            </thead>
            <tbody>
                <%
                        String q = "select ename,type,`group`,club,sex from events order by club";
                        ResultSet r;
                        r = c.createStatement().executeQuery(q);
                        String print = "";
                        while (r.next()) {
                            if (ii % 2 != 0) {
                                print = "#d1f7ff";
                            } else {
                                print = "white";
                            }
                            out.println("<tr style='background-color:" + print + ";'>");
                            out.println("<td>" + ++ii + "</td>");
                            out.println("<td>" + r.getString(1) + "</td>");
                            String xx = r.getString(2);
                            if (xx.equalsIgnoreCase("zest")) {
                                xx = "Zest";
                            }
                            out.println("<td>" + xx + "</td>");
                            out.println("<td>" + r.getString(3) + "</td>");
                            out.println("<td>" + r.getString(4) + "</td>");
                            out.println("<td>" + r.getString(5) + "</td>");
                            out.println("</tr>");

                        }
                    } catch (Exception e) {
                        out.println(e);
                    } finally {
                        boolean b = org.conn.close(c);
                    }
                %>
            </tbody>
        </table>
    </div>
</center>
<%@include file="footerCommon.jsp" %>