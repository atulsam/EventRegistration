<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="">
                <%
                    ServletContext context = getServletContext();
                    out.println(context.getInitParameter("title"));
                %>
            </a>
           <!-- <div class="btn-group pull-right">
                <a class="btn dropdown-toggle"  href="login.jsp?title=login">
                    <i class="icon-user"></i> Guest
                    <span class="caret"></span>
                </a>
                
            </div> -->
            <%
            String pageTitle=request.getParameter("title");
            %>
            <div class="nav-collapse">
                <ul class="nav">
                      <li 
                    <% if ("login".equals(pageTitle) ) {
                            out.print("class='active'");
                        }%>>
                          <a href="index.jsp?title=home">Home</a></li>
              <!--      <li><a href="#about">About</a></li>
                -->     <li 
                    <% if ("contact".equals(pageTitle) ) {
                            out.print("class='active'");
                        }%>><a href="contact.jsp?title=contact">Contact Us</a></li>
               </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>