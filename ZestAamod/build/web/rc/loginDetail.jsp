<%
    //String s = (String) session.getAttribute("role");
    //String name = (String) session.getAttribute("id");


    if (session.getAttribute("id") != null && session.getAttribute("role") != null && (((String) session.getAttribute("role")).equals("admin") || ((String) session.getAttribute("role")).equals("rc"))) {
        //out.print(((String) session.getAttribute("role")) + " " + ((String) session.getAttribute("id")));
    } else {
        response.sendRedirect("../error.jsp");
    }
%>
