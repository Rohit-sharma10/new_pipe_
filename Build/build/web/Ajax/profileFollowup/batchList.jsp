<%@ taglib prefix="s" uri="/struts-tags" %>     
<select id="batchSelectBoxSent" onchange="displayprofileFollowupSentList(this.value)">
    <option value="0">Please Select Batch</option>
    <s:iterator id="batchListId" value="batchList">
        <option value="${batchListId.batchId}">B${batchListId.batchId} : ${batchListId.regDate}</option>
    </s:iterator>
</select>