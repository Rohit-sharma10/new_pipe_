<%@ taglib prefix="s" uri="/struts-tags" %>     
<select id="reasonSelectBox">
    <option value="0">Please Select Reason</option>
    <s:iterator id="reasonListId" value="reasonList">
        <option value="${reasonListId.reasonId}">${reasonListId.reason}</option>
    </s:iterator>
</select>