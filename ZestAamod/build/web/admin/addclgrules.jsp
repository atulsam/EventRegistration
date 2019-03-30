<form method="POST" action="addclgrulesAction.jsp">
    <label><input type="radio" value="CET" name="clgname"/> srms cet </label>
    <label><input type="radio" value="WCET" name="clgname"/> srms wcet </label>
    <label><input type="radio" value="IMS" name="clgname"/> srms ims </label>
    <label><input type="radio" value="Others" name="clgname"/> other college</label>
    <input type="text" name="clgname" placeholder="specific college" />
    <BR> <input type="number" name="mzp" placeholder="max. no of participation in Zest" min="0" required/>
    <BR> <input type="number" name="map" placeholder="max. no of participation in aamod" required min="0"/>
    <BR> <input type="number" name="mtp" placeholder="total participation" required min="0"/>
    <h6>Maximum No of Group Participation </h6>
    <BR> <input type="number" name="mzpg" placeholder="in Zest" required min="0" />
    <BR> <input type="number" name="mapg" placeholder="in Aamod" required min="0"/>
    <h6>Maximum No of indivisual  Participation </h6>
    <BR> <input type="number" name="mzpi" placeholder="in Zest" required min="0"/>
    <BR> <input type="number" name="mapi" placeholder="in Aamod" required min="0"/><br>
    
    <button class="btn" type="submit">
        <div class="icon-add"></div>
        add rule
    </button>
</form>