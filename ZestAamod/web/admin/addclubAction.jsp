<%@include file="../importPackages.jsp" %>


<%!    Connection con;
    String cname, q;
    int mnp;
    PreparedStatement ps;
    int i, j;
    Statement st;
%>


<%
    ServletContext cotext = getServletContext();
    con = org.conn.connect(cotext.getInitParameter("id"), cotext.getInitParameter("pass"));

    cname = request.getParameter("cname");
    String z = request.getParameter("mnp");
    try {
        if (cname != null && z != null && cname != "" && z != "") {
            mnp = Integer.parseInt(z);

            q = "INSERT INTO club (cid, mnp) VALUES (?,?)";
            ps = con.prepareStatement(q);
            ps.setString(1, cname);
            ps.setInt(2, mnp);
            q = "ALTER TABLE clubparticipation ADD COLUMN " + cname + " INT(10) NOT NULL DEFAULT 0 ";
            st = con.createStatement();

            i = ps.executeUpdate(); //insertion querry
            j = st.executeUpdate(q); //alter querry is a DDL so it can't be rolled backed
            response.sendRedirect("./club.jsp?title=club&msgs=club added successfully");

        } else {
            response.sendRedirect("./club.jsp?title=club&msg=fill all the form");
        }

    } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ee) {
        response.sendRedirect("./club.jsp?title=club&msg=club already exists");
    } catch (Exception e) {
        response.sendRedirect("./club.jsp?title=club&msg=server encountered an error " + e);
    } finally {
        boolean b = org.conn.close(con);
    }

%>