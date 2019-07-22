<%-- 
    Document   : close
    Created on : 30 Mar, 2016, 11:45:43 AM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="addfollowup addfollowupbg">
    <h3 class="popupheads">Close Followup </h3>
    <div class="formDATA controlWidth">
        <label>Content*</label><br/>
        <div class="controlsData controlWidth">
            <input type="hidden" id="iccontactId" value="<%=request.getParameter("contactId")%>"/>
            <input type="hidden" id="icfollowupId" value="<%=request.getParameter("followupId")%>"/>
            <input type="text" id="icloseFollowupContent" class="closeinputwidth"/>
            <div class="followupgo">
                <input type="submit"  onclick="return closeFollowupIndividual()" value="Go" class="btn btn-go">
            </div>
        </div>
    </div>
</div>
