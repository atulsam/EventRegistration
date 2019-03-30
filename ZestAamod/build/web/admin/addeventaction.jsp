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
    ServletContext cext = getServletContext();
    con = org.conn.connect(cext.getInitParameter("id"), cext.getInitParameter("pass"));
    if (eid != null && ename != null && group != null && etype != null && sex != null && club != null && eid != "" && ename != "" && group != "" && etype != "" && sex != "" && club != "") {
        try {

            q = "INSERT INTO events (`eid` , `ename` , `type` , `group` , `club` , `sex`) VALUES (?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setString(1, eid);
            ps.setString(2, ename);
            ps.setString(3, etype);
            ps.setInt(4, Integer.parseInt(group));
            ps.setString(5, club);
            ps.setString(6, sex);
            i = ps.executeUpdate();

            q = "ALTER TABLE participation ADD COLUMN  " + eid + "  VARCHAR(50) NOT NULL DEFAULT 'nop'  AFTER pid";
            st = con.createStatement();

            j = st.executeUpdate(q);
            //out.print(i+" "+j);
            if (i > 0) {
                response.sendRedirect("./event.jsp?title=event&msgs=event added sucessfully");
            } else {
                response.sendRedirect("./event.jsp?title=event&msg=insertion failed");
            }


        } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ee) {
            out.print("event already added");
            response.sendRedirect("./event.jsp?title=event&msg=event already registered");
        } catch (Exception e) {
            out.print(e);
            response.sendRedirect("./event.jsp?title=event&msg=event name already registered");
        } finally {
            boolean b = org.conn.close(con);
        }

    } else {
        response.sendRedirect("./event.jsp?title=event&msg=please enter the fields");
    }
%>