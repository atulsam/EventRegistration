<%@include file="../importPackages.jsp" %>

<%@include file="./loginDetail.jsp" %>
<%!    
    Connection con;
    Statement st, st1,st2;
    ResultSet rs = null, rs1 = null;
    String pid, gender, q1, id, college, q;
    boolean status;
    int ii = 0,p;
%>

<%
 ServletContext ct = getServletContext();
con= org.conn.connect(ct.getInitParameter("id"), ct.getInitParameter("pass"));
try{
    q="select eid,ename from events ";
    st=con.createStatement();
    rs=st.executeQuery(q);
    %>
    <form action="jchome.jsp?title=event" method="post">
    <select name="eid">
<%
    while(rs.next()){
    %>
    
    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>

    <%    
    }
    %>
    </select><br>
    <button type="submit" class="btn">
        <div class="icon-search"></div>
        search
    </button>
    </form>
        <%
}
catch(Exception e){
    out.println(e);
}
finally{
    boolean b=org.conn.close(con);
}
%>