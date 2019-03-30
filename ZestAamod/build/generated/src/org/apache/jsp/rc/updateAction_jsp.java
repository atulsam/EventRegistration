package org.apache.jsp.rc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import org.conn.*;
import java.sql.*;
import org.conn.*;

public final class updateAction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    Connection con;
    String prname, clg, phn1, seex, rno, qqry, iidd, cclg1;
    int pidd;
    PreparedStatement pst;
    int icr, jcr;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/rc/../importPackages.jsp");
    _jspx_dependants.add("/rc/./loginDetail.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');

    //String s = (String) session.getAttribute("role");
    //String name = (String) session.getAttribute("id");


    if (session.getAttribute("id") != null && session.getAttribute("role") != null && (((String) session.getAttribute("role")).equals("admin") || ((String) session.getAttribute("role")).equals("rc"))) {
        //out.print(((String) session.getAttribute("role")) + " " + ((String) session.getAttribute("id")));
    } else {
        response.sendRedirect("../error.jsp");
    }

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

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
            if (!clg.equalsIgnoreCase("others")) {
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

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
