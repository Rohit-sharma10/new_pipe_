<%-- 
    Document   : statusReportIndividual
    Created on : 23 Nov, 2016, 16:46:50 
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<table class="commonTable tableBG" id="statusListIndividualTable">    
    <b>Total Biodata :: Received:${receivedSize}  Sent:${sentSize}</b>
    <tr>
        <th style="width: 20% ; text-align: center;">Name</th>
        <!--<th>ID</th>-->
        <th style="width: 11%;text-align: center;">Email Status</th>
        <th style="width: 11%;text-align: center;">Followup</th>
        <th style="width: 11%;text-align: center;">Profile Exchange</th>
        <th style="width: 11% ;text-align: center;">Match Status</th>
        <th style="width: 12% ;text-align: center;">Meeting Status</th>
        <th style="width: 13% ;text-align: center;">Final Status</th>
        <!--<th>Priority</th>-->
        <th style="width: 11% ;text-align: center;">Exchange</th>
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
                                <td style="width:20%;"><b>Received biodata(s) </b></td>
                                <td style="width:11%;"></td>
                                <td style="width:11%; text-align: center; "></td>
                                <td style="width:11%;"></td>
                                <td style="width:11%;"></td>
                                <td style="width:11%;"></td>
                                <td style="width:13%;"></td>
                                <td style="width:11%;"></td>


                            </tr>
                        </s:if> 
                    </s:if>
                    <s:if test="%{#statusReport.typeOfMatch==2}">

                        <s:if test="%{#flag!=2}">
                            <s:set var="flag" value="2"/>
                            <tr style="background-color:#E9F1F5">
                                <td ><b>Sent biodata(s) </b></td>
                                <td ></td>
                                <td ></td>
                                <td ></td>
                                <td ></td>
                                <td ></td>
                                <td ></td>


                            </tr>

                        </s:if>
                    </s:if>
                    <s:if test="%{#statusReport.movedFlag==1}">
                        <tr  style="position:relative; height: 69px;">
                        </s:if>
                        <s:else>
                        <tr>
                        </s:else>

                        <td >
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
                            <span class="tableName"> <a target="_blank"href="getContactDetail?contactId=${statusReport.matchId}">${statusReport.firstname}${statusReport.middlename}  </a></span>


                            <s:if test="%{!#statusReport.pdfPresentationFile.equals('') || #statusReport.pdfPresentationFile!=null}">
                                <span class="pdficon">
<!--                                    <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                                    <a target="_blank" href="${pdfpresentationPath}${statusReport.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
                                </span> 
                                </s:if> 
                                <%--<c:if test="${statusReport.movedFlag==0}">--%>
                            <!--<a  href="#!"  class="reportAction feedbackreportAction displayInline"  title="Additional Information" ></a>-->
                            <%--</c:if>--%>
                            <%--<c:if test="${statusReport.freshCallFlag==0}">--%>
<!--                                  <img src="${pageContext.request.contextPath}/img/Fresh_2.png" title="Fresh Call"/>-->
                            <!--<a href="#!" class="freshIcon freshIconAction displayInline marginChange" title="Fresh" ></a>-->
                            <%--</c:if>--%>


                        </td>

                        <td>

                            <a href="#!" data-toggle="modal" data-target="#emailStatus" onclick="emailStatus(${statusReport.contactId},${statusReport.matchId},${statusReport.stid})"><img src="../img/icons/emailstatus.png" title="Email Status"/></a>
                        </td>
                        <td style="text-align: center;">
                             <a href="#" data-toggle="modal" data-target="#armFollowup"  onclick="return profileFollowupFromMoved(${statusReport.matchId},${statusReport.contactId})" class="reportAction followreportAction" title="Follow-up"></a>

                            <!--<a href="#!" data-toggle="modal" data-target="#armFollowup"  onclick="profileFollowupFromMoved(${statusReport.matchId},${statusReport.contactId})"><img src="../img/icons/emailstatus.png" title="Email Status"/></a>-->
                        </td>
                        <td style="text-align: center">
                            <c:if test="${statusReport.emailType==2}">
                                <img src="../img/icons/nonActiveArrow.png" title="twoway"/>
                            </c:if>

                            <c:if test="${statusReport.emailType==1}">
                                <img src="../img/icons/boyActiveArrow.png" title="oneway"/>
                            </c:if>
                        </td>
                        <td >
                            <c:if test="${statusReport.matchDate==null}"> 
                                <div class="reportStatusDiv">
                                    <c:if test="${statusReport.emailType==1}">
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png" /></a>
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
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}" >
                                            <a href="#!" ><img src="../img/icons/boyYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyRedIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                            <a href="#!" ><img src="../img/icons/girlYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png"  /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlRedIcon.png" /></a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${statusReport.emailType==2}">
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">

                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='M' }">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
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
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==0 && statusReport.gender=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='M'}">
                                        <a href="#!" title="Reschedule"><img src="../img/icons/boyBlueIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='F'}">
                                        <a href="#!" title="Reschedule"><img src="../img/icons/girlBlueIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>

                                    <c:if test="${statusReport.st4==3 && statusReport.gender=='M'}">
                                        <a href="#!" title="Reschedule"><img src="../img/icons/boyBlueIcon.png"  /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==3 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Reschedule"><img src="../img/icons/girlBlueIcon.png"  /></a>
                                        </c:if>

                                </div>
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate==null}">                 
                                <a href="#!" > 
                                    Schedule meeting date
                                </a>                              
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate!=null}">   
                                <a href="#!">
                                    ${statusReport.matchDate} 
                                </a>
                            </c:if>
                        </td>
                        <td >

                            <c:if test="${statusReport.fst==0 && statusReport.matchDate!=null && st3==1 && st4==1}">

                                <a href="#!"><img src="../img/icons/girlYellowIcon.png" /></a>
                                </c:if>
                                <c:if test="${statusReport.fst==1}">
                                <a href="#!"><img src="../img/icons/girlGreenIcon.png"  /></a>
                                </c:if>
                                <c:if test="${statusReport.fst==2}">
                                <a href="#!"><img src="../img/icons/girlRedIcon.png" /></a>
                                </c:if>

                        </td>


                        <!--<td>-->
                        <%--<c:if test="${statusReport.priority==0}">--%>
                        <!--<a href="#!"><img src="../img/icons/priorityicon.png"/></a>--> 
                        <%--</c:if>--%>
                        <%--<c:if test="${statusReport.priority==3}">--%>
                        <!--<a href="#!" >High</a>--> 
                        <%--</c:if>--%>
                        <%--<c:if test="${statusReport.priority==2}">--%>
                        <!--<a href="#!" >Medium</a>--> 
                        <%--</c:if>--%>
                        <%--<c:if test="${statusReport.priority==1}">--%>
                        <!--<a href="#!" >Low</a>--> 
                        <%--</c:if>--%>

                        <!--</td>-->
                        <td style="text-align: center">
                            <c:if test="${statusReport.contactExchange==1}">
                                <img src="../img/icons/contact-exchanged.png"  title="Sent" ></img>
                            </c:if>
                            <c:if test="${statusReport.contactExchange!=1}">
                                <img src="../img/icons/contact-no-exchange.png"  title="Not Sent"></img>
                            </c:if>
                        </td>

                    </tr>

                </s:iterator>

            </table>
        </td>
    </tr>

</table>

