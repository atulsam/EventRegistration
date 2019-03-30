<%@include file="../importPackages.jsp" %>

<%@include file="loginDetail.jsp" %>
<%!    Connection cn;
    Statement stm;
    ResultSet rsltst;
%>
<form method="post" action="./registerAction.jsp">
    <input type="text" name="name" value="" placeholder="name" required=""/><br>
    <input type="text" name="rollno" value="" placeholder="roll no" required="" />

    <%
        ServletContext Contex = getServletContext();
        cn = org.conn.connect(Contex.getInitParameter("id"), Contex.getInitParameter("pass"));
        try {
            //stm = cn.createStatement();
            rsltst = cn.createStatement().executeQuery("select college from rules");
            while (rsltst.next()) {
    %>
    <label><input type="radio" name="college" value="<%=rsltst.getString(1)%>" <%if (rsltst.getString(1).equalsIgnoreCase("others")) {
            out.println("checked");
        }%>/> &nbsp; <%=rsltst.getString(1)%></label>
        <%}
            ResultSet rr = cn.createStatement().executeQuery("select distinct college1 from participant order by college1");
        %>
    <select name="oclg">
        <option value="other">other</option>
        <%
            while (rr.next()) {
        %>
        <option><%= rr.getString(1)%></option>
        <%
            }%>
    </select><br>
    <%
        } catch (Exception e) {
            out.print(e);
        } finally {
            boolean b = org.conn.close(cn);
        }
    %>
    <input type="text" name="clg" value="" placeholder="college name"/>
    <br><input type="number" name="phone" required="" value="" placeholder="phone no" max="9999999999" min="1000000000" />
    <label><input type="radio" name="sex" value="male" checked/> male</label>
    <label><input type="radio" name="sex" value="female" /> female</label>
    <button class="btn">
        <div class="icon-check"></div>
        register
    </button>
</form>
