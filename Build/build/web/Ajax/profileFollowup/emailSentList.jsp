<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="col-lg-12 no-pad" id="profileFollowupTable">
    <div class="followupheads">
        <div class="checkboxDiv"></div>
        <div class="col-lg-4 followuphead headpadding paddingChange">Name</div>
        <div class="col-lg-3 followuphead paddingChange">Age</div>
        <div class="col-lg-2 followuphead paddingChange">Contact</div>
        <div class="col-lg-2 followuphead paddingChange">Community</div> 


    </div>
    <s:iterator id="emailSentListId" value="emailSentList">  
        <div class="followuprow">

            <div class="checkboxDiv"><input checked="true" type="checkbox" class="chkBoxFollowup" name="vehicle" value="${emailSentListId.matchId}"></div>
            <div class="col-lg-4">  ${emailSentListId.name}</div>
            <div class="col-lg-3">${emailSentListId.age} </div>
            <div class="col-lg-2">9892740214 </div>
            <div class="col-lg-2">${emailSentListId.community} </div>

        </div>

    </s:iterator>
    <div class="formDATA text-center saveBottomCenter">
        <button class="btn btn-go" onclick="return saveProfileFollowupBatchWise()" style="margin: 15px 0 0 !important;" id="profileFollowupBatchSaveButton"> Save Batch</button>
    </div>
</div>