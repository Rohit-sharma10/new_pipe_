<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  


<div class="col-lg-12 no-pad" id="profileFollowupTable">
    <div class="followupheads">
        <div class="col-lg-2 followuphead headpadding">Main Status</div>

        <div class="col-lg-2 followuphead">Followup date</div>
        <div class="col-lg-3 followuphead">From-To</div>

        <div class="col-lg-2 followuphead">Number</div> 
        <div class="col-lg-3 followuphead">Remarks</div>

    </div>
    <s:iterator value="profileFollowupList" var="profileFollowup" id="profileFollowupListId" status="loop">
        <div class="followuprow">
            <div class="col-lg-2 headpadding">${profileFollowupListId.mainStatus}<br/>${profileFollowupListId.reason}(${profileFollowupListId.shortcode})</div>

            <div class="col-lg-2">${profileFollowupListId.followupDateString}</div>
            <div class="col-lg-3">${profileFollowupListId.contactName}-${profileFollowupListId.matchName}</div>
            <div class="col-lg-2">${profileFollowupListId.profilecontactNumber}</div>
            <div class="col-lg-3">${profileFollowupListId.remark}</div>
            <%--<c:if test="${profileFollowupListId.mainStatusId!=7}">--%>
                <!--<div class="col-lg-1"><i class="fa fa-refresh iconMargin" onclick="editProfileFollowup({profileFollowupListId.profileFollowupId})"></i></div>-->
                <%--</c:if>--%>
            <!--<section id="editProfileFollowupDiv${profileFollowupListId.profileFollowupId}" style="float: left;" >-->

            </section>
        </div>

    </s:iterator>
</div>