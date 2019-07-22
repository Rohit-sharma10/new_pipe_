<%-- 
    Document   : emailStatus
    Created on : 27 May, 2016, 2:14:45 PM
    Author     : OpenSpace004
--%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<input type="hidden" id="cinfo" value="${cinfo} ${arm} & ${minfo} ${matchArm}">
<input type="hidden" id="cinfoContactId" value="${cinfoContactId} & ${minfoContactId}">
<input type="hidden" id="minfoContactId" value="${cinfoContactId} & ${minfoContactId}">

<table class="emailstatusTable">
    <tr>
        <th>
            Date
        </th>
        <th>
            Email Id
        </th>
        <th>
            Mail By
        </th>
        <th>
            Subject
        </th>
    </tr>
    <s:iterator  value="statusReportList" var="statusReportListId">
        <tr>
            <td>
                ${statusReportListId.deliveredDate}
            </td>    
            <td>
                ${statusReportListId.email}
            </td>    
            <td>
                ${statusReportListId.userName}
            </td>    
            <td>
                ${statusReportListId.subject}
            </td>    
        </tr>
    </s:iterator>
</table>

<!--
<div class="formHead"> <img src="../img/icons/horoscopeIcon.png" alt="Icon"/> <span> Guna Milan</span></div>
<table class="emailstatusTable">
    
<%--<s:iterator  value="statusReportList" var="statusReportListId">--%>
    <tr>
        <td>

        </td>    
        <td>

        </td>    

    </tr>
<%--</s:iterator>--%>
</table><br/><br/>-->

<c:if test="${matchList.size()>0}">

    <div class="formHead"> <img src="../img/icons/partnerIcon.png" alt="Icon"/> <span>Match Status</span></div>

    <table class="emailstatusTable">
        <tr>
            <th>Name</th>
            <th>Date and Time</th>
            <th>Feedback</th>
            <th>Status</th>
            <th>Accepted By</th>
        </tr>
        <s:iterator value="matchList"  var="statusReport">
            <tr>
                <c:if test="${statusReport.type==1}">
                    <td>
                        ${cinfo} ${arm}

                    </td> 
                    <td>
                        ${statusReport.st1date} 
                    </td>
                    <td>
                        ${statusReport.feedback1}
                    </td>
                    <td>
                        ${statusReport.st1String}
                    </td>
                    <td>
                        ${statusReport.st1ModifiedBy}
                    </td>
                </c:if> 
                <c:if test="${statusReport.type!=1}">
                    <td>
                        ${minfo} ${matchArm}

                    </td>
                    <td>
                        ${statusReport.st1date}
                    </td>
                    <td>
                        ${statusReport.feedback1}
                    </td>
                    <td>
                        ${statusReport.st1String}
                    </td>
                    <td>
                        ${statusReport.st1ModifiedBy}
                    </td>
                </c:if>
            </tr>
            <tr>
                <c:if test="${statusReport.type==1}">
                    <td>
                        ${minfo} ${matchArm}
                    </td>  
                    <td>
                        ${statusReport.st2date}
                    </td>  
                    <td>
                        ${statusReport.feedback2}
                    </td>  
                    <td>
                        ${statusReport.st2String}
                    </td>  
                    <td>
                        ${statusReport.st2ModifiedBy}
                    </td>
                </c:if>

                <c:if test="${statusReport.type!=1}">
                    <td>
                        ${cinfo}${arm}
                    </td>
                    <td>
                        ${statusReport.st2date} 
                    </td>
                    <td>
                        ${statusReport.feedback2}
                    </td>
                    <td>
                        ${statusReport.st2String}
                    </td>
                    <td>
                        ${statusReport.st2ModifiedBy}
                    </td>
                </c:if>
                </td>
            </tr>

        </s:iterator>
    </table>
</c:if>
<c:if test="${meetingList.size()>0}">
    <div class="formHead"> <img src="../img/icons/meeting.png" alt="Icon"/> <span>Meeting Status</span></div>
    <table class="emailmeetingTable">
        <s:iterator value="meetingList"  var="matchListId" status="loop">

            <tr>
                <td>
                    <table>
                        <tr>
                            <td>Date and Time : </td>

                            <td>${matchListId.date}</td>
                        </tr>
                        <tr>
                            <td>From Groom Side : </td>

                            <td>${matchListId.fromGroomSide}</td>
                        </tr>
                        <tr>
                            <td>From Bride Side : </td>

                            <td>${matchListId.fromBrideSide} </td>
                        </tr>
                         <tr>
                            <td>Scheduled By: </td>

                            <td>${matchListId.scheduledBy} </td>
                        </tr>
                        
                        <tr>
                            <td>Mail Sent : </td>

                            <td><c:if test="${matchListId.sendMail==1}">Yes</c:if><c:if test="${matchListId.sendMail!=1}">No</c:if></td>
                            </tr>

                        </table>
                    </td>  
                    <td>
                        <table>
                            <tr>
                                <td>Venue : </td>

                                    <td colspan="3">${matchListId.venue}</td>
                        </tr>

                        <tr>
                            <td>Type : </td>

                            <td colspan="3"><c:if test="${matchListId.mtp==1}">New Meeting</c:if><c:if test="${matchListId.mtp==2}">Reschedule</c:if> </td>
                            </tr>
                            <tr>
                                <td>Close Meeting : </td>

                                    <td colspan="3"> <c:if test="${matchListId.closeFlag==1}">
                                    <br/>

                                </c:if>
                                <c:if test="${matchListId.closeFlag==0}">
                                   
                                    <div class="controlsData controlWidth"><input type="text" id="description${matchListId.meetingId}"/></div>
                                     <br/>
                                    <input class="btn btn-primary" value="save" type="submit" onclick="closeMeeting(${matchListId.meetingId},${cinfoContactId},${minfoContactId},${stid})">
                                </c:if>
                                <c:if test="${matchListId.closeFlag==1}">
                                    ${matchListId.closeContent}
                                </c:if>
                            </td>

                        </tr>


                    </table>
                </td>  

            </tr>
            <tr>
            <tr>
                <td colspan="2">
                    Description:  ${matchListId.description}<br/>
                </td>
            </tr>
        </tr>

    </s:iterator>
</table>
</c:if>
<c:if test="${profileFollowupBoyList.size()>0}">
<div class="formHead"> <img src="../img/icons/boy.png" alt="Icon"/> <span>Boy Follow-up</span></div>

<table class="emailstatusTable">
    <tr>
        <th>
            Main Status 
        </th>
        <th>
            Date
        </th>
        <th>
            Remarks
        </th>
        <th>
            Inserted By
        </th>
    </tr>
    <s:iterator  value="profileFollowupBoyList" var="profileFollowupBoyListId">
        <tr>
            <td>
                ${profileFollowupBoyListId.mainStatus} ${profileFollowupBoyListId.reason} (${profileFollowupBoyListId.shortcode})
            </td>    
            <td>
                ${profileFollowupBoyListId.insertString}
            </td>    
            <td>
                ${profileFollowupBoyListId.remark}
            </td>   
              <td>
                ${profileFollowupBoyListId.userName}
            </td>   
            
        </tr>
    </s:iterator>
</table>
    </c:if>
<c:if test="${profileFollowupGirlList.size()>0}">
<div class="formHead"> <img src="../img/icons/girl.png" alt="Icon"/> <span>Girl Follow-up</span></div>
<table class="emailstatusTable">
    <tr>
        <th>
            Main Status 
        </th>
        <th>
            Date
        </th>
        <th>
            Remarks
        </th>
         <th>
            Inserted By
        </th>

    </tr>
    <s:iterator  value="profileFollowupGirlList" var="profileFollowupGirlListId">
        <tr>
            <td>
                ${profileFollowupGirlListId.mainStatus} ${profileFollowupGirlListId.reason} (${profileFollowupGirlListId.shortcode})
            </td>    
            <td>
                ${profileFollowupGirlListId.insertString}
            </td>    
            <td>
                ${profileFollowupGirlListId.remark}
            </td>    
   <td>
                ${profileFollowupGirlListId.userName}
            </td>   
        </tr>
    </s:iterator>
</table><br/><br/>
</c:if>
<c:if test="${contactExchangeList.size()>0}">
<div class="formHead"> <img src="../img/icons/girl.png" alt="Icon"/> <span>Contact Exchange</span></div>
<table class="emailstatusTable">
    <tr>
        <th>
            Name
        </th>
        <th>
            Number
        </th>
        <th>
            Relation
        </th>
        <th>
            Name
        </th>
        <th>
            Number
        </th>
        <th>
            Relation
        </th>

    </tr>
    <s:iterator  value="contactExchangeList" var="contactExchangeListId">
        <tr>
            <td>
                ${contactExchangeListId.firstName}
            </td>  
            <td>
                ${contactExchangeListId.boyNumber}
            </td> 
             <td>
                ${contactExchangeListId.boyRelation}
            </td>
            
            <td>
                ${contactExchangeListId.firtsNameMatch}
            </td>
            <td>
                ${contactExchangeListId.girlNumber}
            </td> 
            <td>
                ${contactExchangeListId.girlRelation}
            </td> 
            
        </tr>
    </s:iterator>
</table>
</c:if>


