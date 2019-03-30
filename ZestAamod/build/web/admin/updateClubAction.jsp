<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    String cname, q, action, m;
    PreparedStatement ps;
    int i, j, l;
    ResultSet rs;
    Statement st;
    String[] e;
%>

<%@include file="./loginDetail.jsp" %>

<%
    try {
        cname = request.getParameter("cname");
        action = request.getParameter("action");
        q = request.getParameter("cid");
        m = request.getParameter("mnp");

        ServletContext cot = getServletContext();
        con = org.conn.connect(cot.getInitParameter("id"), cot.getInitParameter("pass"));

        st = con.createStatement();

        if (action != null && action != "" && action.equals("update") && (q == null || m == null || q == "" || m == "")) {
            rs = st.executeQuery("select mnp from club where cid='" + cname + "'");
            if (rs.next()) {
                response.sendRedirect("./club.jsp?title=club&action=update&cname=" + cname + "&mnp=" + rs.getInt("mnp"));
            } else {
                response.sendRedirect("./club.jsp?title=club&msg=some eroor occured");
            }
        }

        //out.print(q+" "+m);
        if (q != null && !q.equals("") && m != null && !m.equals("") && action.equals("update")) {
            i = Integer.parseInt(m);
            //out.println("weffsdf");
            j = st.executeUpdate("UPDATE `club` SET `mnp`=" + m + " WHERE `cid`='" + q + "'");
            if (j > 0) //   out.print("update successful....");
            {
                response.sendRedirect("./club.jsp?title=club&msgs=club updated sucessfully");
            } else {
                response.sendRedirect("./club.jsp?title=club&msg=some error occured");
                //out.print("some error occured......");
            }
        } else if (action.equals("delete")) {

            e = new String[200];
            rs = st.executeQuery("select eid from events where `club`='" + cname + "'");
            int c = 0;
            while (rs.next()) {
                e[c] = rs.getString(1);
                // out.print(e[c] + "  " + c);
                c++;
            }
            j = st.executeUpdate("DELETE FROM `club` WHERE `cid`='" + cname + "'");
            for (int a = 0; a < c; a++) {
                l = st.executeUpdate("ALTER TABLE `participation` DROP COLUMN " + e[a]);
            }
            int k = st.executeUpdate("DELETE FROM `events` WHERE `club`='" + cname + "'");
            i = st.executeUpdate("ALTER TABLE `clubparticipation` DROP COLUMN " + cname);
            //out.print(k);
            if (j > 0 && k > 0) {
                response.sendRedirect("./club.jsp?title=club&msgs=club deleted");
            } else {
                response.sendRedirect("./club.jsp?title=club&msg=no club found");
            }
        } else {
            out.println("please select ation");
            //response.sendRedirect("./club.jsp?title=club");
        }
    } catch (Exception e) {
        out.print(e);
        response.sendRedirect("./updateClub.jsp?msg=event name not available");
    } finally {
        boolean b = org.conn.close(con);
    }

%>
