<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    String[] pids = request.getParameterValues("pids");
    String[] opids = request.getParameterValues("opids");
    String tid = request.getParameter("tid");
    String eid = request.getParameter("eid");
    String[] upids;
    int length = 0, flag = 0, val = 0, counter = 0;
    Connection conNN = null;
    String npid = "", q = "", q1;
    ResultSet r1 = null, r2 = null;
%>

<%
    if (pids != null && opids != null && tid != null && eid != null) {
        length = opids.length - pids.length;
        upids = new String[length];
        for (int a = 0; a <  pids.length; a++) {
            if (a == 0) {
                npid = pids[a];
            } else {
                npid = npid + "," + pids[a];
            }
        }
        out.println("<br>");
        for (String s : opids) {
            out.println(s + " ");
        }
        for (int i = 0; i < opids.length; i++) {
            for (int j = 0; j < pids.length; j++) {
                if (pids[j].equals(opids[i])) {
                    flag = 1;
                }
            }
            if (flag == 0) {
                upids[val++] = opids[i];
            }
            flag = 0;
        }
        out.println("<br>");
        for (String s : upids) {
            out.println(s);
        }
        out.println("<br>" + npid);

        try {
            ServletContext scc = getServletContext();
     conNN = org.conn.connect(scc.getInitParameter("id"), scc.getInitParameter("pass"));
  
       
            conNN.setAutoCommit(false);
            int t = conNN.createStatement().executeUpdate("update team set names='" + npid + "' , nop=" + pids.length + " where tid='" + tid + "'");
            if (t > 0) {
                for (int a = 0; a < upids.length; a++) {
                    q1 = "select ename,club,type from events where eid='" + eid + "'";
                    r1 = conNN.createStatement().executeQuery(q1);
                    if (r1.next()) {
                        String ename = r1.getString(1);
                        String club = r1.getString(2);
                        String type = r1.getString(3);
                        if (type.equalsIgnoreCase("zest")) {
                            q = "update clubparticipation as cp,events as e,participation as ps, participant as p "
                                    + "set p.ge=p.ge-1 , ps." + eid + "='nop',ps.total=ps.total-1,ps.ztotal=ps.ztotal-1,ps.gez=ps.gez-1,cp." + club + "=cp." + club + "-1 "
                                    + "where ps.pid='" + upids[a] + "' and cp.pid='" + upids[a] + "' and p.pid='" + upids[a] + "' and e.eid='" + eid + "'";
                        } else {
                            q = "update clubparticipation as cp,events as e,participation as ps, participant as p "
                                    + "set p.ge=p.ge-1 , ps." + eid + "='nop',ps.total=ps.total-1,ps.atotal=ps.atotal-1,ps.gea=ps.gea-1,cp." + club + "=cp." + club + "-1 "
                                    + "where ps.pid='" + upids[a] + "' and cp.pid='" + upids[a] + "' and p.pid='" + upids[a] + "' and e.eid='" + eid + "'";
                        }
                        int x = conNN.createStatement().executeUpdate(q);
                        if (x > 0) {
                            counter++;
                        }
                    }
                }
                if (counter == upids.length) {
                    conNN.commit();
                    response.sendRedirect("unregister.jsp?title=unregister&msgs=team updatation sucessfull");
                } else {
                    conNN.rollback();
                    response.sendRedirect("unregister.jsp?title=unregister&msg=some error occured");
                }
            }
        } catch (Exception e) {
            conNN.rollback();
            response.sendRedirect("unregister.jsp?title=unregister&msg=server error" + q);
        } finally {
            boolean b = org.conn.close(conNN);
        }
    } else {
        response.sendRedirect("unregister.jsp?title=unregister&msg=whole team can't be deleted");
    }

%>