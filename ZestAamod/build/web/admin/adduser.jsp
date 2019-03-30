<form method="POST" action="addUserAction.jsp">
    <input type="text" name="username" placeholder="user name" required/><br>
    <input type="password" name="pass" placeholder="password" required/><br>
    <input type="password" name="pass1" placeholder="confirm password" required/><br>
    <h6>type :</h6>
    <label><input type="radio" name="type" value="admin" /> admin</label>
    <label> <input type="radio" name="type" value="jc"  /> judgement commitee</label>
    <label><input type="radio" name="type" value="rc" checked="checked" /> registration commitee</label>
    <button class="btn" type="submit">
        <div class="icon-add"></div>
        add user
    </button>
</form>