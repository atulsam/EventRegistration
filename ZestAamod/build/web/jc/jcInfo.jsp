<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">
                <%
                    ServletContext context = getServletContext();
                    out.println(context.getInitParameter("title"));
                    String pageTitle = request.getParameter("title");
                %>
            </a>
            <div class="btn-group pull-right">
                <a class="btn dropdown-toggle" data-toggle="dropdown" >
                    <i class="icon-user"></i> <% out.println(session.getAttribute("role") + " " + session.getAttribute("id"));%>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><% if (session != null && session.getAttribute("role") != null && ((String) session.getAttribute("role")).equalsIgnoreCase("admin")) {
                            out.print("<a href='../admin/adminhome.jsp?title=admin home'>admin home</a>");
                        }%></li>
                    <li><% if (session != null && session.getAttribute("role") != null && ((String) session.getAttribute("role")).equalsIgnoreCase("admin")) {
                            out.print("<a href='../rc/rchome.jsp?title=rc home'>RC home</a>");
                        }%></li>
                    <li class="divider"></li>
                    <li><a href="../logout.jsp">Sign Out</a></li>
                </ul>
            </div>
            <div class="nav-collapse">
                <ul class="nav">
                    <li <% if (pageTitle != null && (pageTitle.equals("event") || pageTitle.equals("jc home"))) {
                            out.print("class='active'");
                        }%>><a href="jchome.jsp?title=event">Search By Event</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("pid")) {
                            out.print("active");
                        }%>"><a href="showByPid.jsp?title=pid">Participant Info</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("tid")) {
                            out.print("active");
                        }%>"><a href="showByTid.jsp?title=tid">Team Info</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("search")) {
                            out.print("active");
                        }%>"><a href="search.jsp?title=search">Search</a></li>
                        <li class="<% if (pageTitle != null && pageTitle.equals("full")) {
                                out.print("active");
                            }%>"><a href="fullList.jsp?title=full">Full List</a></li>
                        <li class="<% if (pageTitle != null && pageTitle.equals("eventD")) {
                                out.print("active");
                            }%>"><a href="eventDetails.jsp?title=eventD">Event Details</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>