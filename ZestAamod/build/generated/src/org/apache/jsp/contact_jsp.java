package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import org.conn.*;
import java.sql.*;
import org.conn.*;

public final class contact_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/import.jsp");
    _jspx_dependants.add("/headerCommon.jsp");
    _jspx_dependants.add("/info.jsp");
    _jspx_dependants.add("/footerCommon.jsp");
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
      out.write("\n");
      out.write('\n');
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/icon.gif\" type=\"image/x-icon\">\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body {\n");
      out.write("                padding-top: 60px;\n");
      out.write("                padding-bottom: 40px;\n");
      out.write("                padding-left:85px;\n");
      out.write("                padding-right: 85px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <title> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.title}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" - Zest & Aamod 2015</title>\n");
      out.write("    </head>\n");
      out.write("    <body>");
      out.write('\n');
      out.write("<div class=\"navbar navbar-fixed-top\">\n");
      out.write("    <div class=\"navbar-inner\">\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("            </a>\n");
      out.write("            <a class=\"brand\" href=\"\">\n");
      out.write("                ");

                    ServletContext context = getServletContext();
                    out.println(context.getInitParameter("title"));
                
      out.write("\n");
      out.write("            </a>\n");
      out.write("            <div class=\"btn-group pull-right\">\n");
      out.write("                <a class=\"btn dropdown-toggle\"  href=\"login.jsp?title=login\">\n");
      out.write("                    <i class=\"icon-user\"></i> Guest\n");
      out.write("                    <span class=\"caret\"></span>\n");
      out.write("                </a>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            ");

            String pageTitle=request.getParameter("title");
            
      out.write("\n");
      out.write("            <div class=\"nav-collapse\">\n");
      out.write("                <ul class=\"nav\">\n");
      out.write("                      <li \n");
      out.write("                    ");
 if ("login".equals(pageTitle) ) {
                            out.print("class='active'");
                        }
      out.write(">\n");
      out.write("                          <a href=\"index.jsp?title=home\">Home</a></li>\n");
      out.write("              <!--      <li><a href=\"#about\">About</a></li>\n");
      out.write("                -->     <li \n");
      out.write("                    ");
 if ("contact".equals(pageTitle) ) {
                            out.print("class='active'");
                        }
      out.write("><a href=\"contact.jsp?title=contact\">Contact Us</a></li>\n");
      out.write("               </ul>\n");
      out.write("            </div><!--/.nav-collapse -->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("<h3>Developed By :-</h3>\n");
      out.write("<div style=\"float: left; padding-left: 8%;padding-top: 5%;\">\n");
      out.write("    <h3>Atul Kumar Singh</h3>\n");
      out.write("    <h4>IT-11</h4>\n");
      out.write("    <a href=\"http://www.thedreamnetworks.com\" >www.thedreamnetworks.com</a>\n");
      out.write("    <h5>atulsinghjnv@gmail.com</h5>\n");
      out.write("    <h6>Phone No. : 9458704451</h6>\n");
      out.write("    <a href='https://www.facebook.com/incredible.atul.singh'>\n");
      out.write("\t<img src=\"img/atul.jpg\" height=\"400px\" width=\"350px\">\n");
      out.write("    </a>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<footer class=\"footer\" id=\"footer\">\n");
      out.write("    <p>\n");
      out.write("        ");

            ServletContext contextFooter = getServletContext();
            out.print( contextFooter.getInitParameter("title") + " &copy; ");
//            out.print(contextFooter.getInitParameter("developers"));
//            out.print(" & Atul Kumar Singh (9458704451)");
        
      out.write("\n");
      out.write("    </p>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("<script src=\"js/jquery.min.js\"></script>\n");
      out.write("<script src=\"js/bootstrap-dropdown.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
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
