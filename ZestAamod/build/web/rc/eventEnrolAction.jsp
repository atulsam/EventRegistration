<%@page import="java.util.jar.Attributes.Name"%>
<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>
<%!    Connection con1;
    Statement stt;
    ResultSet rss = null, rss1 = null;
    String pidd, genderr, reidd, regg, college1, q,name;
    String[] eidd, deidd, clubb, type1;
    boolean status1;
    int ii = 0;
%>

<%
    ServletContext Cext = getServletContext();
    con1 = org.conn.connect(Cext.getInitParameter("id"), Cext.getInitParameter("pass"));
    pidd = request.getParameter("pid");
    eidd = request.getParameterValues("eid");

    //out.println("eids.................." + eidd.length + ".............");
    stt = con1.createStatement();
    reidd = "";
    status1 = false;
    try {
        if (eidd != null) {
            clubb = new String[eidd.length];
            type1 = new String[eidd.length];
            con1.setAutoCommit(false);
            int a = 0, b = 0, c = 0;

            for (int i = 0; i < eidd.length; i++) {
                rss = con1.createStatement().executeQuery("select club,type from events where eid='" + eidd[i] + "'");
                if (rss != null && rss.next()) {
                    clubb[i] = rss.getString(1);
                    type1[i] = rss.getString(2);
                }
                rss.close();
            }   //geting club associated with each events
            c = 0;
            for (int i = 0; i < clubb.length; i++) {
                a = 0;
                a = con1.createStatement().executeUpdate("update clubparticipation as cp, club as c set cp." + clubb[i] + "=cp." + clubb[i] + "+1 where c.cid='" + clubb[i] + "' and cp." + clubb[i] + "+1 <=c.mnp and  cp.pid ='" + pidd + "'");
                out.println(a);
                if (a != 0) {
                    c++;
                }
            } //update clubparticipation
            int cc = 0;
            for (int i = 0; i < eidd.length; i++) {
                b = 0;
                if (type1[i].equalsIgnoreCase("zest")) {
                    b = con1.createStatement().executeUpdate("update participation as p, rules as r,participant as pp set p." + eidd[i] + "='" + pidd + "', p.total=p.total+1,p.ztotal=p.ztotal+1,p.iez=p.iez+1 where p.total+1<=r.mtp and p.ztotal+1<=r.mzp and p.iez+1<=r.mzpi and p.pid=" + pidd + " and r.college=pp.college and pp.pid=" + pidd);
                } else {
                    b = con1.createStatement().executeUpdate("update participation as p, rules as r,participant as pp set p." + eidd[i] + "='" + pidd + "', p.total=p.total+1,p.atotal=p.atotal+1, p.iea=p.iea+1 where p.total+1<=r.mtp and p.atotal+1<=r.map and p.iea+1<=r.mapi and p.pid=" + pidd + " and r.college=pp.college and pp.pid=" + pidd);
                }
                if (b != 0) {
                    cc++;
                }
                out.println(b);
            }
            if (c == clubb.length && cc == eidd.length) {
                con1.commit();
                response.sendRedirect("./eventEnrol.jsp?title=event&msgs=events registered");
            } else {
                con1.rollback();
                if (a == 0) {
                    response.sendRedirect("./eventEnrol.jsp?title=event&msg=club rule voilated&pid=" + pidd);
                } else {
                    response.sendRedirect("./eventEnrol.jsp?title=event&msg=event rule voilated&pid=" + pidd);
                }
            }


        } else {
            rss = stt.executeQuery("select sex, college,name from `participant` where `pid`=" + pidd);
            if (rss != null && rss.next()) {
                genderr = rss.getString(1);
                college1 = rss.getString(2);
                name = rss.getString(3);
                status1 = true;
            } else {
                response.sendRedirect("eventEnrol.jsp?title=event&msg=" + pidd + " not registered");
            }
            if (status1) {
                if (genderr != null && genderr.equals("male")) {
                    genderr = "female";
                } else {
                    genderr = "male";
                }
                rss1 = stt.executeQuery("select `eid` from `events` where `group`=1 and `sex` !='" + genderr + "'");
                if (genderr != null && genderr.equals("male")) {
                    genderr = "female";
                } else {
                    genderr = "male";
                }
                while (rss1 != null && rss1.next()) {
                    //out.println(rss1.getString(1));
                    reidd = reidd + rss1.getString(1) + ",";
                }

                deidd = reidd.split(",");
                reidd = "";
                for (String sz11 : deidd) {

                    regg = "nop";
                    if (sz11 != "") {
                        rss = stt.executeQuery("select `" + sz11 + "` from participation where `pid`='" + pidd + "'");
                        if (rss.next()) {
                            regg = rss.getString(1);
                        }
                        if (!regg.equals("nop")) {
                            reidd = reidd + sz11 + ",";
                        }
                    }
                }
                response.sendRedirect("eventEnrol.jsp?title=event&pid=" + pidd + "&gender=" + genderr + "&reid=" + reidd + "&name=" + name);
            }
        }
    } catch (Exception e) {
        response.sendRedirect("eventEnrol.jsp?title=event&msg=error occured" + e);
    } finally {
        boolean b = org.conn.close(con1);
    }
%>