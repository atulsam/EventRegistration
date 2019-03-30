package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import org.conn.*;
import java.sql.*;
import org.conn.*;

public final class addevent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    Connection con;
    String cName, Q;
    int mNp;
    PreparedStatement pS;
    int I;
    Statement sT;
    ResultSet rS;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/admin/../importPackages.jsp");
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
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<form method=\"POST\" action=\"addeventaction.jsp\">\n");
      out.write("    <br>\n");
      out.write("    <input type=\"text\" name=\"eid\" placeholder=\"event id\" required/><br>\n");
      out.write("    <input type=\"text\" name=\"ename\" placeholder=\"event name\" required=\"\"/><br>\n");
      out.write("    <input type=\"number\" name=\"group\" min=\"1\" placeholder=\"no. of participant\" required=\"\"/><br>\n");
      out.write("    <h6>associated club</h6>\n");
      out.write("    <select name=\"club\">\n");
      out.write("        ");
try {
             ServletContext cext = getServletContext();
                con = org.conn.connect(cext.getInitParameter("id"), cext.getInitParameter("pass"));
                sT = con.createStatement();
                rS = sT.executeQuery("select cid from club");
                while (rS != null && rS.next()) {
        
      out.write("\n");
      out.write("        <option style=\"width: 70px;\">");
      out.print( rS.getString("cid"));
      out.write("</option>\n");
      out.write("        ");

                }
            } catch (Exception e) {
                out.println("<option>server encounter a problem</option>");

            } finally {
                boolean b = org.conn.close(con);
            }
        
      out.write("\n");
      out.write("    </select>\n");
      out.write("    <label><input type=\"radio\" name=\"etype\" value=\"zest\" checked=\"\"/> Zest</label>\n");
      out.write("    <label><input type=\"radio\" name=\"etype\" value=\"Aamod\" /> Aamod</label>\n");
      out.write("    <hr>\n");
      out.write("    <label><input type=\"radio\" name=\"sex\" value=\"both\" checked=\"\" /> for both girls and boy</label>\n");
      out.write("    <label><input type=\"radio\" name=\"sex\" value=\"female\" /> girls</label>\n");
      out.write("    <label><input type=\"radio\" name=\"sex\" value=\"male\" /> boys</label>\n");
      out.write("    <button class=\"btn\" type=\"submit\">\n");
      out.write("        <div class=\"icon-add\"></div>\n");
      out.write("        add event\n");
      out.write("    </button>\n");
      out.write("</form>\n");
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
