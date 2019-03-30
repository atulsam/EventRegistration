<%@include file="../importPackages.jsp" %>


<%!    Connection con;
    String cname, q;
   int mzp, map, mtp,mzpg,mzpi,mapg,mapi;
    PreparedStatement ps;
    int i, j;
    Statement st;
%>

<%
    cname = request.getParameter("clgname");
    if (cname != null && request.getParameter("mzp") != null && request.getParameter("map") != null && request.getParameter("mtp") != null && cname != null && request.getParameter("mzp") != "" && request.getParameter("map") != "" && request.getParameter("mtp") != "") {
        try {
            mzp = Integer.parseInt(request.getParameter("mzp"));
            map = Integer.parseInt(request.getParameter("map"));
            mtp = Integer.parseInt(request.getParameter("mtp"));
            mzpg=Integer.parseInt(request.getParameter("mzpg"));
            mzpi=Integer.parseInt(request.getParameter("mzpi"));
            mapg=Integer.parseInt(request.getParameter("mapg"));
            mapi=Integer.parseInt(request.getParameter("mapi"));
            ServletContext contxt = getServletContext();
            con = org.conn.connect(contxt.getInitParameter("id"), contxt.getInitParameter("pass"));
            q = "INSERT INTO `rules` (`college`, `mzp`, `map`, `mtp`,`mzpg`,`mzpi`,`mapg`,`mapi`) VALUES (?,?,?,?,?,?,?,?) ";
            ps = con.prepareStatement(q);
            ps.setString(1, cname);
            ps.setInt(2, mzp);
            ps.setInt(3, map);
            ps.setInt(4, mtp);
            ps.setInt(5, mzpg);
            ps.setInt(6, mzpi);
            ps.setInt(7, mapg);
            ps.setInt(8, mapi);
              i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("./rule.jsp?title=rule&msgs=new rule added for " + cname);
            } else {
                response.sendRedirect("./rule.jsp?title=rule&msg=insertion failed");
            }
            } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ee) {
            response.sendRedirect("./rule.jsp?title=rule&msg=rule alreay exists for " + cname);
        } catch (Exception e) {
            out.print(e);
            response.sendRedirect("./rule.jsp?title=rule&msg=number format exception");
        } finally {
            boolean b = org.conn.close(con);
        }
    } else {
        response.sendRedirect("./rule.jsp?title=rule&msg=fill all values");
    }

%>