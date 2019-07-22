<%@ taglib prefix="s" uri="/struts-tags" %>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table>
    <s:iterator value="remarkList" id="remarkListId" var="remarkListVar">
        <tr>
            <td>
                ${remarkListVar.remark}
            </td>
        </tr>
    </s:iterator>
</table>