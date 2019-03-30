<%@include file="../importPackages.jsp" %>
<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>
<%@include file="loginDetail.jsp" %>

<%
    String pd = request.getParameter("pid");
    if (pd == null || pd == "") {
%>
<center>
    <div style="padding-top: 3%">
        <form action="" method="post">
            <input type="number" name="pid" placeholder="participant id" required="" min="1000" max="9999" /><br>
            <input type="hidden" name="title" value="searchByPID" />
            <button class="btn">
                <div class="icon-search"></div>
                Search
            </button>
        </form>
    </div>
</center>
<%    } else {
%>
<center>
    <div style="padding-top: 3%">
        <form action="" method="post">
            <input type="number" name="pid" placeholder="participant id" required="" min="1000" max="9999" /><br>
            <input type="hidden" name="title" value="searchByPID" />
            <button class="btn">
                <div class="icon-search"></div>
                Search
            </button>
        </form>
    </div>
</center>
<%
    ServletContext Cont = getServletContext();
    Connection c = org.conn.connect(Cont.getInitParameter("id"), Cont.getInitParameter("pass"));
    try {
        String zg[] = new String[10];
        String ag[] = new String[10];
        String zi[] = new String[10];
        String ai[] = new String[10];
        int zic = 0, aic = 0, agc = 0, zgc = 0;
        String q = "select p.name , p.college1 , p.rollno , p.sex , p.printed ,ps.* from participant as p,participation as ps where ps.pid='" + pd + "' and p.pid='" + pd + "'";
        String q1 = "select eid,ename,club,type from events order by club";
        ResultSet r, r1;
        String id;
        r = c.createStatement().executeQuery(q);
        r1 = c.createStatement().executeQuery(q1);
        if (r.next()) {
            while (r1.next()) {
                id = r.getString(("ps." + r1.getString(1)));
                if (!id.equals("nop")) {
                    if (id.length() == 4) {
                        if (r1.getString(4).equalsIgnoreCase("zest")) {
                            zi[zic++] = r1.getString(2) + "( " + r1.getString(3) + " )";
                        } else {
                            ai[aic++] = r1.getString(2) + "( " + r1.getString(3) + " )";
                        }
                    } else if (id.length() == 5) {
                        if (r1.getString(4).equalsIgnoreCase("zest")) {
                            zg[zgc++] = r1.getString(2) + "( " + r1.getString(3) + " )";
                        } else {
                            ag[agc++] = r1.getString(2) + "( " + r1.getString(3) + " )";
                        }
                    }
                }
            }
%>
<br><br>
<center>
    <table width="50%" border="1" style="text-align: left;" >
        <tr  >
            <th width="30%">Participant Id</th><td><%=pd%></td>
        </tr>
        <tr>
            <th>Name </th><td><%= r.getString(1)%></td>
        </tr>
        <tr>
            <th colspan="2" >Zest</th>
        </tr>
        <tr>
            <th><h6>Zest Indivisual Events</h6></th><td><% for (int i = 0; i < zic; i++) {
                    out.println("<br>" + zi[i]);
                }%></td>
        </tr>
        <tr>
            <th><h6>Zest Group Events</h6></th><td><% for (int i = 0; i < zgc; i++) {
                    out.println("<br>" + zg[i]);
                }%></td>
        </tr>
        <tr>
            <th colspan="2" >Aamod</th>
        </tr>
        <tr>
            <th><h6>Aamod Indivisual Events</h6></th><td><% for (int i = 0; i < aic; i++) {
                    out.println("<br>" + ai[i]);
                }%></td>
        </tr>
        <tr>
            <th><h6>Aamod Group Events</h6></th>
        <td><% for (int i = 0; i < agc; i++) {
                out.println("<br>" + ag[i]);
            }%></td>
        </tr>
        <%
            /* out.println("<h5>P. Id  : " + pd);
             out.println("&nbsp;&nbsp;&nbsp;&nbsp; name : " + r.getString(1) + "</h5>");
             out.println(" Event Enrolled : ");
             out.println("<br><br>zset :-indivisual <br>");
             for (int i = 0; i < zic; i++) {
             out.println("<br>" + zi[i]);
             }
             out.println("<br><br>zset :-Group <br>");
             for (int i = 0; i < zgc; i++) {
             out.println("<br>" + zg[i]);
             }

             out.println("<br><br>Aamod :-indivisual <br>");
             for (int i = 0; i < aic; i++) {
             out.println("<br>" + ai[i]);
             }
             out.println("<br><br>Aamod :-Group <br>");
             for (int i = 0; i < agc; i++) {
             out.println("<br>" + ag[i]);
             }*/
        %>
    </table>
</center>
<%
            } else {
                out.println("</div><div class='alert'>paticipant does not exist</div>");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            boolean b = org.conn.close(c);
        }

    }
%>

<%@include file="footerCommon.jsp" %>