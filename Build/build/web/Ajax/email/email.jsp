<%-- 
    Document   : email
    Created on : 23 Mar, 2016, 12:47:46 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<display:table name="emailList"  id="emailListId" >
    <display:column  title="Posted By" >
        ${emailListId.shortName}
    </display:column>
    <display:column  title="Count" >
        <a href="searchEmailList?linkFlag=1&contactId=${emailListId.linkContactId}">${emailListId.count}</a>
    </display:column>
    <display:column  title="Subject" >
        ${emailListId.subject}
    </display:column>
    <display:column  title="Date" >
        ${emailListId.scheduledDateString}
    </display:column>
</display:table>

