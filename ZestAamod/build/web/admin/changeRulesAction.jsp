<%@include file="../importPackages.jsp" %>
<%@include file="loginDetail.jsp" %>

<%!    Connection con;
    String cname, q;
    int mzp, map, mtp, mzpg, mzpi, mapg, mapi;
    PreparedStatement ps;
%>

<%--include file="adminInfo.jsp" --%>

<%
    cname = request.getParameter("cname");
    try {
        ServletContext ctx = getServletContext();
        con = org.conn.connect(ctx.getInitParameter("id"), ctx.getInitParameter("pass"));

        if (cname != null && request.getParameter("mzp") != null && request.getParameter("map") != null && request.getParameter("mtp") != null && request.getParameter("mzp") != "" && request.getParameter("map") != "" && request.getParameter("mtp") != "") {

            mzp = Integer.parseInt(request.getParameter("mzp"));
            map = Integer.parseInt(request.getParameter("map"));
            mtp = Integer.parseInt(request.getParameter("mtp"));
            mzpg = Integer.parseInt(request.getParameter("mzpg"));
            mzpi = Integer.parseInt(request.getParameter("mzpi"));
            mapg = Integer.parseInt(request.getParameter("mapg"));
            mapi = Integer.parseInt(request.getParameter("mapi"));
            //out.print(cname + " " + mzp + " " + map + " " + mtp);
            q = "UPDATE `rules` SET `mzp`=?, `map`=?, `mtp`=? ,`mzpg`=? ,`mzpi`=?,`mapg`=?,`mapi`=? WHERE `college`=?";
            ps = con.prepareStatement(q);
            ps.setInt(1, mzp);
            ps.setInt(2, map);
            ps.setInt(3, mtp);
            ps.setInt(4, mzpg);
            ps.setInt(5, mzpi);
            ps.setInt(6, mapg);
            ps.setInt(7, mapi);
            ps.setString(8, cname);
            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("./rule.jsp?title=rule&msgs=new rules updated");
            } else {
                response.sendRedirect("./rule.jsp?title=rule&msg=server error&cname=" + cname);
            }
        } else {
            response.sendRedirect("./rule.jsp?title=rule&msg=please fill add the fileds&cname=" + cname);
        }
    } catch (Exception e) {
        response.sendRedirect("./rule.jsp?title=rule&msg=server error&cname=" + cname);
    } finally {
        boolean b = org.conn.close(con);
    }


%>