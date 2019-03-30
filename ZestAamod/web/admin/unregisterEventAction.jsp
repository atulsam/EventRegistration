<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.conn.*" %>


<%
    Connection cn = null;
    String p, q11, q12, club, type, ename;
    int x, y = 0;
    String ev[] = null;
    ResultSet r11;

%>

<%
ServletContext scc = getServletContext();
    cn = org.conn.connect(scc.getInitParameter("id"), scc.getInitParameter("pass"));
    try {
        p = request.getParameter("pid");
        ev = request.getParameterValues("event");
        if (p != null && ev != null) {
            out.println(p);
            for (int i = 0; i < ev.length; i++) {
                out.println(ev[i]);
                q11 = "select ename,type,club from events where eid='" + ev[i] + "'";
                r11 = cn.createStatement().executeQuery(q11);
                if (r11.next()) {
                    ename = r11.getString(1);
                    club = r11.getString(3);
                    type = r11.getString(2);
                    if (type.equalsIgnoreCase("zest")) {
                        q12 = "update clubparticipation as cp,events as e,participation as ps "
                                + "set ps." + ev[i] + "='nop',ps.total=ps.total-1,ps.ztotal=ps.ztotal-1,ps.iez=ps.iez-1,cp." + club + "=cp." + club + "-1 "
                                + "where ps.pid=" + p + " and cp.pid=" + p + " and e.eid='" + ev[i] + "'";
                    } else {
                        q12 = "update clubparticipation as cp,events as e,participation as ps "
                                + "set ps." + ev[i] + "='nop',ps.total=ps.total-1,ps.atotal=ps.atotal-1,ps.iea=ps.iea-1,cp." + club + "=cp." + club + "-1 "
                                + "where ps.pid=" + p + " and cp.pid=" + p + " and e.eid='" + ev[i] + "'";
                    }
                    out.println(q12);
                    x = cn.createStatement().executeUpdate(q12);
                    if (x > 0) {
                        y++;
                    }
                }
                if (y == ev.length) {
                    response.sendRedirect("unregister.jsp?title=unregister&pid=" + p + "&msgs=event unregistertion is successful.");
                } else {
                    response.sendRedirect("unregister.jsp?title=unregister&pid=" + p + "&msg=event unregistertion is not successful.");
                }
            }
        } else {
            response.sendRedirect("unregister.jsp?title=unregister&pid=" + p + "&msg=Some fields are blank");
        }

    } catch (Exception e) {
        out.println(e);
    } finally {
        boolean b = org.conn.close(cn);
    }
%>