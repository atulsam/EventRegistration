package org.apache.jsp.jc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import org.conn.*;
import java.sql.*;
import org.conn.*;

public final class showParticipantsByCollegeAction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/jc/../importPackages.jsp");
    _jspx_dependants.add("/jc/loginDetail.jsp");
    _jspx_dependants.add("/jc/jcInfo.jsp");
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

    if (session.getAttribute("id")!=null && session.getAttribute("role")!=null &&(((String) session.getAttribute("role")).equals("admin") || ((String) session.getAttribute("role")).equals("jc") )) {
        //out.print(((String) session.getAttribute("role")) + " " + ((String) session.getAttribute("id")));
    } else {
        response.sendRedirect("../error.jsp");
        //out.println(session.getAttribute("role")+ " "+session.getAttribute("id")+ "error");
    }

      out.write('\n');
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
                            out.print("<a href='../rc/rchome.jsp?title=rc home'>RC home</a>");
                        }
      out.write("</li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"../logout.jsp\">Sign Out</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"nav-collapse\">\n");
      out.write("                <ul class=\"nav\">\n");
      out.write("                    <li ");
 if (pageTitle != null && (pageTitle.equals("event") || pageTitle.equals("jc home"))) {
                            out.print("class='active'");
                        }
      out.write("><a href=\"jchome.jsp?title=event\">Search By Event</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("pid")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"showByPid.jsp?title=pid\">Participant Info</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("tid")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"showByTid.jsp?title=tid\">Team Info</a></li>\n");
      out.write("                    <li class=\"");
 if (pageTitle != null && pageTitle.equals("search")) {
                            out.print("active");
                        }
      out.write("\"><a href=\"search.jsp?title=search\">Search</a></li>\n");
      out.write("                        <li class=\"");
 if (pageTitle != null && pageTitle.equals("full")) {
                                out.print("active");
                            }
      out.write("\"><a href=\"fullList.jsp?title=full\">Full List</a></li>\n");
      out.write("                        <li class=\"");
 if (pageTitle != null && pageTitle.equals("eventD")) {
                                out.print("active");
                            }
      out.write("\"><a href=\"eventDetails.jsp?title=eventD\">Event Details</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div><!--/.nav-collapse -->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write('\n');

//    String eiid = request.getParameter("eid");
    int pd, ii = 0;
    ServletContext cot = getServletContext();
    Connection c = org.conn.connect(cot.getInitParameter("id"), cot.getInitParameter("pass"));
    try {


      out.write("\n");
      out.write("<center>\n");
      out.write("    <div id=\"div_print\" class=\"centered\" >\n");
      out.write("        <table border=\"1\" width=\"100%\"  >\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th width=\"2%\" >S.No.</th>\n");
      out.write("                    <th width=\"4%\" >PID</th>\n");
      out.write("                    <th width=\"6%\" >Name</th>\n");
      out.write("                    <th>College</th>\n");
      out.write("                    <th width=\"5%\" >Roll No.</th>\n");
      out.write("                    <th width=\"30%\" >Zest Events</th>\n");
      out.write("                    <th width=\"30%\" >Aamod Events</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");

                    String q = "select pid from participation";
                    ResultSet r, r1, r2;
                    r = c.createStatement().executeQuery(q);
                    while (r.next()) {
                        pd = r.getInt(1);
                        String q1 = "select p.name , p.college1 , p.rollno ,ps.* from participant as p,participation as ps where ps.pid='" + pd + "' and p.pid='" + pd + "'";
                        String q2 = "select eid,ename,club,type from events order by club";
                        String id, ze = "", ae = "";
                        r1 = c.createStatement().executeQuery(q1);
                        r2 = c.createStatement().executeQuery(q2);
                        if (r1.next()) {
                            while (r2.next()) {
                                id = r1.getString(("ps." + r2.getString(1)));
                                if (!id.equals("nop")) {
                                    if (r2.getString(4).equals("zest")) {
                                        ze = ze + r2.getString(2) + ",";
                                    } else {
                                        ae = ae + r2.getString(2) + ",";
                                    }
                                }
                            }
                            String print = "";
                            if (ii % 2 != 0) {
                                print = "#d1f7ff";
                            } else {
                                print = "white";
                            }
                            out.println("<tr style='background-color:" + print + ";'>");
                            out.println("<td>" + ++ii + "</td>");
                            out.println("<td>" + pd + "</td>");
                            out.println("<td>" + r1.getString(1) + "</td>");
                            out.println("<td>" + r1.getString(2) + "</td>");
                            out.println("<td>" + r1.getString(3) + "</td>");
                            out.println("<td>" + ze + "</td>");
                            out.println("<td>" + ae + "</td>");
                            out.println("</tr>");
                        }

                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("        <br><br><center>\n");
      out.write("            <button type=\"button\" class=\"btn\" onClick=\"printdiv('div_print');\">\n");
      out.write("                <div class=\"icon-print\"></div>\n");
      out.write("                print\n");
      out.write("            </button><br><br><br><br>\n");
      out.write("            </div> \n");
      out.write("        </center>\n");
      out.write("        ");

            } catch (Exception e) {
                out.println(e);
            } finally {
                boolean b = org.conn.close(c);
            }
        
      out.write('\n');
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
