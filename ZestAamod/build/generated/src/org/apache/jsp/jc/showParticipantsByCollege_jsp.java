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

public final class showParticipantsByCollege_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

    
    Connection con;
    Statement st, st1,st2;
    ResultSet rs = null, rs1 = null;
    String pid, gender, q1, id, college, q;
    boolean status;
    int ii = 0,p;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/jc/../importPackages.jsp");
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
      out.write('\n');
      out.write('\n');

 ServletContext ct = getServletContext();
con= org.conn.connect(ct.getInitParameter("id"), ct.getInitParameter("pass"));
try{
    q="select distinct college1 from participant";
    st=con.createStatement();
    rs=st.executeQuery(q);
    
      out.write("\n");
      out.write("    <form action=\"fullList.jsp?title=event\" method=\"post\">\n");
      out.write("    <select name=\"eid\">\n");

    while(rs.next()){
    
      out.write("\n");
      out.write("    \n");
      out.write("    <option value=\"");
      out.print(rs.getString(1));
      out.write('"');
      out.write('>');
      out.print(rs.getString(1));
      out.write("</option>\n");
      out.write("\n");
      out.write("    ");
    
    }
    
      out.write("\n");
      out.write("    </select><br>\n");
      out.write("    <button type=\"submit\" class=\"btn\">\n");
      out.write("        <div class=\"icon-search\"></div>\n");
      out.write("        search\n");
      out.write("    </button>\n");
      out.write("    </form>\n");
      out.write("        ");

}
catch(Exception e){
    out.println(e);
}
finally{
    boolean b=org.conn.close(con);
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
