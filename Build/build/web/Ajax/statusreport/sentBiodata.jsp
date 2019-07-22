<%-- 
    Document   : sentBiodata
    Created on : 21 Apr, 2016, 5:52:08 PM
    Author     : OpenSpace004
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="commonTable tableBG tableTopmargin">                                         
    <tr>
        <th>Name</th>
        <th>DOB</th>
         <th>Height</th>
    </tr>
    <c:if test="${sentBioData.size()>0}">
      <b class="recordDisplay" >${sentBioData.size()} Record(s) Found</b>  
        <s:iterator value="sentBioData" var="sentBioDataId">
            <tr>
                <td>
                    <a href="getContactDetail?contactId=${sentBioDataId.contactId}" target="_blank" style="color: #000;">   ${sentBioDataId.name} </a>
                </td>
               
                <td>
                    ${sentBioDataId.dobString} / ${sentBioDataId.age} Years
                </td>
                 <td>
                    ${sentBioDataId.heightString} 
                </td>
            </tr>
        </s:iterator>
    </c:if>
    <c:if test="${sentBioData.size()==0}">
        <tr >
            <td colspan="3">
                Nothing found to display
            </td>
        </tr>
    </c:if>

</table>
