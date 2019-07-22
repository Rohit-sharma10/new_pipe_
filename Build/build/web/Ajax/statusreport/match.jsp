<%-- 
    Document   : match
    Created on : 22 Apr, 2016, 3:35:34 PM
    Author     : OpenSpace004
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="../../css/bootstrap.min.css" rel="stylesheet"/>
<link href="../../css/bootstrap-theme.css" rel="stylesheet"/>
<script src="../../js/bootstrap.min.js"></script>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<c:if test="${matchList.size()==0}">
    Searched contact is either locked,pause or does not match search criteria. 
</c:if>
<c:if test="${matchList.size()>=0}">
    <b class="recordDisplay" id="matchHeaderListSize">${matchList.size()} Records found</b>
</c:if>
<s:iterator value="matchList" var="matchListId" status="loop">
    <li style="background: ${matchListId.bc}"> <div class="reportProfileDIV">
            <div class="imageReportProfile">
<!--                <img class="img-circle" src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${matchListId.image1}" style="width:55px; height:55px" />-->
                <img class="img-circle" src="${profileimgPath}${matchListId.image1}" style="width:55px; height:55px" />
            </div>
            <div class="reportProfileName">
                <a data-toggle="tab"    href="#menu2" onclick="displayContactDetails(${matchListId.contactId})">${matchListId.firstName} </a>

                <div class="profileIDNum">
                    <span class="color2 font15">${matchListId.category}${matchListId.profileId}(${matchListId.shortName}${matchListId.assignedToArm}</span>)
                    <s:if test="%{!#matchListId.pdfPresentationFile.equals('') || #matchListId.pdfPresentationFile!=null}">
                        <span class="pdficon">
<!--                            <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${matchListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                            <a target="_blank" href="${pdfpresentationPath}${matchListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
                        </span>
                        </s:if>
                </div>

            </div>
        </div>
        <table class="reportLeftTable" id="tblData">
            <tr>
                <td width="100">
                    <!--<input type="submit" class="btn btn-yellowLight" value="Match" name=""/>-->
                </td>
                <td width="90">DOB</td>
                <td>${matchListId.dobString},(${matchListId.age})</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>Height</td>
                <td> ${matchListId.heightString}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td> Education</td>
                <td> ${matchListId.education}</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td> City</td>
                <td> ${matchListId.cityName}</td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td> Community</td>
                <td>${matchListId.community}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td> Gotra</td>
                <td>${matchListId.gotra}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td> Native Place</td>
                <td>${matchListId.nativeData}</td>
            </tr>
            <tr>

                <td colspan="3">
                    <a data-toggle="tab" href="#emailList" class="profileAction emaiAction" title="email" onclick="email(${matchListId.contactId})"></a>
                    <a data-toggle="tab" href="#followupStatus" class="reportAction followreportAction" title="followup" onclick="followUp(${matchListId.contactId})"></a>
                    <a data-toggle="tab" href="#feedbackStatus" class="reportAction feedbackreportAction"  title="Additional Information" onclick="feedback(${matchListId.contactId})"></a>
                    <a data-toggle="tab" href="#statusReport" class="reportActionDivstatus statusReport" title="status report" onclick="statusReport(${matchListId.contactId})"></a>
                    <!--<a data-toggle="tab" href="#kundaliReport" class="reportActionDivstatus horoscopeReport" title="kundali" > </a>-->                                          
                    <a data-toggle="tab" class="outboxAction moveoutboxAction movetooutbox iconinLine" id="movetooutbox${loop.index}"  title="move to outbox" onclick="moveToOutBox(${matchListId.contactId});moveToOutBoxColor(this.id)">   </a> 
                    <a data-toggle="tab"  href="#activityLog" class="reportActionDivstatus actlogAction" title="Activity log" onclick="showAllActivity(${matchListId.contactId}, 1)">   </a>
                    <a data-toggle="tab" href="#kundaliReportList" class="reportActionDivstatus kundaliAction" title="Kundali" id="kundaliMatch${matchListId.contactId}" onclick="getContactInfoKundali(${matchListId.contactId})">   </a>

                </td>
            </tr>

        </table>
    </li>
</s:iterator>
<a data-toggle="tab" href="#refreshMatchreport" id="refreshMatchReport"  >   </a>