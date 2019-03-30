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
                            out.print("<a href='../jc/jchome.jsp?title=jc home'>JC home</a>");
                        }%></li>
                    <li class="divider"></li>
                    <li><a href="../logout.jsp">Sign Out</a></li>
                </ul>
            </div>
            <div class="nav-collapse">
                <ul class="nav">
                    <li <% if (pageTitle != null && (pageTitle.equals("register") || pageTitle.equals("rc home"))) {
                            out.print("class='active'");
                        }%>><a href="rchome.jsp?title=register">Participant</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("team")) {
                            out.print("active");
                        }%>"><a href="teamEnrol.jsp?title=team">Enroll Team</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("updateTeam")) {
                            out.print("active");
                        }%>"><a href="updateTeam.jsp?title=updateTeam">Update Team</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("event")) {
                            out.print("active");
                        }%>"><a href="eventEnrol.jsp?title=event">Event</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("search")) {
                            out.print("active");
                        }%>"><a href="rcSearch.jsp?title=search">Search</a></li>

                    <li class="<% if (pageTitle != null && pageTitle.equals("searchByPID")) {
                            out.print("active");
                        }%>"><a href="showUserD.jsp?title=searchByPID">Search Pid</a></li>

                    <li class="<% if (pageTitle != null && pageTitle.equals("print")) {
                            out.print("active");
                        }%>"><a href="print.jsp?title=print">Print</a></li>
                        <li class="<% if (pageTitle != null && pageTitle.equals("eventD")) {
                                out.print("active");
                            }%>"><a href="eventDetails.jsp?title=eventD">Event Details</a></li>
                        <li class="<% if (pageTitle != null && pageTitle.equals("passout")) {
                                out.print("active");
                            }%>"><a href="passOut.jsp?title=passout">Alumni Registration</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>