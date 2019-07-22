<%@ taglib prefix="s" uri="/struts-tags" %>   
<option  value="0">---Select RM---</option>
<s:iterator value="userList" id="userListId">
    <c:if test="${(userListId.deptId==8) || (userListId.deptId==12) || (userListId.deptId==13) || (userListId.deptId==14)  || (userListId.deptId==17)}"> <!--Conditions Added by vineet on 24-11-2016 -->
        <option value="${userListId.userId}">${userListId.name}</option>
    </c:if>
</s:iterator>   