<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="loginDetail.jsp" %>
<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String course = request.getParameter("course");
    String batch = request.getParameter("batch");
    Connection Con = null;
    ServletContext ServletContext = getServletContext();
    PreparedStatement ps = null;
%>

<%

    if (name != null && name.trim() != "" && mobile != null && mobile.trim() != "" && course != null && course.trim() != "" && batch != null && batch.trim() != "") {
        try {
            Con = org.conn.connect(ServletContext.getInitParameter("id"), ServletContext.getInitParameter("pass"));
            Con.setAutoCommit(false);
            ps = Con.prepareStatement("insert into passout (`name`, `course`, `mobile`, `batch`) values(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, course);
            ps.setString(3, mobile);
            ps.setInt(4, Integer.parseInt(batch));
            int i = ps.executeUpdate();
            if (i > 0) {
                Con.commit();
                response.sendRedirect("./passOut.jsp?title=passout&msgs=alumnus registered");
            } else {
                Con.rollback();
                response.sendRedirect("./passOut.jsp?title=passout&msg=registraton failed");
            }
        } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ee) {
            Con.rollback();
            response.sendRedirect("./passOut.jsp?title=passout&msg=user already registered");
        } catch (Exception e) {
            Con.rollback();
            response.sendRedirect("./passOut.jsp?title=passout&msg=server error " + e);
        } finally {
            boolean b = org.conn.close(Con);
        }
    } else {
        response.sendRedirect("./passOut.jsp?title=passout&msg=some fields are empty");
    }

%>