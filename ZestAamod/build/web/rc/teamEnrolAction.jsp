<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>

<%!    Connection coon;
    Statement ste, ste1;
    PreparedStatement pps;
    ResultSet rss = null, rss2;
    String eiid, nnames, qu, sx, clb, qry, typee;
    boolean flg = false;
    int ll, gg, jj, ttid, uu;
    String message = "", message1 = "";
%>


<%
    message = "";
    message1 = "";
    nnames = "";
    gg = 0;
    uu = 0;
    flg = false;
    eiid = request.getParameter("eid");
    String szz1[] = request.getParameterValues("p");
    for (int i = 0; i < szz1.length && szz1[i] != null && szz1[i] != ""; i++) {
        //out.println(szz1[i] + "  ");

        //uniqueness checking...
        for (int k = 0; k < szz1.length && szz1[k] != null && szz1[k] != ""; k++) {
            for (int ll = k + 1; ll < szz1.length && szz1[ll] != null && szz1[ll] != ""; ll++) {
                if (szz1[k].equals(szz1[ll])) {
                    flg = true;
                    //out.print("asdf");
                    break;
                }
            }
            if (flg) {
                break;
            }
        }
        if (i == 0) {
            nnames = szz1[i];
        } else {
            nnames = nnames + "," + szz1[i];
        }
        gg++;
    }
    if (flg || gg == 0) {
        response.sendRedirect("./teamEnrol2.jsp?title=team&eid=" + eiid + "&msg=all PIDs should b unique");
    } else {
        ServletContext Context2 = getServletContext();
        coon = org.conn.connect(Context2.getInitParameter("id"), Context2.getInitParameter("pass"));
        coon.setAutoCommit(false);
        try {


            ste = coon.createStatement();
            rss2 = ste.executeQuery("select sex from events where eid='" + eiid + "'");
            if (rss2.next()) {
                sx = rss2.getString(1);

            }
            if (!sx.equals("both")) {

                for (int i = 0; i < gg; i++) {
                    rss2 = ste.executeQuery("select sex from participant where pid='" + szz1[i] + "'");

                    if (rss2.next()) {

                        if (!rss2.getString(1).equals(sx)) {

                            response.sendRedirect("./teamEnrol2.jsp?title=team&eid=" + eiid + "&msg=Participant " + szz1[i] + " is not allowed to register because this event is for " + sx + "s only");
                        }
                    }
                }
            }

            qu = "INSERT INTO `team` (`eid`, `names`, `nop`) VALUES (?,?,?)";
            pps = coon.prepareStatement(qu);
            pps.setString(1, eiid);
            pps.setString(2, "");
            pps.setInt(3, 0);
            jj = pps.executeUpdate();
            if (jj > 0) {
                ste = coon.createStatement();
                rss = ste.executeQuery("select tid from team");
                if (rss.last()) {
                    ttid = rss.getInt(1);

                    //registring team events in participation table
                    ste = coon.createStatement();
                    ste1 = coon.createStatement();
                    rss = ste.executeQuery("select club,type from events where eid='" + eiid + "'");
                    if (rss.next()) {
                        clb = rss.getString(1);
                        typee = rss.getString(2);
                    }
                    uu = 0;

                    for (int i = 0; i < gg; i++) {
                        if (i == 0) {
                            qu = szz1[0];
                        } else {
                            qu = qu + "," + szz1[i];
                        }
                        qry = "select " + eiid + " from participation where pid=" + szz1[i];
                        rss = ste.executeQuery(qry);
                        if (rss.next()) {
                            if (rss.getString(1).equals("nop")) {
                                if (typee.equals("zest")) {
                                    qry = "update clubparticipation as cp, club as c, rules as r,participant as p,"
                                            + " events as e, team as t,participation as ps" + " set t.names='" + qu + "'"
                                            + ",t.nop=t.nop+1 ,p.ge=p.ge+1,ps.gez=ps.gez+1, ps." + eiid + "='" + ttid + "'"
                                            + ",ps.total=ps.total+1,ps.ztotal=ps.ztotal+1, cp." + clb + "=cp." + clb 
                                            +"+1 where p.pid=" + szz1[i] + " and ps.pid=" + szz1[i] + " and t.tid=" + ttid 
                                            + " and t.nop+1<=e.`group` and e.eid='" + eiid + "'and ps.total+1<=r.mtp " 
                                            + " and ps.ztotal+1<=r.mzp and ps.gez+1<=r.mzpg and r.college=p.college and c.cid=e.club and cp.pid='" + szz1[i] 
                                            + "' and cp." + clb + "+1<=c.mnp and (e.sex='both' or e.sex=p.sex)";
                                } else {
                                    qry = "update clubparticipation as cp, club as c, rules as r,participant as p, events as e, team as t,participation as ps"
                                            + " set t.names='" + qu + "',t.nop=t.nop+1 ,p.ge=p.ge+1,ps.gea=ps.gea+1, ps." + eiid + "='" + ttid + "',ps.total=ps.total+1,ps.atotal=ps.atotal+1,"
                                            + "cp." + clb + "=cp." + clb + "+1 where p.pid=" + szz1[i] + " and ps.pid=" + szz1[i] + " and t.tid=" + ttid + " and t.nop+1<=e.`group` and e.eid='" + eiid + "'and ps.total+1<=r.mtp "
                                            + " and ps.atotal+1<=r.mzp and ps.gea+1<=r.mapg and r.college=p.college and c.cid=e.club and cp.pid='" + szz1[i] + "' and cp." + clb + "+1<=c.mnp and (e.sex='both' or e.sex=p.sex)";
                                }
                                int x = ste.executeUpdate(qry);
                                if (x > 0) {
                                    uu++;
                                } else {
                                    out.println("PARTICIPANT " + szz1[i] + " is causing problem");
                                    message = message + "PARTICIPANT " + szz1[i] + " is voilating rule";
                                }
                            } else {
                                out.println("user " + szz1[i] + " already registered");
                                message = message + " user " + szz1[i] + " already registered";
                            }
                        } else {
                            out.println("user " + szz1[i] + " not registered");
                            message = message + " user " + szz1[i] + " doesn't exists";
                        }
                    }
                    if (uu == gg) {
                        coon.commit();
                        //response.sendRedirect("./teamEnrol.jsp?msg=Team Added successfully with team ID= " + ttid);
                        out.println("Team Added successfully with team ID= " + ttid);
                        message1 = message + " team added successfully with team ID= " + ttid;
                    } else {
                        coon.rollback();
                        //response.sendRedirect("./teamEnrol.jsp?msg=some error occured");
                        out.println("some error occured");
                        message = message + " some error occured";
                    }
                }
            }
            response.sendRedirect("./teamEnrol2.jsp?title=team&msg=" + message + "&msgs=" + message1 + "&eid=" + eiid);

        } catch (Exception e) {
            coon.rollback();
            out.print(e);
        } finally {

            boolean b = org.conn.close(coon);
        }
    }
%>