<section id="content">
    <article>
        <div id="box">
            
           <div class="a3 fall bigger" style="left:30px;">Zest & Aamod 2015</div>
           
            <div class="a3 slide bigger" style="top:110px;">Zest & Aamod 2015</div>
            <div class="a4 crazy" style="top:350px;">Zest & Aamod 2015</div>
        </div>
    </article>
</section>
<div style="float: right;width: 225px;">
    <div style="padding-right: 20%;padding-top: 80%;">
        <form action="" method="post">
            <input accesskey="l" type="text" name="id" placeholder="user id" required /><br>
            <input type="password" name="pass" placeholder="password" required /><br>
            <button type="submit" class="btn"><div class="icon-time"></div> sign in </button>
        </form>
    </div>
    <%
        if (session != null && session.getAttribute("msg") != null && session.getAttribute("msg") != "") {
            out.println("<div class='alert'>" + session.getAttribute("msg") + "</div>");
            session.setAttribute("msg", "");
        }
    %>
</div>