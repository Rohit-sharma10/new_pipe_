<%@ taglib prefix="s" uri="/struts-tags" %>  
<input type="hidden" id="mainStatusIdHidden" value="${profileFollowup.mainStatusId}">
<input type="hidden" id="reasonIdHidden"  value="${profileFollowup.reasonId}">
<input type="hidden" id="profileFollowupIdHidden"  value="${profileFollowup.profileFollowupId}">
<div class="formDATA followupWidthChange" >
    <label> Main Status </label><br>
    <select id="emainStatusSelectBox" onchange="changeReasonSelectBox1()">
        <option value="0">Please Select Main Status</option>
        <s:iterator id="mainStatusListId" value="mainStatusList">
            <option ${profileFollowup.mainStatusId==mainStatusListId.mainStatusId?'selected':''} value="${mainStatusListId.mainStatusId}">${mainStatusListId.mainStatusName}</option>
        </s:iterator>
    </select>
</div>

<div class="formDATA followupWidthChange">
    <label>  Reason </label><br>
    <div id="ereasonSelectBoxDiv">
        <select id="ereasonSelectBox">
            <option value="0">Please Select Reason</option>
            <s:iterator id="reasonListId" value="reasonList">
                <option ${profileFollowup.reasonId==reasonListId.reasonId?'selected':''} value="${reasonListId.reasonId}">${reasonListId.reason}</option>
            </s:iterator>
        </select>
    </div>
</div>
<div class="formDATA followupWidthChange">
    <label>Date</label><br>
    <div class="controlsData controlWidth">
        <input type="text" placeholder="Next Date" id="eprofileFollowupDate" class="form-control">

    </div>
</div>
<div class="formDATA followupWidthChange">
    <label>Time</label><br>
    <div class="controlsData controlWidth">
        <input type="text" style="height: 30px !important;" class="form-control" name="timepicker3" id="eprofileFollowupTime">
    </div>
</div>
<div class="formDATA followupWidthChange remarkWidth2">
    <label>Contact Number</label><br>
    <div class="controlsData controlWidth">
        <textarea id="eprofileFollowupContactNumber" >${profileFollowup.profilecontactNumber}</textarea>
    </div>
</div>
<div class="formDATA followupWidthChange remarkWidth2">
    <label>Remark</label><br>
    <div class="controlsData controlWidth">
        <textarea id="eprofileFollowupRemark" >${profileFollowup.remark}</textarea>
    </div>
</div>
<div class="formDATA followupgo">
    <button class="btn btn-go" onclick="return updateProfileFollowup()" style="margin: 15px 0 0 !important;width: ">Update</button>
</div>
