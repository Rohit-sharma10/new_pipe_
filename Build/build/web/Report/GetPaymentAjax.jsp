<%-- 
    Document   : GetPaymentAjax
    Created on : 17 Nov, 2016, 2:14:16 PM
    Author     : OpenSpace
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<s:iterator value="paymentContentList" var="paymentContentList">--%>
<!--{paymentContentList}-->
<%--</s:iterator>--%>
<!--<div id="tabhistory" class="tab-pane fade">-->
    <!-- History table start-->
    <!--<div class="historyDiv">-->
        <table>
            <tr>            
                <th style="text-align: center;">Paid </th>
                <th style="text-align: center;">Received By</th>
                <th style="text-align: center;">Mode</th>
                <th style="text-align: center;">Date </th>
            </tr>
            <s:iterator value="paymentContentList" id="paymentContentListId" >
                <tr>                   
                    <td>${paymentContentListId.paid}</td>
                    <td>${paymentContentListId.receivedBy}</td>
                     <td>${paymentContentListId.paymentModeString}</td>
                    <td>${paymentContentListId.paymentDate}</td>
                </tr>
            </s:iterator>
        </table>


    <!--</div>-->
    <!-- History table ends-->
<!--</div>-->
