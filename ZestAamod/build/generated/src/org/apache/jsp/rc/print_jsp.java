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

public final class print_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    Connection con;
    Statement st, st1, st2;
    ResultSet rs = null, rs1 = null;
    String pid, gender, q1, id, college, q;
    boolean status;
    int ii = 0, p;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(5);
    _jspx_dependants.add("/rc/../importPackages.jsp");
    _jspx_dependants.add("/rc/./loginDetail.jsp");
    _jspx_dependants.add("/rc/headercommon.jsp");
    _jspx_dependants.add("/rc/rcInfo.jsp");
    _jspx_dependants.add("/rc/footerCommon.jsp");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/style.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../img/icon.gif\" type=\"image/x-icon\">\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body {\n");
      out.write("                padding-top: 60px;\n");
      out.write("                padding-bottom: 40px;\n");
      out.write("                padding-left:85px;\n");
      out.write("                padding-right: 85px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script language=\"javascript\">\n");
      out.write("            function printdiv(printpage)\n");
      out.write("            {\n");
      out.write("                var headstr = \"<html><head><style type='text/css' media='print,screen'> table{width: 100%;}}</style></head><body>\";\n");
      out.write("                var footstr = \"</body>\";\n");
      out.write("                var newstr = document.all.item(printpage).innerHTML;\n");
      out.write("                var oldstr = document.body.innerHTML;\n");
      out.write("                document.body.innerHTML = headstr + newstr + footstr;\n");
      out.write("                window.print();\n");
      out.write("                document.body.innerHTML = oldstr;\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <title> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.title}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" - Zest & Aamod 2013</title>\n");
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
      out.write("            <a class=\"brand\" href=\"#\">\n");
      out.write("                ");

                    ServletContext context = getServletContext();
                    out.println(context.getInitParameter("title"));
                    String pageTitle = request.getParameter("title");
                
      out.write("\n");
      out.write("            </a>\n");
      out.write("            <div class=\"btn-group pull-right\">\n");
      out.write("                <a class=\"btn dropdown-toggle\" data-toggle=\"dropdown\" >\n");
      out.write("                    <i class=\"icon-user\"></i> ");
 out.println(session.getAttribute("role") + " " + session.getAttribute("id"));
      out.write("\n");
      out.write("                    <span class=\"caret\"></span>\n");
      out.write("                </a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    <li>");
 if (session != null && session.getAttribute("role") != null && ((String) session.getAttribute("role")).equalsIgnoreCase("admin")) {
                            out.print("<a href='../admin/adminhome.jsp?title=admin home'>admin home</a>");
                        }
      out.write("</li>\n");
      out.write("                    <li>");
 if (session != null && session.getAttribute("role") != null && ((String) session.getAttribute("role")).equalsIgnoreCase("admin")) {
                            out.print("<a href='../jc/jchome.jsp?title=jc home'>JC home</a>");
                        }
      out.write("</li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"../logout.jsp\">Sign Out</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"nav-collapse\">\n");
      out.write("                <ul class=\"nav\">\n");
      out.write("                    <li ");
 if (pageTitle != null && (pageTitle.equals("register") || pageTitle.equals("rc home"))) {
                            out.print("class='active'");
                        }
      out.write("><a href=\"rchome.jsp?title=register\">Participant</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("team")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"teamEnrol.jsp?title=team\">Enroll Team</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("updateTeam")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"updateTeam.jsp?title=updateTeam\">Update Team</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("event")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"eventEnrol.jsp?title=event\">Event</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("search")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"rcSearch.jsp?title=search\">Search</a></li>\n");
      out.write("\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("searchByPID")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"showUserD.jsp?title=searchByPID\">Search Pid</a></li>\n");
      out.write("\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("print")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"print.jsp?title=print\">Print</a></li>\n");
      out.write("                        <li class=\"");
 if (pageTitle != null && pageTitle.equals("eventD")) {
                                out.print("active");
                            }
      out.write("\"><a href=\"eventDetails.jsp?title=eventD\">Event Details</a></li>\n");
      out.write("                        <li class=\"");
 if (pageTitle != null && pageTitle.equals("passout")) {
                                out.print("active");
                            }
      out.write("\"><a href=\"passOut.jsp?title=passout\">Alumni Registration</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div><!--/.nav-collapse -->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write('\n');
      out.write('\n');
      out.write('\n');

    pid = request.getParameter("pid");

      out.write("\n");
      out.write("<div style=\"padding-top: 3%\">\n");
      out.write("    <center>\n");
      out.write("        <form action=\"print.jsp\" method=\"post\">\n");
      out.write("            <input type=\"number\" name=\"pid\" placeholder=\"participant id\" required=\"\" min=\"1000\" max=\"9999\"><br>\n");
      out.write("            <input type=\"hidden\" name=\"title\" value=\"print\">\n");
      out.write("            <button type=\"submit\" class=\"btn\">\n");
      out.write("                <div class=\"icon-search\"></div>\n");
      out.write("                serch detail\n");
      out.write("            </button>\n");
      out.write("        </form>\n");
      out.write("    </center>\n");
      out.write("</div>\n");
      out.write("<div id=\"div_print\"  style=\"padding-left: 35%;\">\n");
      out.write("    ");
   if (pid != null) {
            ii = 0;
            ServletContext Ctext = getServletContext();
            con = org.conn.connect(Ctext.getInitParameter("id"), Ctext.getInitParameter("pass"));
            try {
                q = "select p.name , p.college , p.rollno , p.sex , p.printed ,ps.* from participant as p,participation as ps where ps.pid='" + pid + "' and p.pid='" + pid + "'";
                q1 = "select eid,ename,club,type from events order by club";
                st = con.createStatement();
                st1 = con.createStatement();
                st2 = con.createStatement();

                rs = st.executeQuery(q);
                rs1 = st1.executeQuery(q1);
                if (rs.next()) {
                    p = rs.getInt("p.printed");
                    out.println("<h4>Techvyom  2014</h4>");
                    out.println(" <h5>P. Id  : " + pid);
                    out.println("&nbsp;&nbsp;&nbsp;&nbsp; name : " + rs.getString(1) + "</h5>");
                    out.println(" Event Enrolled : ");
                    while (rs1.next()) {
                        id = rs.getString(("ps." + rs1.getString(1)));
                        if (!id.equals("nop")) {
                            if (id.length() == 4) {
                                id = "";
                            } else {
                                id = " ( t. id : " + id + " ) ";
                            }
                            out.println("<h6>" + (++ii) + " : " + rs1.getString(2) + id + "</h6>");
                        }
                    }

                    int x = st2.executeUpdate("update participant set printed=printed+1 where pid=" + pid);
    
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<br><br><center>\n");
      out.write("    <button type=\"button\" class=\"btn\" onClick=\"printdiv('div_print');\">\n");
      out.write("        <div class=\"icon-print\"></div>\n");
      out.write("        print\n");
      out.write("    </button>\n");
      out.write("</center>\n");
 out.println("No. of printouts " + p);
      out.write('\n');

        } else {
            out.println("</div><div class='alert'>paticipant does not exist</div>");
        }
    } catch (Exception e) {
        out.println("<div class='alert'>" + e + "</div>");
    } finally {
        boolean b = org.conn.close(con);
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


    }

      out.write('\n');
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
      out.write("<script src=\"../js/jquery.min.js\"></script>\n");
      out.write("<script src=\"../js/bootstrap-dropdown.js\"></script>\n");
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
