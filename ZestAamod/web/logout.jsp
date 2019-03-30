<%
    session.setAttribute("id", null);
    session.setAttribute("role", null);
    session.invalidate();
    response.sendRedirect("./index.jsp?title=home");
%>
