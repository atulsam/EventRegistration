<%@include file="../importPackages.jsp" %>
<%@include file="./loginDetail.jsp" %>
<%!    Connection con;
    String ppname, ccollege, pphone, ssex, rrollno, qqq, ccollege1, oc;
    int ppid;
    PreparedStatement pss;
    int xi, xj;
    Statement sst;
    ResultSet rrs;

%>


<%
    ServletContext Conte = getServletContext();
    con = org.conn.connect(Conte.getInitParameter("id"), Conte.getInitParameter("pass"));
    con.setAutoCommit(false);
    try {

        ppname = request.getParameter("name");
        ccollege = request.getParameter("college");
        ccollege1 = request.getParameter("clg");
        oc = request.getParameter("oclg");
        pphone = request.getParameter("phone");
        ssex = request.getParameter("sex");
        rrollno = request.getParameter("rollno");
//        out.write(ccollege);
        String zz = ((String) session.getAttribute("id"));
        if (zz != null && ccollege1 != null && ccollege != null && pphone != null && ssex != null && rrollno != null && zz != "" && ccollege != "" && pphone != "" && ssex != "" && rrollno != "") {
            if (!ccollege.equalsIgnoreCase("other")) {
                ccollege1 = ccollege;
                out.write("hi1");
            } else {
                if (!oc.equals("other")) {
                    ccollege1 = oc;
                    out.write("hi2");
                }
            }
            if (ccollege1 != null && !(ccollege1.trim()).equals("")) {
//                out.write("hi5");out.write(ccollege1);
                qqq = "INSERT INTO `participant` (`name`, `college`, `phone`, `rollno`, `sex`, `by`, `college1`) VALUES (?,?,?,?,?,?,?)";
                pss = con.prepareStatement(qqq);
                pss.setString(1, ppname);
                pss.setString(2, ccollege);
                pss.setString(3, pphone);
                pss.setString(4, rrollno);
                pss.setString(5, ssex);
                pss.setString(6, zz);
                pss.setString(7, ccollege1);

                xi = pss.executeUpdate();
                sst = con.createStatement();

                if (xi > 0) {
                    sst = con.createStatement();
                    rrs = sst.executeQuery("select max(pid) from participant");
                    while(rrs.next()) {
                        out.print("user added with id = " + rrs.getString(1));
                        ppid =rrs.getInt(1);
                    }
                    
//                    out.write("test1");
                    xj = sst.executeUpdate("INSERT INTO `clubparticipation` (`pid`) VALUES (" + ppid + ")");
//                    out.write("test2");
                    int k = sst.executeUpdate("INSERT INTO `participation` (`pid`) VALUES (" + ppid + ")");
                    con.commit();
                    response.sendRedirect("./rchome.jsp?title=register&msgs=user added with id = " + ppid);
                } else {
                    con.rollback();
                    response.sendRedirect("./rchome.jsp?title=register&msg=some error occured");
                }
            } else {
                response.sendRedirect("./rchome.jsp?title=register&msg=college name must be given");
            }
        } else {
            con.rollback();
            response.sendRedirect("./rchome.jsp?title=register&msg=some fields are blank");
        }
    } catch (Exception e) {
        out.print(e);
        con.rollback();
       response.sendRedirect("./rchome.jsp?title=register&msg=this roll no is registered for another pid = " + ppid);
    } finally {
        boolean b = org.conn.close(con);
    }
%>