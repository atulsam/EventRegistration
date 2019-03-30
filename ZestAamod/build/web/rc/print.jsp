<%@include file="../importPackages.jsp" %>
<%@include file="./loginDetail.jsp" %>
<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>
<%!    Connection con;
    Statement st, st1, st2;
    ResultSet rs = null, rs1 = null;
    String pid, gender, q1, id, college, q,c;
    boolean status;
    int ii = 0, p;
%>

<%
    pid = request.getParameter("pid");
%>
<div style="padding-top: 3%">
    <center>
        <form action="print.jsp" method="post">
            <input type="number" name="pid" placeholder="participant id" required="" min="1000" max="9999"><br>
            <input type="hidden" name="title" value="print">
            <button type="submit" class="btn">
                <div class="icon-search"></div>
                search detail
            </button>
        </form>
    </center>
</div>
<div id="div_print"  style="padding-left: 35%;">
    <%   if (pid != null) {
            ii = 0;
            ServletContext Ctext = getServletContext();
            con = org.conn.connect(Ctext.getInitParameter("id"), Ctext.getInitParameter("pass"));
            try {
                q = "select p.name , p.college1 , p.rollno , p.sex , p.printed ,ps.* from participant as p,participation as ps where ps.pid='" + pid + "' and p.pid='" + pid + "'";
                q1 = "select eid,ename,club,type from events order by club";
                st = con.createStatement();
                st1 = con.createStatement();
                st2 = con.createStatement();

                rs = st.executeQuery(q);
                rs1 = st1.executeQuery(q1);
                if (rs.next()) {
                    p = rs.getInt("p.printed");
                    c = rs.getString("p.college1");
                    out.println("<table  border='2'align=centre><tr><td>");
                    out.println("<table width='400px' ><tr><td align='right' width='100px'><img src='./img/logo.PNG' alt='logo' height='50px' width=50px'></td> ");   
                    out.println("<td width='10px'></td>");   
                    out.println("<td ><h4>&nbsp;&nbsp;SRMS TRUST INDIA<br>&nbsp;&nbsp;Zest & Aamod  2015</h4>");
                    out.println(" <h5>&nbsp;&nbsp;&nbsp;&nbsp;P. Id  : " + pid);
                    out.println("&nbsp;&nbsp;&nbsp;&nbsp; Name : " + rs.getString(1) );
                    out.println("<br>&nbsp;&nbsp;&nbsp;&nbsp;College name : " + c + "</h5></td>"); 
//                  
                    out.println("</tr>");
                    out.println("<tr><td valign='top' align='center'><table  border='1'><tr><td height='100px' width='100px' align='center'>Paste your photo</td></tr></table></td> ");
                     out.println("<td width='20px' height='150px'></td>");   
                    out.println("<td valign='top' > <b>Event Enrolled :<b> ");
                    while (rs1.next()) {
                        id = rs.getString(("ps." + rs1.getString(1)));
                        if (!id.equals("nop")) {
                            if (id.length() == 4) {
                                id = "";
                            } else {
                                id = " ( t. id : " + id + " ) ";
                            }
                            out.println("<h6>" + (++ii) + " : " + rs1.getString(2) + id + "</h6>");
                        }
                    }
                    out.println("</td></tr></table>");
                    out.println("<tr><td></table>");
                    int x = st2.executeUpdate("update participant set printed=printed+1 where pid=" + pid);
    %>
    <%@include file="footerPrint.jsp" %>
    
</div>

<br><br><center>
    <button type="button" class="btn" onClick="printdiv('div_print');">
        <div class="icon-print"></div>
        print
    </button>
</center>
<% out.println("No. of printouts " + p);%>
<%
        } else {
            out.println("</div><div class='alert'>paticipant does not exist</div>");
        }
    } catch (Exception e) {
        out.println("<div class='alert'>" + e + "</div>");
    } finally {
        boolean b = org.conn.close(con);
    }
%>




<%

    }
%>

<%@include file="footerCommon.jsp" %>