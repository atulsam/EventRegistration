<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
    Connection conN = null;
    ServletContext sC = getServletContext();
//    int i = 0;
%>
<table width="100%;" border="1" >
    <thead>
    <th width="10%" >Sl No</th>
    <th>Name</th>
    <th width="16%" >Course</th>
    <th width="16%" >Batch</th>
    <th width="25%" >Mobile No</th>
</thead>
<tbody>
    <%  conN = org.conn.connect(sC.getInitParameter("id"), sC.getInitParameter("pass"));
        try {
            ResultSet Rss = conN.createStatement().executeQuery("select * from passout");
            while (Rss.next()) {
    %>
    <tr>
        <!-- <td><%//=++i%></td> -->
        <td><%=Rss.getString("id")%></td>
        <td><%=Rss.getString("name")%></td>
        <td><%=Rss.getString("course")%></td>
        <td><%=Rss.getString("batch")%></td>
        <td><%=Rss.getString("mobile")%></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            boolean b = org.conn.close(conN);
        }
    %>
</tbody>
</table>