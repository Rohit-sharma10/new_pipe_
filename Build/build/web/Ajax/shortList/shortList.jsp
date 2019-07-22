<%-- 
    Document   : shortList
    Created on : 28 Mar, 2016, 6:30:45 PM
    Author     : OpenSpace004
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page isELIgnored="false" %>--%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="s" uri="/struts-tags" %>      
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/>
<!--<input type="checkbox" id="selecctall" onclick="selectAll(this.id)"/> Select All-->
<display:table name="shortList"  id="shortListId" >
    <display:column  title="Posted By" >
        ${shortListId.postedBy}
    </display:column>
    <display:column  title="Posted To" >
        <a href="getContactDetail?contactId=${shortListId.matchId}" style="color:black;">   ${shortListId.postedTo}</a>
    </display:column>
    <display:column  title="Posted For" >
        <a href="getContactDetail?contactId=${shortListId.contactId}" style="color:black;">    ${shortListId.postedFor}</a>
    </display:column>
    <display:column  title="Date" >
        ${shortListId.shortListDate}
    </display:column>
    <display:column title="Action<input type='checkbox' id='selecctall' onclick='selectAll(this.id)'> Select All">
        <input class="chk" type="checkbox" value="${shortListId.contactId}" />
    </display:column>
</display:table>
        
        
<c:choose>
    <c:when test="${(userSession.deptId==9) || (userSession.deptId==15) || (userSession.deptId==16) || (userSession.deptId==18)}">
        
    </c:when>
    <c:otherwise>
        <div class="buttonRightDiv">
            <input type="submit" class="btn btn-primary" value="One Way" onclick="return closeShortListBox(1)"/>

            <input type="submit" class="btn btn-primary" value="Two Way" onclick="return closeShortListBox(2)"/>
            <input type="submit" class="btn btn-primary" value="Other Way" onclick="return closeShortListBox(5)"/>

            <button class="btn btn-primary" value="Short List" onclick="return closeShortListBox(3)">DELETE</button>

            <input type="hidden" name="contact.outBoxContactIds" id="shortListedContactIds">
        </div>
    </c:otherwise>
</c:choose>


<%--<c:if test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16) && (userSession.deptId!=18)} ">--%>
<!--<div class="buttonRightDiv">
    <input type="submit" class="btn btn-primary" value="One Way" onclick="return closeShortListBox(1)"/>

    <input type="submit" class="btn btn-primary" value="Two Way" onclick="return closeShortListBox(2)"/>
    <input type="submit" class="btn btn-primary" value="Other Way" onclick="return closeShortListBox(5)"/>

    <button class="btn btn-primary" value="Short List" onclick="return closeShortListBox(3)">DELETE</button>

    <input type="hidden" name="contact.outBoxContactIds" id="shortListedContactIds">
</div>-->
<%--</c:if>--%> 
______${email}______
<%--<s:select  class="time"  listKey="templateId" 
                         listValue="templateName" list="templateList"  onchange="fetchTemplateData(this.value)"
                         headerKey="-1 " headerValue="---Select Template---">
</s:select>--%>