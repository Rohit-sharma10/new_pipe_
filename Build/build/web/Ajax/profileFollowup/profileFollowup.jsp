<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  


<input type="hidden" id="profileFollowupcontactId"/>
<input type="hidden" id="profileFollowupmatchId"/>
<div class="formDATA followupWidthChange">
    <label> Main Status </label><br>
    <select id="mainStatusSelectBox" onchange="changeReasonSelectBox()">
        <option value="0">Please Select Main Status</option>
        <s:iterator id="mainStatusListId" value="mainStatusList">
            <option value="${mainStatusListId.mainStatusId}">${mainStatusListId.mainStatusName}</option>
        </s:iterator>
    </select>
</div>
<div class="formDATA followupWidthChange" id="reasonSelectBoxDivParent">
    <label>  Reason </label><br>
    <div id="reasonSelectBoxDiv">
        <select id="reasonSelectBox">
            <option value="0">Please Select Reason</option>
        </select>
    </div>
</div>
<div class="formDATA followupWidthChange" id="batchListDiv">
    <label>  Batch List </label><br>
    <div id="batchListSelectDiv">
        <select id="batchSelectBoxSent">
            <option value="0">Please Select Reason</option>
        </select>
    </div>
</div>
<div class="formDATA followupWidthChange" id="profileFollowupDateDiv">
    <label>Date</label><br>
    <div class="controlsData controlWidth">
        <input type="text" placeholder="Next Date" id="profileFollowupDate" class="form-control">

    </div>
</div>
<div class="formDATA followupWidthChange" id="profileFollowupDateDivFrom">
    <label>Date From</label><br>
    <div class="controlsData controlWidth">
        <input type="text" placeholder="Next Date" id="profileFollowupDateFrom" class="form-control">

    </div>
</div>
<div class="formDATA followupWidthChange" id="profileFollowupDateDivTo">
    <label>Date To</label><br>
    <div class="controlsData controlWidth">
        <input type="text" placeholder="Next Date" id="profileFollowupDateTo" class="form-control">

    </div>
</div>
<div class="formDATA followupWidthChange" id="profileFollowupTimeDiv">
    <label>Time</label><br>
    <div class="controlsData controlWidth">
        <input type="text" style="height: 30px !important;" class="form-control" name="timepicker3" id="profileFollowupTime">
    </div>
</div>
<div class="formDATA followupWidthChange" id="profileFollowupContactNumberDiv">
    <label>Contact Number</label><br>
    <div class="controlsData controlWidth">
        <textarea id="profileFollowupContactNumber">${contactNumber}</textarea>
    </div>
</div>
<div class="formDATA followupWidthChange remarkWidthChange" id="profileFollowupRemarkDiv">
    <label>Remark</label><br>
    <div class="controlsData controlWidth">
        <textarea id="profileFollowupRemark"></textarea>
    </div>
</div>

<div class="formDATA followupgo">
    <button class="btn btn-go" onclick="return saveProfileFollowup()" style="margin: 15px 0 0 !important;" id="profileFollowupRemarkSaveButton"> Save</button>
</div>
  <div class="formDATA followupgo">
        <button class="btn btn-go" onclick="return searchProfileFollowupBatchWise()" style="margin: 15px 0 0 !important;" id="profileFollowupRemarkSearchButton"> Search</button>
    </div>


<br/>
<div class="col-lg-12 no-pad" id="profileFollowupTable">
    <div class="followupheads">
        <div class="col-lg-2 followuphead headpadding">Main Status</div>

        <div class="col-lg-2 followuphead">Followup date</div>
        <div class="col-lg-2 followuphead">From-To</div>

        <div class="col-lg-2 followuphead">Number</div> 
        <div class="col-lg-2 followuphead">Remarks</div>

    </div>
    <s:iterator value="profileFollowupList" var="profileFollowup" id="profileFollowupListId" status="loop">
        <div class="followuprow">
            <div class="col-lg-2 headpadding">${profileFollowupListId.mainStatus}<br/>${profileFollowupListId.reason}(${profileFollowupListId.shortcode})</div>

            <div class="col-lg-2">${profileFollowupListId.followupDateString}</div>
            <div class="col-lg-2">${profileFollowupListId.contactName}-${profileFollowupListId.matchName}</div>
            <div class="col-lg-2">${profileFollowupListId.profilecontactNumber}</div>
            <div class="col-lg-2">${profileFollowupListId.remark}</div>
            <c:if test="${profileFollowupListId.mainStatusId!=7}">
                <div class="col-lg-1"><i class="fa fa-refresh iconMargin" onclick="editProfileFollowup(${profileFollowupListId.profileFollowupId})"></i></div>
                </c:if>
            <section id="editProfileFollowupDiv${profileFollowupListId.profileFollowupId}" style="float: left;" >

            </section>
        </div>

    </s:iterator>
</div>
<div  id="profileFollowupSentTable">

</div>

