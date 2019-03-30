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

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    String id, pass, q, role;
    Statement st;
    ResultSet rs;
    Connection con;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/import.jsp");
    _jspx_dependants.add("/headerCommon.jsp");
    _jspx_dependants.add("/info.jsp");
    _jspx_dependants.add("/contentLogin.jsp");
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
      out.write(" - Techvyom-2014</title>\n");
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
      out.write('\n');
      out.write("<section id=\"content\">\n");
      out.write("    <article>\n");
      out.write("        <div id=\"box\">\n");
      out.write("            \n");
      out.write("            <div class=\"a3 fall bigger\" style=\"left:30px;\">Techvyom 2014</div>\n");
      out.write("           \n");
      out.write("            <div class=\"a3 slide bigger\" style=\"top:110px;\">Techvyom 2014</div>\n");
      out.write("            <div class=\"a4 crazy\" style=\"top:350px;\">Techvyom 2014</div>\n");
      out.write("        </div>\n");
      out.write("    </article>\n");
      out.write("</section>\n");
      out.write("<div style=\"float: right;width: 225px;\">\n");
      out.write("    <div style=\"padding-right: 20%;padding-top: 80%;\">\n");
      out.write("        <form action=\"\" method=\"post\">\n");
      out.write("            <input accesskey=\"l\" type=\"text\" name=\"id\" placeholder=\"user id\" required /><br>\n");
      out.write("            <input type=\"password\" name=\"pass\" placeholder=\"password\" required /><br>\n");
      out.write("            <button type=\"submit\" class=\"btn\"><div class=\"icon-time\"></div> sign in </button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    ");

        if (session != null && session.getAttribute("msg") != null && session.getAttribute("msg") != "") {
            out.println("<div class='alert'>" + session.getAttribute("msg") + "</div>");
            session.setAttribute("msg", "");
        }
    
      out.write("\n");
      out.write("</div>");
      out.write('\n');
      out.write("<footer class=\"footer\" id=\"footer\">\n");
      out.write("    <p>\n");
      out.write("        ");

            ServletContext contextFooter = getServletContext();
            out.print( contextFooter.getInitParameter("title") + " &copy; ");
            out.print(contextFooter.getInitParameter("developers"));
            out.print(" & Atul Kumar Singh (9458704451)");
        
      out.write("\n");
      out.write("    </p>\n");
      out.write("</footer>\n");
      out.write("\n");
      out.write("<script src=\"js/jquery.min.js\"></script>\n");
      out.write("<script src=\"js/bootstrap-dropdown.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write('\n');

    try {

        if (session != null && session.getAttribute("role") != null) {
            if (session.getAttribute("role").equals("admin")) {
                response.sendRedirect("./admin/adminhome.jsp?title=admin home&action=home");
            } else if (session.getAttribute("role").equals("rc")) {
                response.sendRedirect("./rc/rchome.jsp?title=rc home&action=home");
            } else if (session.getAttribute("role").equals("jc")) {
                response.sendRedirect("./jc/jchome.jsp?title=jc home&action=home");
            }
        }
        
        id = request.getParameter("id");
        pass = request.getParameter("pass");
        con = org.conn.connect(context.getInitParameter("id"), context.getInitParameter("pass"));
        
        if (con != null && id != "" && pass != "" && id != null && pass != null) {
            q = "select * from login_master where id='" + id + "'";
            st = con.createStatement();
            rs = st.executeQuery(q);
            if (rs.next()) {
                if (pass.equals(rs.getString("pass"))) {
                    role = rs.getString("type");
                    session = request.getSession(false);
                    session.setAttribute("id", id);
                    session.setAttribute("role", role);
                    if (role.equals("admin")) {
                        ///request.setAttribute("msg", "admin");
                        response.sendRedirect("./admin/adminhome.jsp?title=admin home&action=home");
                    } else if (role.equals("rc")) {
                        response.sendRedirect("./rc/rchome.jsp?title=rc home&action=home");
                    } else if (role.equals("jc")) {
                        response.sendRedirect("./jc/jchome.jsp?title=jc home&action=home");
                    } else {
                        session.setAttribute("msg", "wrong username or password");
                    }
                } else {
                    session.setAttribute("msg", "wrong username or password");
                }
            } else {
                session.setAttribute("msg", "wrong username or password");
            }
        }
    } catch (Exception e) {
        session.setAttribute("msg", "wrong username or password");
    } finally {
        boolean closed = org.conn.close(con);
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
