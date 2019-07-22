<%-- 
    Document   : statusReportIndividual
    Created on : 15 Apr, 2016, 10:46:50 AM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:if test="${matchList.size()==0}">
    Searched contact is either locked,pause or does not match search criteria. 
</c:if>
<c:if test="${matchList.size()>=0}">
    <input type="hidden" id="ListMatchRecords" value="${matchList.size()} Records found">
    <!--<b class="recordDisplay" id="matchHeaderListSize">${matchList.size()} Records found</b>-->
</c:if>
<table class="commonTable tableBG" id="statusListIndividualTable">    

    <tr>
        <th style="width: 25%">Name</th>
        <!--<th>ID</th>-->
        <th style="width: 15%">DOB</th>
        <th style="width: 11%">Height</th>
        <th style="width: 11%">Education</th>
        <th style="width: 10%">City</th>
        <th style="width: 15%">Gotra</th>
        <th style="width: 16%" colspan="2">Actions</th>
        <!--<th  style="width: 5%">PDF</th>-->

    </tr>
    <tr>
        <td colspan="8" style="padding: 0" >
            <table class="commonTableInner" cellspacing="10">
                <s:iterator value="matchList" var="matchListId" status="loop" >

                    <tr style="background: ${matchListId.bc}">
                        <td style="width:25%">
                            <c:if test="${matchListId.movedFlag>0}">

                                <div style="position:absolute; width:98%; height:60px;z-index: 11; ">
                                    <div style="text-align: center; height: 100%;padding: 12px 0 0 0;background-color:rgba(255, 223, 223, 0.65)">  Lost Opportunity Profile</div>

                                </div>
                            </c:if>
                            <div class="imageReportProfile">
<!--                                <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${matchListId.image1}" style="width: 55px;height: 55px;" class="img-circle" />-->
                                <img src="${profileimgPath}${matchListId.image1}" style="width: 55px;height: 55px;" class="img-circle" />
                            </div>
                            <a class="tableName" target="_blank" href="getContactDetail?contactId=${matchListId.contactId}">${matchListId.firstName} <br>
                                ${matchListId.category}${matchListId.profileId}(${matchListId.shortName})${matchListId.assignedToArm}</a></td>
                        <td style="width: 15%">${matchListId.dobString},(${matchListId.age})</td>
                        <td style="width: 11%"> ${matchListId.heightString}</td>
                        <td style="width: 11%"> ${matchListId.education}</td>
                        <td style="width: 10%"> ${matchListId.cityName}</td>
                        <td style="width: 15%">${matchListId.gotra}</td>
                        <td style="width: 16%" colspan="2">
                            <a data-toggle="tab" class="outboxAction moveoutboxAction iconinLine" id="movetooutboxx${loop.index}"   title="Move to outbox" onclick="moveToOutBox(${matchListId.contactId});moveToOutBoxColor(this.id)">   </a>
                            <a data-toggle="tab" class="reportActionDivstatus kundaliAction iconinLine" title="Kundali" onclick="matchreportKundali(${matchListId.contactId})">   </a>

                            <span class="pdficon iconinLine" style="margin-top:3px">
<!--                                <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${matchListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                                <a target="_blank" href="${pdfpresentationPath}${matchListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
                            </span></td>
                    </tr>
                </s:iterator>
            </table>
        </td>
    </tr>

</table>

