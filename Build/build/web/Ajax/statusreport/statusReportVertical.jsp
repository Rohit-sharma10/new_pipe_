<%-- 
    Document   : statusReportIndividual
    Created on : 15 Apr, 2016, 10:46:50 AM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<s:iterator value="statusListIndividual" var="statusReport">
<!-- s:if added by vineet to check all moved flag status for different backgrpound colors-->
    <s:if test="%{#statusReport.movedFlag==1}">
        <div style="background:rgba(118, 203, 42, 0.65)">
        </s:if>
        <s:if test="%{#statusReport.movedFlag==2}">
            <div style="background:rgba(255, 223, 223, 0.65)">
            </s:if>
            <s:if test="%{#statusReport.movedFlag==3}">
                <div style="background:rgba(192, 192, 192, 0.65)">
                </s:if>
                <s:if test="%{#statusReport.movedFlag==0}">
                    <div>
                    </s:if>

                    <div class="reportProfileDIV">
                        <a class="tableName" target="_blank" href="getContactDetail?contactId=${statusReport.matchId}"> 
                            <div class="imageReportProfile">
<!--                                <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${statusReport.image1}" style="width: 55px;height: 55px;" class="img-circle" /> -->
                                <img src="${profileimgPath}${statusReport.image1}" style="width: 55px;height: 55px;" class="img-circle" /> 

                            </div>
                        </a>
                        <div class="reportProfileName">
                            <a data-toggle="tab"    href="#displayContactVertical" onclick="displayContactDetails1(${statusReport.contactId1})" > 
                                ${statusReport.firstname}</a>
                                <s:if test="%{!#statusReport.pdfPresentationFile.equals('') || #statusReport.pdfPresentationFile!=null}">
                                <span class="pdficon">
<!--                                    <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                                    <a target="_blank" href="${pdfpresentationPath}${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
                                </span>
                                </s:if>
                        </div>
                    </div>
                    <table class="reportLeftTable" id="tblData">
                        <tr>
                            <td width="100">
                                <!--<input type="submit" class="btn btn-yellowLight" value="Match" name=""/>-->
                                <div class="profileImgBottom">
                                    <div class="reportStatusDiv1">
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>  
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='M'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">
                                            <a href="#!" ><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                            <a href="#!" ><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividualForGrid(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividualForGridView" /></a>
                                            </c:if>

                                    </div>
                                </div>
                            </td>
                            <td width="90">DOB</td>
                            <td>${statusReport.dobString}, (${statusReport.age})</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>Height</td>
                            <td> ${statusReport.heightFeet}</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td> Education</td>
                            <td> ${statusReport.education}</td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                            <td> City</td>
                            <td> ${statusReport.cityName}</td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                            <td> Community</td>
                            <td>${statusReport.community}</td>
                        </tr>
                        <tr>
                            <!-- <td>
                                <div class="reportStatusDiv">
                                                 <img src="../img/icons/boyGreenIcon.png" /> 
                                                     <img src="../img/icons/connectArrow.png"/>
                                                     <img src="../img/icons/girlGreenIcon.png"/>
                                 </div>
                             </td>-->
                            <td colspan="3">
                                <a data-toggle="tab" href="#emailListIndividual" class="profileAction emaiAction" title="Email" onclick="emailIndividual(${statusReport.contactId1})"></a>
                                <a data-toggle="tab" href="#armFollowup" class="reportAction followreportAction" title="Follow-up" onclick="profileFollowup(${statusReport.contactId1},${statusReport.contactId})"></a>
                                <a  data-toggle="tab"  href="#additionalInfoListVertical" class="reportAction feedbackreportAction"  title="Additional Information"  onclick="additionalInfoListVertical(${statusReport.contactId1})" ></a>
                                <!--<a data-toggle="tab" href="#followupStatusIndividual" class="reportAction followreportAction" title="Follow-up" onclick="followUpIndividual({statusReport.contactId1})"></a>-->
                                <!--<a data-toggle="tab" href="#feedbackStatusIndividual" class="reportAction feedbackreportAction"  title="Feedback" onclick="feedbackIndividual({statusReport.contactId1})"></a>-->
                                <a data-toggle="tab" href="#statusReportIndividualVertical" class="reportActionDivstatus statusReport" title="Status report" onclick="statusReportIndividualVertical(${statusReport.contactId1})"></a>
                                <!--<a data-toggle="tab" href="#kundaliReport" class="reportActionDivstatus horoscopeReport" title="kundali" > </a>-->                                          
                                <!--<a data-toggle="tab" class="outboxAction moveoutboxAction" title="move to outbox" >   </a>--> 
                                <a data-toggle="tab" href="#profileActivityIndividualVertical" class="reportActionDivstatus actlogAction" title="Activity log" onclick="fetchActivityLogVertical(${statusReport.contactId1})">   </a>
                                <a data-toggle="tab" href="#kundaliVertical" class="reportActionDivstatus kundaliAction" title="Kundali" onclick="getContactInfoKundaliVertical(${statusReport.contactId},${statusReport.contactId1})">   </a>

                                <a href="#!" class="estatus estatusAction" title="Email Status" data-toggle="modal" data-target="#emailStatus" onclick="emailStatus(${statusReport.contactId},${statusReport.contactId1},${statusReport.stid})"></a>
                                <c:if test="${statusReport.movedFlag==0}">
                                <c:if test="${statusReport.freshCallFlag==0}">
                                    <a href="#!" class="freshIcon freshIconAction" title="Fresh" ></a>
                                </c:if></c:if>
                                <s:if test="%{#statusReport.pauseFlag>0}">
                                    <a href="#!" class="pausedIcon freshIconAction" title="Paused" ></a>
                                </s:if>                     
                                <s:if test="%{#statusReport.lockFlag>0}">
                                    <a href="#!" class="holdIcon freshIconAction" title="Hold" ></a>
                                </s:if>

                            </td>
                        </tr>

                    </table>
                </div>
            </s:iterator>
