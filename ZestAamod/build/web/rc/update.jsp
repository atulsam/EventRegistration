<%@include file="../importPackages.jsp" %>

<%!    Connection con;
    Statement st;
    ResultSet rsltst1 = null, rsltst11 = null;
    String prtId, clg11, clg1;
%>

<form method="post" action="rchome.jsp">
    <input type="number" name="pid" placeholder="participant id" min="1000" max="9999" required=""/><br>
    <input type="hidden" name="title" value="register">
    <button class="btn">
        <div class="icon-search"></div>
        search
    </button>
</form>

<%
    clg1 = "";
    clg11 = "";
    prtId = request.getParameter("pid");
    if (prtId != null && prtId != "") {
        ServletContext Context3 = getServletContext();
        con = org.conn.connect(Context3.getInitParameter("id"), Context3.getInitParameter("pass"));
        st = con.createStatement();
        rsltst1 = st.executeQuery("select * from participant where pid='" + prtId + "'");
        try {
            if (rsltst1.next()) {
%>
<form method="post" action="./updateAction.jsp">
    <input type="hidden" name="title" value="register">
    <input type="hidden" name="pid" value="<%=prtId%>">
    <h6>name</h6>
    <input type="text" name="name" value="<%= rsltst1.getString("name")%>" placeholder="name" required="" />
    <h6>roll no</h6>
    <input type="text" name="rollno" value="<%= rsltst1.getString("rollno")%>" placeholder="roll no" />
    <%
        st = con.createStatement();
        rsltst11 = st.executeQuery("select college from rules");
        while (rsltst11.next()) {
            clg11 = rsltst1.getString("college1");
            String ccc = rsltst1.getString("college");
            clg1 = rsltst11.getString(1);
    %>

    <label><input type="radio" name="college" value="<%=clg1%>" <%if (clg1.equalsIgnoreCase(ccc)) {
            out.println("checked");
        }%>/> &nbsp; <%=clg1%></label>
        <%
            }
        %>
    <input type="text" name="clg" value="<%/*if(clg1.equalsIgnoreCase("other")) */ out.println(clg11);%>" placeholder="College Name"/>
    <h6>phone no</h6>
    <input type="number" name="phone" value="<%= rsltst1.getString("phone")%>" placeholder="phone"/>
    <label><input type="radio" name="sex" value="male" <%if ((rsltst1.getString("sex")).equalsIgnoreCase("male")) {
            out.println("checked");
        }%>/> male</label>
    <label><input type="radio" name="sex" value="female" <%if ((rsltst1.getString("sex")).equalsIgnoreCase("female")) {
            out.println("checked");
        }%> /> female</label>
    <br>
    <button class="btn">
        <div class="icon-update"></div>
        update
    </button>
</form>
<%  } else
                response.sendRedirect("./rchome.jsp?title=register&msg=participant not registered");

        } catch (Exception e) {
            out.print(e);
        } finally {
            boolean b = org.conn.close(con);
        }
    }
%>
<br><br><br>
