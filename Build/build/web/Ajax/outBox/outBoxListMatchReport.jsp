<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<br/>
<input type="hidden" id="emailRefHidden" value="${emailRef}" />
<input type="hidden" id="contactId"  />
<table>
    <tr>
        <th>
            Name
        </th>
        <th>
            Detail
        </th>
        <th>
            Action <input type="checkbox" id="selecctall" onclick="selectAll(this.id)"/> Select All
        </th>
    </tr>
    <s:iterator value="outBoxList" id="outBoxListNewId" var="outBoxListNewId">
        <tr>
            <td>
                ${outBoxListNewId.name}(${outBoxListNewId.profileId})
            </td>
            <td>
                ${outBoxListNewId.age} Yrs ${outBoxListNewId.heightString}
            </td>
            <td>
                <input class = "chk" type="checkbox" value="${outBoxListNewId.contactId}" />
            </td>
        </tr>
    </s:iterator>
</table>
<div class="loading" style="top: 50% !important;">
    <img src="../img/loader1.gif" id="loading"  style="display:none;">
</div>
<div class="buttonRightDiv">
    <input type="submit" class="btn btn-primary" value="One Way" onclick="return resendMailMatchReport(1)"/>
    <input type="submit" class="btn btn-primary" value="Two Way" onclick="return resendMailMatchReport(2)"/>
    <input type="submit" class="btn btn-primary" value="Other Way" onclick="return resendMailMatchReport(5)"/>
    <input type="hidden" name="contact.outBoxContactIds" id="outBoxContactIds">
</div>

