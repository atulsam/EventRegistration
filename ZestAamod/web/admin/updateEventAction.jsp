<%@include file="../importPackages.jsp" %>


<%!    Connection con;
    String eid, ename, group, etype, sex, club, q;
    int mnp;
    PreparedStatement ps;
    int i, j;
    Statement st;
    ResultSet rs;
%>

<%@include file="./loginDetail.jsp" %>

<%
    eid = request.getParameter("eid");
    ename = request.getParameter("ename");
    group = request.getParameter("group");
    etype = request.getParameter("etype");
    sex = request.getParameter("sex");
    club = request.getParameter("club");
     ServletContext cn = getServletContext();
    try {
        con = org.conn.connect(cn.getInitParameter("id"), cn.getInitParameter("pass"));
        st = con.createStatement();
        con.setAutoCommit(false);
        if (eid != null && ename != null && group != null && etype != null && sex != null && club != null) {
            q = "UPDATE `events` SET  `ename`=?, `type`=?, `group`=?, `club`=?, `sex`=? WHERE `eid`=?";
            ps = con.prepareStatement(q);
            ps.setString(1, ename);
            ps.setString(2, etype);
            ps.setInt(3, Integer.parseInt(group));
            ps.setString(4, club);
            ps.setString(5, sex);
            ps.setString(6, eid);
            i = ps.executeUpdate();
            if (i > 0) {
                con.commit();
                response.sendRedirect("./event.jsp?title=event&msgs=event updated sucessfully");
                //out.print("event updated...");
            } else {
                con.rollback();
                response.sendRedirect("./event.jsp?title=event&msg=some error occuered");
                //out.print("some error occured ");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("./event.jsp?title=event&msg=event name not avaliable&action=update");
    } finally {
        boolean b = org.conn.close(con);
    }
%>