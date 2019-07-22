<%-- 
    Document   : all
    Created on : 3 May, 2016, 3:51:03 PM
    Author     : OpenSpace004
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
    <c:if test="${auditTrailList.size()>0}"> 
        <s:iterator value="auditTrailList" var="auditTrail" >
            <tr>
                <td>
                    ${auditTrail.remark}
                </td>
            </tr>
        </s:iterator>
    </c:if>
    <c:if test="${auditTrailList.size()==0}"> 
       Nothing found to display
    </c:if>

</table>
