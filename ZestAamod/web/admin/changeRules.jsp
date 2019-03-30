<%@include file="../importPackages.jsp" %>
<%!    Connection con;
    String cname, q;
    int mzp, map, mtp;
    PreparedStatement ps;
    int i, j;
    Statement st;
    ResultSet rs;
%>

<%
    try {
         ServletContext contet = getServletContext();
        con = org.conn.connect(contet.getInitParameter("id"), contet.getInitParameter("pass"));
        st = con.createStatement();
        rs = st.executeQuery("select college from rules");
%>
<form method="POST" action="rule.jsp?title=rule">
    <select name="cname">
        <%while (rs.next()) {%>
        <option><%=rs.getString(1)%> </option>
        <%
            }
        %>
    </select>
    <br>
    <button type="submit" class="btn">
        <div class="icon-update"></div>
        change
    </button>
</form>
<%
    cname = request.getParameter("cname");
    if (cname != null && cname != "") {
        st = con.createStatement();
        rs = st.executeQuery("select * from rules where college='" + cname + "'");
        if (rs.next()) {
%>
<form method="POST" action="changeRulesAction.jsp">
    <h5>college selected : <%= cname%></h5>
    <input type="hidden" name="cname" value="<%=rs.getString("college")%>">
    <BR><h6>Max for Zest :</h6> <input type="number" name="mzp" value="<%=rs.getInt("mzp")%>" placeholder="max. no of participation in Techvyom" required min="0"/>
    <BR><h6>Max for Aamod :</h6> <input type="number" name="map" value="<%=rs.getInt("map")%>" placeholder="max. no of participation in aamod" required min="0"/>
    <BR><h6>Max total :</h6> <input type="number" name="mtp" value="<%=rs.getInt("mtp")%>" placeholder="max. no of total participation" required min="1"/>
    <BR><h6>Max group Event for Zest :</h6> <input type="number" name="mzpg" value="<%=rs.getInt("mzpg")%>" placeholder="max.group participation in Techvyom" required min="1"/>
    <BR><h6>Max Indivisual Event for Zest :</h6> <input type="number" name="mzpi" value="<%=rs.getInt("mzpi")%>" placeholder="max. indivisual participation in Techvyom" required min="1"/>
    <BR><h6>Max group Event for Aamod :</h6> <input type="number" name="mapg" value="<%=rs.getInt("mapg")%>" placeholder="max.group participation in Aamod" required min="1"/>
    <BR><h6>Max Indivisual Event for Aamod :</h6> <input type="number" name="mapi" value="<%=rs.getInt("mapi")%>" placeholder="max. indivisual participation in Aamod" required min="1"/>
    <br><button type="submit" class="btn">
        <div class="icon-update"></div>
        update rule
    </button>
    <br>
    <br>
    <%
                } else {
                    out.println("no college rule added");
                }
            }
        } catch (Exception e) {
            out.print(e);
        } finally {
            boolean b = org.conn.close(con);
        }
    %>
</form>
${param.msg}