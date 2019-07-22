<%-- 
    Document   : statusReportIndividual
    Created on : 23 Nov, 2016, 16:46:50 
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<table class="commonTable tableBG " id="statusListIndividualTable" style="width: 100%;">    
  
    <tr>   
        
        <th style="width:21%; text-align: center" >Check All<br><center> <input type="checkbox"  id="select_all" onfocus="return checkAll();"></center></th>
<th style="width:79%">TransFer Profile </th>
      <span  ><h5 style="width: 100%; color: red; text-align: center">${profileMessage}</h5></span>
  
    </tr>
    <tr>
        <!--<td colspan="8" style="padding: 0" >-->
            <table class="commonTableInner"  >          
                <s:set var="flag" value="0"/>
                <s:iterator value="transferProfileList" var="transferProfile" >
                    <tr>
                        <td><center><input type="checkbox" name="masterBean.contactIds" id="selectedProfile" value="${transferProfile.contactId}" class="boxToCheck" onfocus="return reverseCheck();"></center></td>
                    <td>${transferProfile.fullContactName}</td>
                    </tr>
                </s:iterator>

            </table>
        <!--</td>-->
    </tr>

</table>__ <s:select headerKey="0" headerValue="--- SELECT TO ARM (Receive) ---" cssClass="input_box" id="toArm"
                                                      list="ajaxArmList" listKey="userId"  listValue="userName" 
                                                      name="masterBean.toArmId" value="%{masterBean.toArmId}"/>  

