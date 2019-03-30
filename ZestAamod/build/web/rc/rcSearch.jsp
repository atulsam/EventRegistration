<%@include file="headercommon.jsp" %>
<%@include file="rcInfo.jsp" %>

<div style="padding-top: 4%;">
    <center>
        <div style="width: 18%">
            <form action="" method="get">
                <input type="text" name="text" placeholder="search"/>
                <input type="hidden" name="title" value="search" />
                <div style="text-align: left;">
                    <label><input type="radio" name="type" value="name" checked>&nbsp;Name</label>
                    <label><input type="radio" name="type" value="college1">&nbsp;College</label>
                    <label><input type="radio" name="type" value="rollno">&nbsp;Roll No</label>
                </div>
                <button type="submit" class="btn">
                    <div class="icon-search"></div>
                    search details
                </button>
            </form>
        </div>
    </center>
</div>
<div id="div_print" class="centered" >
<%@include file="rcSearchAction.jsp" %>
</div>
<%@include file="footerCommon.jsp" %>