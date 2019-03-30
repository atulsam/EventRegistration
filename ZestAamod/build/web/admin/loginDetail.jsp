<%
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("id");
    if (role != null && name != null && role.equals("admin")) {
        out.print(" " + role + " " + name);
    } else {
        response.sendRedirect("../index.jsp?title=home");
    }
%>
