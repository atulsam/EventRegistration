<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    String cName, Q;
    int mNp;
    PreparedStatement pS;
    int I;
    Statement sT;
    ResultSet rS;
%>

<form method="POST" action="addeventaction.jsp">
    <br>
    <input type="text" name="eid" placeholder="event id" required/><br>
    <input type="text" name="ename" placeholder="event name" required=""/><br>
    <input type="number" name="group" min="1" placeholder="no. of participant" required=""/><br>
    <h6>associated club</h6>
    <select name="club">
        <%try {
             ServletContext cext = getServletContext();
                con = org.conn.connect(cext.getInitParameter("id"), cext.getInitParameter("pass"));
                sT = con.createStatement();
                rS = sT.executeQuery("select cid from club");
                while (rS != null && rS.next()) {
        %>
        <option style="width: 70px;"><%= rS.getString("cid")%></option>
        <%
                }
            } catch (Exception e) {
                out.println("<option>server encounter a problem</option>");

            } finally {
                boolean b = org.conn.close(con);
            }
        %>
    </select>
    <label><input type="radio" name="etype" value="zest" checked=""/> Zest</label>
    <label><input type="radio" name="etype" value="Aamod" /> Aamod</label>
    <hr>
    <label><input type="radio" name="sex" value="both" checked="" /> for both girls and boy</label>
    <label><input type="radio" name="sex" value="female" /> girls</label>
    <label><input type="radio" name="sex" value="male" /> boys</label>
    <button class="btn" type="submit">
        <div class="icon-add"></div>
        add event
    </button>
</form>
