<%-- 
    Document   : statusReportIndividual
    Created on : 15 Apr, 2016, 10:46:50 AM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<table class="commonTable tableBG" id="statusListIndividualTable">    
    <b>Total Biodata :: Received:${receivedSize}  Sent:${sentSize}</b>
    <tr>
        <th style="width: 20%">Name</th>
        <!--<th>ID</th>-->
        <th>Email Status</th>
        <th>Profile Exchange</th>
        <th>Match Status</th>
        <th>Meeting Status</th>
        <th>Final Status</th>
        <th>Priority</th>
        <th>Exchange</th>
    </tr>
    <tr>
        <td colspan="8" style="padding: 0" >
            <table class="commonTableInner" cellspacing="10">
                <s:set var="flag" value="0"/>
                <s:iterator value="statusListIndividual" var="statusReport" >

                    <s:if test="%{#flag==0 || #flag!=#statusReport.typeOfMatch}">
                        <s:if test="%{#statusReport.typeOfMatch!=2}">
                            <s:set var="flag" value="1"/>
                            <tr style="background-color:#E9F1F5">
                                <td style="width:20%;"><b>Received biodata(s)</b></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>

                            </tr>
                        </s:if> 
                    </s:if>
                    <s:if test="%{#statusReport.typeOfMatch==2}">

                        <s:if test="%{#flag!=2}">
                            <s:set var="flag" value="2"/>
                            <tr style="background-color:#E9F1F5">
                                <td style="width:20%;"><b>Sent biodata(s) </b></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>

                            </tr>

                        </s:if>
                    </s:if>
                    <s:if test="%{#statusReport.movedFlag==1}">
                        <tr  style="position:relative; height: 69px;">
                        </s:if>
                        <s:else>
                        <tr>
                        </s:else>

                        <td style="width: 20%;">
                            <s:if test="%{#statusReport.movedFlag==1}">

                                <div style="position:absolute; width:98%; height:60px;z-index: 11; ">
                                    <div style="text-align: center; height: 100%;padding: 12px 0 0 0;background-color:rgba(118, 203, 42, 0.65)">  Success</div>

                                </div>
                            </s:if>
                            <s:if test="%{#statusReport.movedFlag==2}">

                                <div style="position:absolute; width:98%; height:60px;z-index: 11; ">
                                    <div style="text-align: center; height: 100%;padding: 12px 0 0 0;background-color:rgba(255, 223, 223, 0.65)"> Lost Opportunity Profile</div>

                                </div>
                            </s:if>
                            <s:if test="%{#statusReport.movedFlag==3}">

                                <div style="position:absolute; width:98%; height:60px;z-index: 11; ">
                                    <div style="text-align: center; height: 100%;padding: 12px 0 0 0;background-color:rgba(192, 192, 192, 0.65)"> Delete</div>

                                </div>
                            </s:if>
                            <a class="tableName" target="_blank" href="getContactDetail?contactId=${statusReport.matchId}">${statusReport.firstname}${statusReport.middlename}  </a> <br/>

                            <s:if test="%{!#statusReport.pdfPresentationFile.equals('') || #statusReport.pdfPresentationFile!=null}">
                                <span class="pdficon">
<!--                                    <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                                    <a target="_blank" href="${pdfpresentationPath}${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
                                </span> 
                                </s:if> 
                                <c:if test="${statusReport.movedFlag==0}">
                                <a  href="#!" data-toggle="modal" data-target="#additionalInfoListIndividual" class="reportAction feedbackreportAction displayInline"  title="Additional Information" onclick="additionalInfoListIndividual(${statusReport.matchId})"></a>
                            </c:if>
                            <c:if test="${statusReport.movedFlag==0}">
                            <c:if test="${statusReport.freshCallFlag==0 && (statusReport.st1!=2 && statusReport.st2!=2 && statusReport.fst!=2 && statusReport.st3!=2 && statusReport.st4!=2)}">
<!--                                  <img src="${pageContext.request.contextPath}/img/Fresh_2.png" title="Fresh Call"/>-->
                                <a href="#!" class="freshIcon freshIconAction displayInline marginChange" title="Fresh" ></a>
                            </c:if>
                            </c:if>
                            <s:if test="%{#statusReport.pauseFlag>0}">
                                    <a href="#!" class="pausedIcon freshIconAction displayInline marginChange" title="Paused" ></a>
                                </s:if>                     
                                <s:if test="%{#statusReport.lockFlag>0}">
                                     <a href="#!" class="holdIcon freshIconAction displayInline marginChange" title="Hold" ></a>
                                </s:if>
                               

                        </td>

                        <td>

                            <a href="#!" data-toggle="modal" data-target="#emailStatus" onclick="emailStatus(${statusReport.contactId},${statusReport.matchId},${statusReport.stid})"><img src="../img/icons/emailstatus.png" title="Email Status"/></a>
                        </td>
                        <td>
                            <c:if test="${statusReport.emailType==2}">
                                <a href="#" data-toggle="modal" data-target="#exchange" onclick="profileExchangeData(${statusReport.contactId},${statusReport.matchId}, 2)" ><img src="../img/icons/nonActiveArrow.png" title="twoway"/></a>
                                </c:if>

                            <c:if test="${statusReport.emailType==1}">
                                <a href="#" data-toggle="modal" data-target="#exchange" onclick="profileExchangeData(${statusReport.contactId},${statusReport.matchId}, 1)"><img src="../img/icons/boyActiveArrow.png" title="oneway"/></a>
                                </c:if>
                        </td>
                        <td>
                            <c:if test="${statusReport.matchDate==null}"> 
                                <div class="reportStatusDiv">
                                    <c:if test="${statusReport.emailType==1}">
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>

                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='M'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}" >
                                            <a href="#!" ><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                            <a href="#!" ><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${statusReport.emailType==2}">
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">

                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='M' }">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st1', ${statusReport.contactId},${statusReport.mid}, 0, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st2', ${statusReport.contactId},${statusReport.mid}, 1, 0);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                            </c:if>
                                        </c:if>


                                </div>
                            </c:if>
                            <c:if test="${statusReport.matchDate!=null}"> 
                                <div class="reportStatusDiv">
                                    <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>

                                </div>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${statusReport.matchDate!=null}">
                                <div class="reportStatusDiv">

                                    <c:if test="${statusReport.st3==0 && statusReport.gender=='M'}">
                                        <a href="#" title="Pending"><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st3', ${statusReport.contactId},${statusReport.mid}, 0, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==0 && statusReport.gender=='F'}">
                                        <a href="#" title="Pending"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st3', ${statusReport.contactId},${statusReport.mid}, 0, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='M'}">
                                        <a href="#" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='F'}">
                                        <a href="#" title="Accept"><img src="../img/icons/girlGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='M'}">
                                        <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='F'}">
                                        <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='M'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/boyBlueIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st3', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='F'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/girlBlueIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st3', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='M'}">
                                        <a href="#" title="Pending"><img src="../img/icons/boyYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st4', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='F'}">
                                        <a href="#" title="Pending"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st4', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='M'}">
                                        <a href="#" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='F'}">
                                        <a href="#" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='M'}">
                                        <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='F'}">
                                        <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>

                                    <c:if test="${statusReport.st4==3 && statusReport.gender=='M'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/boyBlueIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st4', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==3 && statusReport.gender1=='F'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/girlBlueIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_st4', ${statusReport.contactId},${statusReport.mid}, 1, 2);" data-toggle="modal" data-target="#myModalIndividual" /></a>
                                        </c:if>

                                </div>
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate==null}">                 
                                <a href="#" data-toggle="modal" data-target="#myModal1Individual" onclick="saveScheduleMeetingIdsIndividual(${statusReport.stid},${statusReport.contactId},${statusReport.matchId})"> 
                                    Schedule meeting date
                                </a>                              
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate!=null}">   
                                <a href="#" data-toggle="modal" data-target="#myModal2Individual" onclick="editMeetingIndividual(${statusReport.stid},${statusReport.mid},${statusReport.contactId},${statusReport.matchId})">
                                    ${statusReport.matchDate} 
                                </a>
                            </c:if>
                        </td>
                        <td>

                            <c:if test="${statusReport.fst==0 && statusReport.matchDate!=null && st3==1 && st4==1}">

                                <a href="#"><img src="../img/icons/girlYellowIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_fst', ${statusReport.contactId},${statusReport.mid}, 1, 1);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                </c:if>
                                <c:if test="${statusReport.fst==1}">
                                <a href="#"><img src="../img/icons/girlGreenIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_fst', ${statusReport.contactId},${statusReport.mid}, 1, 1);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                </c:if>
                                <c:if test="${statusReport.fst==2}"> 
                                <a href="#"><img src="../img/icons/girlRedIcon.png" onclick="changeValueIndividual(${statusReport.matchId}, 'i_fst', ${statusReport.contactId},${statusReport.mid}, 1, 1);" data-toggle="modal" data-target="#myModalIndividual"/></a>
                                </c:if>

                        </td>


                        <td>
                            <c:if test="${statusReport.priority==0}">
                                <a href="#" onclick="changePriority(${statusReport.matchId}, ${statusReport.contactId});" data-toggle="modal" data-target="#setPriority"><img src="../img/icons/priorityicon.png"/></a> 
                                </c:if>
                                <c:if test="${statusReport.priority==3}">
                                <a href="#" onclick="changePriority(${statusReport.matchId}, ${statusReport.contactId});" data-toggle="modal" data-target="#setPriority">High</a> 
                            </c:if>
                            <c:if test="${statusReport.priority==2}">
                                <a href="#" onclick="changePriority(${statusReport.matchId}, ${statusReport.contactId});" data-toggle="modal" data-target="#setPriority">Medium</a> 
                            </c:if>
                            <c:if test="${statusReport.priority==1}">
                                <a href="#" onclick="changePriority(${statusReport.matchId}, ${statusReport.contactId});" data-toggle="modal" data-target="#setPriority">Low</a> 
                            </c:if>

                        </td>
                        <td align="center">
                            <c:if test="${statusReport.contactExchange==1}">
                                <img src="../img/icons/contact-exchanged.png" onclick="fetchDataForContactExchange(${statusReport.matchId}, ${statusReport.contactId})" title="Sent" data-toggle="modal" data-target="#contactExchange"></img>
                                
                                <!--Below Code Modified by Sagar as on 5/4/2018 for gender status report mismatch-->
                                  <!--<img src="../img/icons/contact-exchanged.png" onclick="fetchDataForContactExchange({statusReport.contactId},{statusReport.matchId} )" title="Sent" data-toggle="modal" data-target="#contactExchange"></img>-->
                            </c:if>
                            <c:if test="${statusReport.contactExchange!=1}">
                                <img src="../img/icons/contact-no-exchange.png" onclick="fetchDataForContactExchange(${statusReport.matchId}, ${statusReport.contactId})"  title="Not Sent" data-toggle="modal" data-target="#contactExchange"></img>
                                
                                <!--Below Code Modified by Sagar as on 5/4/2018 for gender status report mismatch-->
                                 <!--<img src="../img/icons/contact-no-exchange.png" onclick="fetchDataForContactExchange( {statusReport.contactId},{statusReport.matchId})"  title="Not Sent" data-toggle="modal" data-target="#contactExchange"></img>-->
                            </c:if>
                        </td>

                    </tr>

                </s:iterator>

            </table>
        </td>
    </tr>

</table>

