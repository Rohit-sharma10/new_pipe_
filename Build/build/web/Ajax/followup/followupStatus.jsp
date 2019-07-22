<%-- 
    Document   : followup
    Created on : 25 Mar, 2016, 2:39:11 PM
    Author     : OpenSpace004
--%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  

<div class="col-lg-12 no-pad" id="ifollowupListIdTable">
    <div class="followupheads">
    <div class="col-lg-2 followuphead headpadding">Posted By</div>
    <div class="col-lg-2 followuphead">Topic</div>
    <div class="col-lg-3 followuphead">Date</div>
    <div class="col-lg-3 followuphead">Next date</div>
    <div class="col-lg-2 followuphead">Actions</div>
    </div>
    <s:iterator value="followupList" id="followupListId" >
        <div class="followuprow">
        <div class="col-lg-2 headpadding">${followupListId.shortName}</div>
        <div class="col-lg-2">${followupListId.projectName}</div>
        <div class="col-lg-3">${followupListId.fdate}</div>
        <div class="col-lg-3">${followupListId.nextDate}</div>
        <div class="col-lg-2"><i class="fa fa-edit iconMargin" title="${followupListId.content}"></i>
            <i class="fa fa-refresh iconMargin" title="${followupListId.content}" href="#statusReschedule" title="reschedule" onclick="rescheduleFollowupIndividual(${followupListId.followupId})"></i>
            <i class="fa fa-trash-o iconMargin" title="close" onclick="showCloseFollowupIndividual(${followupListId.followupId},${followupListId.contactId})"></i>
        </div>
        </div>
        <div class="col-lg-12 no-pad" id="irescheduleSectiontr${followupListId.followupId}">
            <div id="irescheduleSectiontd${followupListId.followupId}">
                <section id="irescheduleSection${followupListId.followupId}">

                </section>
            </div>

        </div>

    </s:iterator>

</div>

<!--<table name="followupList"  id="followupListIdTable">

    <tr>
        <th>Posted By</th>
        <th>Topic</th>
        <th>Date</th>
        <th>Next date</th>
        <th>Actions</th>
    </tr>
    <%--<s:iterator value="followupList" id="followupListId" >--%>
        <tr>
            <td> {followupListId.shortName}</td>
            <td> {followupListId.projectName}</td>
            <td> {followupListId.fdate}</td>
            <td>{followupListId.nextDate}</td>
            <td> <i class="fa fa-edit iconMargin" title="{followupListId.content}"></i>
                <i class="fa fa-refresh iconMargin" title="{followupListId.content}" href="#statusReschedule" title="reschedule" onclick="rescheduleFollowup({followupListId.followupId})"></i>
                <i class="fa fa-trash-o iconMargin" title="close" onclick="showCloseFollowup({followupListId.followupId},{followupListId.contactId})"></i></td>
        </tr>       
        <tr id="rescheduleSectiontr{followupListId.followupId}" style="display:none;">
            <td colspan="5" id="rescheduleSectiontd{followupListId.followupId}">
                <section id="rescheduleSection{followupListId.followupId}">

                </section>
            </td>
        </tr>

    <%--</s:iterator>--%>

</table>-->

<%--<display:table name="followupList"  id="followupListId" >
    <display:column  title="Posted By" >
        ${followupListId.shortName}
    </display:column>
    <display:column  title="Topic" >
        ${followupListId.projectName}
    </display:column>
    <display:column  title="Date" >
        ${followupListId.fdate}
    </display:column>
    <display:column  title="Next Date" >
        ${followupListId.nextDate}
    </display:column>
    <display:column  title="Action" >
        <i class="fa fa-edit iconMargin" title="${followupListId.content}"></i>
        <i class="fa fa-refresh iconMargin" title="${followupListId.content}" href="#statusReschedule" title="reschedule" onclick="rescheduleFollowup(${followupListId.followupId})"></i>
        <i class="fa fa-trash-o iconMargin" title="close" onclick="showCloseFollowup(${followupListId.followupId},${followupListId.contactId})"></i>
<!--        <img src="../img/icons/detailIcon.png" title="${followupListId.content}" >-->
        <c:if test="${followupListId.startend!='End'}">
<!--            <img src="../img/icons/reschedule.png" href="#statusReschedule" title="reschedule" onclick="rescheduleFollowup(${followupListId.followupId})">-->
        </c:if>
        <c:if test="${followupListId.startend!='End'}">
<!--            <img src="../img/icons/closeIcon.png"  title="close" onclick="showCloseFollowup(${followupListId.followupId},${followupListId.contactId})">-->
        </c:if>
    </display:column>

</display:table>--%>