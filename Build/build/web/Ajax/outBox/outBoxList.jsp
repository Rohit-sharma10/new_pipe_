<%-- 
    Document   : outBoxList
    Created on : 17 Apr, 2016, 4:47:01 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<input type="hidden" value="${outboxList.size()}" id="hiddenSize"/>
<br/>
<table>
    <tr>
        <th>
            Name
        </th>
        <th>
            Age
        </th>
        <th>
            Action <input type="checkbox" id="selecctall" onclick="selectAll(this.id)"/> Select All
        </th>
    </tr>
    <s:iterator value="outBoxListNew" id="outBoxListNewId" var="outBoxListNewId">
        <tr>
            <td>
                   ${outBoxListNewId.name}
            </td>
            <td>
                 ${outBoxListNewId.age} Yrs
            </td>
            <td>
                 <input class = "chk" type="checkbox" value="${outBoxListNewId.contactId}" />
            </td>
        </tr>
    </s:iterator>
</table>

<%--<display:table name="outBoxListNew"   >
    <display:column  title="Name" >
     
    </display:column>
    <display:column  title="Age" >
       
    </display:column>
    <display:column  title="Action" >
       
    </display:column>

</display:table>--%>
<div class="buttonRightDiv">
    <input type="submit" class="btn btn-primary" value="One Way" onclick="return closeMoveToOutBox(1)"/>

    <input type="submit" class="btn btn-primary" value="Two Way" onclick="return closeMoveToOutBox(2)"/>
    <input type="submit" class="btn btn-primary" value="Other Way" onclick="return closeMoveToOutBox(5)"/>

    <button class="btn btn-primary" value="Short List" onclick="return closeMoveToOutBox(4)">Short List</button>
    <button class="btn btn-primary" value="Short List" onclick="return closeMoveToOutBox(3)">DELETE</button>

    <input type="hidden" name="contact.outBoxContactIds" id="outBoxContactIds">
</div>______
<%--<s:select  class="time"  listKey="templateId" 
                         listValue="templateName" list="templateList"  onchange="fetchTemplateData(this.value)"
                         headerKey="-1 " headerValue="---Select Template---">
</s:select>--%>
