<%@include file="import.jsp" %>
<%@include file="headerCommon.jsp" %>
<%@include file="info.jsp" %>
<%@include file="contentLogin.jsp" %>
<%@include file="footerCommon.jsp" %>

<%!    String id, pass, q, role;
    Statement st;
    ResultSet rs;
    Connection con;
%>

<%
    try {

        if (session != null && session.getAttribute("role") != null) {
            if (session.getAttribute("role").equals("admin")) {
                response.sendRedirect("./admin/adminhome.jsp?title=admin home&action=home");
            } else if (session.getAttribute("role").equals("rc")) {
                response.sendRedirect("./rc/rchome.jsp?title=rc home&action=home");
            } else if (session.getAttribute("role").equals("jc")) {
                response.sendRedirect("./jc/jchome.jsp?title=jc home&action=home");
            }
        }
        
        id = request.getParameter("id");
        pass = request.getParameter("pass");
        con = org.conn.connect(context.getInitParameter("id"), context.getInitParameter("pass"));
        
        if (con != null && id != "" && pass != "" && id != null && pass != null) {
            q = "select * from login_master where id='" + id + "'";
            st = con.createStatement();
            rs = st.executeQuery(q);
            if (rs.next()) {
                if (pass.equals(rs.getString("pass"))) {
                    role = rs.getString("type");
                    session = request.getSession(false);
                    session.setAttribute("id", id);
                    session.setAttribute("role", role);
                    if (role.equals("admin")) {
                        ///request.setAttribute("msg", "admin");
                        response.sendRedirect("./admin/adminhome.jsp?title=admin home&action=home");
                    } else if (role.equals("rc")) {
                        response.sendRedirect("./rc/rchome.jsp?title=rc home&action=home");
                    } else if (role.equals("jc")) {
                        response.sendRedirect("./jc/jchome.jsp?title=jc home&action=home");
                    } else {
                        session.setAttribute("msg", "wrong username or password");
                    }
                } else {
                    session.setAttribute("msg", "wrong username or password");
                }
            } else {
                session.setAttribute("msg", "wrong username or password");
            }
        }
    } catch (Exception e) {
        session.setAttribute("msg", "wrong username or password");
    } finally {
        boolean closed = org.conn.close(con);
    }
%>