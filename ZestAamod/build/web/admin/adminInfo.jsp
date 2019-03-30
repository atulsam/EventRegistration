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
                    <i class="icon-user"></i> <%@include file="loginDetail.jsp" %>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="../rc/rchome.jsp?title=rc home">RC Home Page</a></li>
                    <li><a href="../jc/jchome.jsp?title=jc home">JC Home Page</a></li>
                    <li class="divider"></li>
                    <li><a href="../logout.jsp">Sign Out</a></li>
                </ul>
            </div>
            <div class="nav-collapse">
                <ul class="nav">
                    <li <% if (pageTitle != null && pageTitle.equals("user") || pageTitle.equals("admin home")) {
                            out.print("class='active'");
                        }%>><a href="adminhome.jsp?title=user">User</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("club")) {
                            out.print("active");
                        }%>"><a href="club.jsp?title=club">Club</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("rule")) {
                            out.print("active");
                        }%>"><a href="rule.jsp?title=rule">Rules</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("event")) {
                            out.print("active");
                        }%>"><a href="event.jsp?title=event">Events</a></li>
                    <li class="<% if (pageTitle != null && pageTitle.equals("unregister")) {
                            out.print("active");
                        }%>"><a href="unregister.jsp?title=unregister">Unregister</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>