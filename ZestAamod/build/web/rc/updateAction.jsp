<%@include file="../importPackages.jsp" %>
<%@include file="./loginDetail.jsp" %>
<%!    Connection con;
    String prname, clg, phn1, seex, rno, qqry, iidd, cclg1;
    int pidd;
    PreparedStatement pst;
    int icr, jcr;
%>

<%
    ServletContext Context5 = getServletContext();
    con = org.conn.connect(Context5.getInitParameter("id"), Context5.getInitParameter("pass"));
    try {
        iidd = request.getParameter("pid");
        prname = request.getParameter("name");
        clg = request.getParameter("college");
        phn1 = request.getParameter("phone");
        seex = request.getParameter("sex");
        rno = request.getParameter("rollno");
        cclg1 = request.getParameter("clg");
        String zz1 = ((String) session.getAttribute("id"));
        if (iidd != null && zz1 != null && clg != null && cclg1 != null && phn1 != null && seex != null && rno != null && zz1 != "" && clg != "" && phn1 != "" && seex != "" && rno != "" && iidd != "") {
            pidd = Integer.parseInt(iidd);
            if (!clg.equalsIgnoreCase("other")) {
                cclg1 = clg;
            }
            if (cclg1 != null && !((cclg1.trim()).equals(""))) {
                qqry = "UPDATE participant SET name='" + prname + "', college='" + clg + "', phone='" + phn1 + "', rollno='" + rno + "', `by`='" + zz1 + "', sex='" + seex + "', college1='" + cclg1 + "'  WHERE pid='" + pidd + "'";
                out.println(qqry);
                pst = con.prepareStatement(qqry);
                /*pst.setString(1,prname);
                 pst.setString(2,clg);
                 pst.setString(3,phn1);
                 pst.setString(4,rno);
                 pst.setString(5,zz1);
                 pst.setString(6,seex);
                 pst.setString(7,cclg1);
                 pst.setInt(8,pidd);
                 */
                icr = pst.executeUpdate();
                if (icr > 0) {
                    response.sendRedirect("./rchome.jsp?title=register&msgs=update successful");
                }
            } else {

                response.sendRedirect("./rchome.jsp?title=register&msg=college name should be given..");
            }
        } else {
            response.sendRedirect("./rchome.jsp?title=register&msg=some fields are blank");
        }

    } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException ee) {
        //con.rollback();
        out.println(">>>>>>>>>>" + ee);
        response.sendRedirect("./rchome.jsp?title=register&msg=this roll no is registered for another pid");
    } catch (Exception e) {
        out.print(e);
        response.sendRedirect("./rchome.jsp?title=register&msg=server error");
    } finally {
        boolean b = org.conn.close(con);
    }
%>