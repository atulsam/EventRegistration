<form method="POST" action="changepasswordAction.jsp">
    <%
        String id = request.getParameter("user");
        String action = request.getParameter("action");
        if (id != null && action != null && action.equals("update")) {
    %>
    <input type="text" name="" readonly value="<%=id%>" /><br>
    <input type="hidden" name="username" value=<%=id%> />
    <input type="password" name="pass" placeholder="new password" /><br>
    <input type="password" name="pass1" placeholder="confirm password" />
    <input type="hidden" name="action" value="update" >
    <%    } else {
    %>
    <input type="text" name="username" placeholder="user name" required /><br>
    <h6>action :</h6> &nbsp;<label><input type="radio" name="action" value="delete"> delete</label>
    <label><input type="radio" name="action" value="update" checked="checked" > update </label>
        <%        }
        %>
    <br>
    <button type="submit" class="btn">
        <div class="icon-update"></div>
        submit
    </button>
</form>

