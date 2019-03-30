<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>

<%!    Connection ccon;
    Statement stat;
    ResultSet rs = null, rs1 = null, rs2;
    String eiid, tmid, naames, qer, sxe, px, queryy, cllub, typp;
    boolean fg = false;
    int gg, cn;

%>

<%
    cn = 0;
    fg = false;
    ServletContext Context7 = getServletContext();
    ccon = org.conn.connect(Context7.getInitParameter("id"), Context7.getInitParameter("pass"));
    ccon.setAutoCommit(false);
    // try {
    String message = "", message1 = "";

    int res[] = new int[10];
    for (int h = 0; h < 10; h++) {
        res[h] = 0;
    }
    // u1="";u2="";
    eiid = request.getParameter("eid");
    tmid = request.getParameter("tid");
    String sz1[] = request.getParameterValues("p");
    if (sz1 != null) {
        for (int inc = 0; inc < sz1.length && sz1[inc] != null && sz1[inc] != ""; inc++) {

            //uniqueness checking...
            for (int k = 0; k < sz1.length && sz1[k] != null && sz1[k] != ""; k++) {
                for (int l = k + 1; l < sz1.length && sz1[l] != null && sz1[l] != ""; l++) {
                    if (sz1[k].equals(sz1[l])) {
                        fg = true;
                        break;
                    }
                }
                if (fg) {
                    break;
                }
            }
            if (inc == 0) {
                px = sz1[inc];
            } else {
                px = px + "," + sz1[inc];
            }

            cn++;
        }

        if (fg || cn == 0) {
            response.sendRedirect("./updateTeam.jsp?title=updateTeam&tid=" + tmid + "&msg=all PIDs should b unique");
        } else {

            try {
                stat = ccon.createStatement();
                rs2 = stat.executeQuery("select sex from events where eid='" + eiid + "'");
                if (rs2.next()) {
                    sxe = rs2.getString(1);
                }
                if (!sxe.equals("both")) {
                    for (int inc = 0; inc < cn; inc++) {
                        rs2 = stat.executeQuery("select sex from participant where pid='" + sz1[inc] + "'");
                        if (rs2.next()) {
                            if (!rs2.getString(1).equals(sxe)) {
                                response.sendRedirect("./updateTeam.jsp?title=updateTeam&tid=" + tmid + "&msg=Participant " + sz1[inc] + " is not allowed to register because this event is for " + sxe + "s only");
                                //break;

                            }
                        }
                    }
                }
                rs = stat.executeQuery("select names from team where tid='" + tmid + "'");
                if (rs.next()) {
                    qer = rs.getString("names");
                } else {
                    response.sendRedirect("./updateTeam.jsp?title=updateTeam&msg=no such team exists");
                }
                rs = stat.executeQuery("select club,type from events where eid='" + eiid + "'");
                if (rs.next()) {
                    cllub = rs.getString(1);
                    typp = rs.getString(2);
                }
                gg = 0;
                for (int inc = 0; inc < cn; inc++) {
                    qer = qer + "," + sz1[inc];
                    queryy = "select " + eiid + " from participation where pid='" + sz1[inc] + "'";
                    rs = stat.executeQuery(queryy);
                    if (rs.next()) {
                        if (rs.getString(1).equals("nop")) {
                            if (typp.equals("zest")) {
                                queryy = "update clubparticipation as cp, club as c, rules as r,participant as p, events as e, team as t,participation as ps"
                                        + " set t.names='" + qer + "',t.nop=t.nop+1 ,p.ge=p.ge+1,ps.gez=ps.gez+1, ps." + eiid + "='" + tmid + "',ps.total=ps.total+1,ps.ztotal=ps.ztotal+1,"
                                        + "cp." + cllub + "=cp." + cllub + "+1 where p.pid=" + sz1[inc] + " and ps.pid=" + sz1[inc] + " and t.tid=" + tmid + " and t.nop+1<=e.`group` and e.eid='" + eiid + "'and ps.total+1<=r.mtp "
                                        + " and ps.ztotal+1<=r.mzp and ps.gez+1<=r.mzpg and r.college=p.college and c.cid=e.club and cp.pid='" + sz1[inc] + "' and cp." + cllub + "+1<=c.mnp and (e.sex='both' or e.sex=p.sex)";
                            } else {
                                queryy = "update clubparticipation as cp, club as c, rules as r,participant as p, events as e, team as t,participation as ps"
                                        + " set t.names='" + qer + "',t.nop=t.nop+1 ,p.ge=p.ge+1,ps.gea=ps.gea+1, ps." + eiid + "='" + tmid + "',ps.total=ps.total+1,ps.atotal=ps.atotal+1,"
                                        + "cp." + cllub + "=cp." + cllub + "+1 where p.pid=" + sz1[inc] + " and ps.pid=" + sz1[inc] + " and t.tid=" + tmid + " and t.nop+1<=e.`group` and e.eid='" + eiid + "'and ps.total+1<=r.mtp "
                                        + " and ps.atotal+1<=r.mzp and ps.gea+1<=r.mapg and r.college=p.college and c.cid=e.club and cp.pid='" + sz1[inc] + "' and cp." + cllub + "+1<=c.mnp and (e.sex='both' or e.sex=p.sex)";

                            }
                            int x = stat.executeUpdate(queryy);
                            if (x > 0) {
                                gg++;
                            } else {
                                out.println("PARTICIPANT " + sz1[inc] + " is voilating rule");
                                message = message + "PARTICIPANT " + sz1[inc] + " is voilating rule ";
                            }
                        } else {
                            out.println("user " + sz1[inc] + " already registered");
                            message = message + "user " + sz1[inc] + " already registered ";
                        }
                    } else {
                        out.println("user " + sz1[inc] + " not registered");
                        message = message + "user " + sz1[inc] + " not registered ";
                    }
                }
                if (gg == cn) {
                    out.println("team" + tmid + " updated successfully");
                    message1 = message + "team " + tmid + " updated successfully ";
                    ccon.commit();
                } else {
                    ccon.rollback();
                    out.println("Updation failed");
                    message = message + "Updation failed ";
                }
                response.sendRedirect("./updateTeam.jsp?title=updateTeam&msg=" + message + "&msgs=" + message1);
            } catch (Exception e) {
                out.println(e);
            } finally {
                boolean b = org.conn.close(ccon);
                //ccon.close();
            }
        }
    } else {
        response.sendRedirect("./updateTeam.jsp?title=updateTeam&msgs=team updated");
    }
    /*  
     */
%>