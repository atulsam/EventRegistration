<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    String id, pass, pass1, q, action;
    PreparedStatement ps;
    int i;
%>

<%
    ServletContext cntt = getServletContext();
    con = org.conn.connect(cntt.getInitParameter("id"), cntt.getInitParameter("pass"));
    try {
        id = request.getParameter("username");
        pass = request.getParameter("pass");
        pass1 = request.getParameter("pass1");
        action = request.getParameter("action");

        if (id != null && id != "") {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select pass from login_master where id='" + id + "'");
            if (rs.next()) {
                if (action.equals("delete")) {
                    int i = st.executeUpdate("delete from login_master where id='" + id + "'");
                    out.print(i);
                    if (i > 0) {
                        response.sendRedirect("./adminhome.jsp?title=user&msgs=reord deleted sucessfully");
                    } else {
                        response.sendRedirect("./adminhome.jsp?title=user&msg=id doesn't exists");
                    }
                } else if (action.equals("update")) {
                    if (pass != "" && pass1 != "" && pass != null && pass1 != null) {
                        if (pass.equals(pass1)) {
                            q = "UPDATE login_master SET pass=? WHERE id=?;";
                            ps = con.prepareStatement(q);
                            ps.setString(2, id);
                            ps.setString(1, pass);
                            i = ps.executeUpdate();
                            if (i > 0) {
                                response.sendRedirect("./adminhome.jsp?title=user&msgs=record updated");
                                id = null;
                            } else {
                                response.sendRedirect("./adminhome.jsp?title=user&msg=error occured");
                            }
                        } else {
                            response.sendRedirect("./adminhome.jsp?title=user&user=" + id + "&action=update&msg=password mismatch");
                        }
                    } else {
                        response.sendRedirect("./adminhome.jsp?title=user&user=" + id + "&action=update");
                    }
                } else {
                    response.sendRedirect("./adminhome.jsp?title=user&msg=please select an option");
                }
            } else {
                response.sendRedirect("./adminhome.jsp?title=user&msg=username doesn't exist");
            }

        } else {
            response.sendRedirect("./adminhome.jsp?title=user&msg=fields can't be left blank");
        }
    } catch (Exception e) {
        response.sendRedirect("./adminhome.jsp?title=user&msg=" + e);
    } finally {
        boolean b = org.conn.close(con);
    }
%>
