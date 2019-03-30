<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    String id, pass, pass1, type, q;
    PreparedStatement ps;
    int i;
%>

<%
    ServletContext cntext = getServletContext();
    con = org.conn.connect(cntext.getInitParameter("id"), cntext.getInitParameter("pass"));

    try {
        id = request.getParameter("username");
        pass = request.getParameter("pass");
        pass1 = request.getParameter("pass1");
        type = request.getParameter("type");
        out.println(id + pass + pass1 + type);

        if (id != null && pass != null && pass1 != null && type != null && id != "" && pass != "" && pass1 != "" && type != "") {
            if (pass.equals(pass1)) {
                q = "INSERT INTO login_master (`id`, `pass`, `type`) VALUES (?,?,?)";
                ps = con.prepareStatement(q);
                ps.setString(1, id);
                ps.setString(2, pass);
                ps.setString(3, type);
                i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("./adminhome.jsp?title=user&msgs=user added sucessfully");
                } else {
                    response.sendRedirect("./adminhome.jsp?title=user&msg=error occured");
                }
            } else {
                response.sendRedirect("./adminhome.jsp?title=user&msg=pssword mismatch");
            }
        } else {
            response.sendRedirect("./adminhome.jsp?title=user&msg=fields can't be left blank");
        }

    } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ex) {
        response.sendRedirect("./adminhome.jsp?title=user&msg=user already registered");

    } catch (Exception e) {
        response.sendRedirect("./adminhome.jsp?title=user&msg=some errored occured " + e);
    } finally {
        boolean b = org.conn.close(con);
    }
%>