<%@ taglib prefix="s" uri="/struts-tags" %> 
<option  value="0">---Select ARM---</option>
<s:iterator value="armList" id="armListId">
    <option value="${armListId.userId}">${armListId.name}</option>
</s:iterator>