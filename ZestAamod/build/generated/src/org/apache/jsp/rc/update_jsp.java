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

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    Connection con;
    Statement st;
    ResultSet rsltst1 = null, rsltst11 = null;
    String prtId, clg11, clg1;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/rc/../importPackages.jsp");
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
      out.write("<form method=\"post\" action=\"rchome.jsp\">\n");
      out.write("    <input type=\"number\" name=\"pid\" placeholder=\"participant id\" min=\"1000\" max=\"9999\" required=\"\"/><br>\n");
      out.write("    <input type=\"hidden\" name=\"title\" value=\"register\">\n");
      out.write("    <button class=\"btn\">\n");
      out.write("        <div class=\"icon-search\"></div>\n");
      out.write("        search\n");
      out.write("    </button>\n");
      out.write("</form>\n");
      out.write("\n");

    clg1 = "";
    clg11 = "";
    prtId = request.getParameter("pid");
    if (prtId != null && prtId != "") {
        ServletContext Context3 = getServletContext();
        con = org.conn.connect(Context3.getInitParameter("id"), Context3.getInitParameter("pass"));
        st = con.createStatement();
        rsltst1 = st.executeQuery("select * from participant where pid='" + prtId + "'");
        try {
            if (rsltst1.next()) {

      out.write("\n");
      out.write("<form method=\"post\" action=\"./updateAction.jsp\">\n");
      out.write("    <input type=\"hidden\" name=\"title\" value=\"register\">\n");
      out.write("    <input type=\"hidden\" name=\"pid\" value=\"");
      out.print(prtId);
      out.write("\">\n");
      out.write("    <h6>name</h6>\n");
      out.write("    <input type=\"text\" name=\"name\" value=\"");
      out.print( rsltst1.getString("name"));
      out.write("\" placeholder=\"name\" required=\"\" />\n");
      out.write("    <h6>roll no</h6>\n");
      out.write("    <input type=\"text\" name=\"rollno\" value=\"");
      out.print( rsltst1.getString("rollno"));
      out.write("\" placeholder=\"roll no\" />\n");
      out.write("    ");

        st = con.createStatement();
        rsltst11 = st.executeQuery("select college from rules");
        while (rsltst11.next()) {
            clg11 = rsltst1.getString("college1");
            String ccc = rsltst1.getString("college");
            clg1 = rsltst11.getString(1);
    
      out.write("\n");
      out.write("\n");
      out.write("    <label><input type=\"radio\" name=\"college\" value=\"");
      out.print(clg1);
      out.write('"');
      out.write(' ');
if (clg1.equalsIgnoreCase(ccc)) {
            out.println("checked");
        }
      out.write("/> &nbsp; ");
      out.print(clg1);
      out.write("</label>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    <input type=\"text\" name=\"clg\" value=\"");
/*if(clg1.equalsIgnoreCase("other")) */ out.println(clg11);
      out.write("\" placeholder=\"College Name\"/>\n");
      out.write("    <h6>phone no</h6>\n");
      out.write("    <input type=\"number\" name=\"phone\" value=\"");
      out.print( rsltst1.getString("phone"));
      out.write("\" placeholder=\"phone\"/>\n");
      out.write("    <label><input type=\"radio\" name=\"sex\" value=\"male\" ");
if ((rsltst1.getString("sex")).equalsIgnoreCase("male")) {
            out.println("checked");
        }
      out.write("/> male</label>\n");
      out.write("    <label><input type=\"radio\" name=\"sex\" value=\"female\" ");
if ((rsltst1.getString("sex")).equalsIgnoreCase("female")) {
            out.println("checked");
        }
      out.write(" /> female</label>\n");
      out.write("    <br>\n");
      out.write("    <button class=\"btn\">\n");
      out.write("        <div class=\"icon-update\"></div>\n");
      out.write("        update\n");
      out.write("    </button>\n");
      out.write("</form>\n");
  } else
                response.sendRedirect("./rchome.jsp?title=register&msg=participant not registered");

        } catch (Exception e) {
            out.print(e);
        } finally {
            boolean b = org.conn.close(con);
        }
    }

      out.write("\n");
      out.write("<br><br><br>\n");
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
