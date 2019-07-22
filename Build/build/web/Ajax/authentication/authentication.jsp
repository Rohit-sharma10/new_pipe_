<%-- 
    Document   : authentication
    Created on : 15 Mar, 2016, 4:56:14 PM
    Author     : OpenSpace004
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<s:set name="theme" value="'simple'" scope="page" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr>
    <td>
        Office
    </td>
    <td>

        <select  class="select_box"  value="contact.officeId" name="contact.officeId" id="officeId" onchange="changeUser(this.value)">
            <option  value="0">---Select Office---</option>
            <s:iterator value="officeList" id="officeListId">
                <option value="${officeListId.officeId}">${officeListId.officeName}</option>
            </s:iterator>                                                            
        </select>
    </td>
    <td>
        <input type="hidden" value="${contact.armId}" id="armIdHidden"/>
        <input type="hidden" value="${contact.officeId}" id="officeIdHidden"/>
        <input type="hidden" value="${contact.contactId}" id="aContactId"/>
        <input type="hidden" value="${contact.userId}" id="auserIdHidden"/>
        <select  tabindex="9"  id="auserId"  name="contact.userId" onchange="changeArm(this.value)" style="display:inline-block;">
            <option  value="0">---Select RM---</option>
            <s:iterator value="userList" id="userListId">
                <%--<c:if test="${userListId.deptId==8}">--%>
                <option value="${userListId.userId}">${userListId.name}</option>
                <%--</c:if>--%>
            </s:iterator>   
        </select>



    </td>
    <td>
        <select  tabindex="9"  id="armId"   style="display:inline-block;" >
            <option value="0">---Select ARM---</option>
            <s:iterator value="armList" id="armListId">
                <option value="${armListId.userId}">${armListId.name}</option>
            </s:iterator>
        </select>
    </td>

</tr>
<tr>
    <td>Category</td>

    <td colspan="3">
        <input type="hidden" value="${contact.categoryId}" id="categoryIdHidden"/>
        <select  class="select_box"   value="contact.categoryId" name="contact.categoryId" id="acategoryId">
            <option class="messageCheckbox" value="">---Select Category---</option>
            <s:iterator value="categoryList" id="categoryListId">
                <option class="messageCheckbox" value="${categoryListId.categoryId}">${categoryListId.categoryName}</option>
            </s:iterator>                                                            
        </select>

    </td>
    <!--    <td>
            <div class="controlsData"><input type="text"  id="categoryNumber" name="contact.categoryNumber" value="${contact.categoryNumber}"/></div>
        </td>-->

</tr>

<tr id="checkBoxCategoryId">
    <td>
        Category Permission 
    </td>
    <td colspan="3" id="catTd">
        <input type="hidden" value="${contact.categoryPermissionString}" id="categoryPermissionString"/>

        <s:iterator value="categoryPermissionList" id="categoryPermissionListId">
            <input type="checkbox"  id="${categoryPermissionListId.categoryId}" value="${categoryPermissionListId.categoryId}" onclick="check(this.id)"> ${categoryPermissionListId.categoryName}</input>
        </s:iterator> 
    </td>
</tr>   

<!--New tr added by vineet on 02-12-2016 for new fields-->
<tr>
    <td>Package</td>
    <td colspan="3">


        <s:select headerKey="0" headerValue="--- Select Package ---" class="select_box" id="packageId" onchange="fetchPackagePrice(this.value)"
                  list="packageList" listKey="packageId"  listValue="packageName" 
                  name="contact.packageId"  value="contact.packageId" /> 

<!--        <select  class="select_box"   value="contact.packageId" name="contact.packageId" id="packageId" onchange="fetchPackagePrice(this.value)">
            <option class="messageCheckbox" value="0">---Select Package---</option>
            <%--<s:iterator value="packageList" id="packageListId">--%>
                <option class="messageCheckbox" value="${packageListId.packageId}">${packageListId.packageName}</option>
            <%--</s:iterator>--%>                                                            
        </select>  -->
    </td>
    <!--<td colspan="2">-->
<input type="hidden" value="${contact.packagePrice}" name="contact.packagePrice" id="packagepriceId" />
<!--</td>-->
<!--upper line commented by vineet on 6-12-2016 because they dont want-->
</tr>



<tr>
    <td colspan="4">
        <input type="checkbox" class="checkbox_checkRmArmAssign"/>  Send Mail
    </td>

</tr>
<!--<tr>
    <td>
       Contract End Date
    </td>
    <td colspan="3">
        <div class="controlsData"><input type="text" readonly="true"  name="contact.expiryString" value="{contact.expiryString}"/></div>
    </td>
</tr>-->
<!--<tr>
    <td colspan="4">
        
    </td>
</tr>-->

