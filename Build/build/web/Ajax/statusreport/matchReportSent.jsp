<%-- 
    Document   : sentBiodata
    Created on : 21 Apr, 2016, 5:52:08 PM
    Author     : OpenSpace004
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${matchListReport.size()>0}">
    <b class="recordDisplay" >Unique Biodata Sent [${matchListReport.size()}] </b>  
</c:if>
<div class="withPhotosDiv matchdivwidthchange">
    <span>
        <input class="form-control" type="text"  id="matchReportSentDateFrom" placeholder="From Date" />  
    </span>
    <span>
        <input class="form-control" type="text"  id="matchReportSentDateTo" placeholder="To Date" />  
    </span>
    <div class="searchprofileButtonDiv" >                       
        <input value="Search" style="text-transform: none;"  class="btn btn-primary" onclick="sentBioDataUnique()" />
    </div>
</div>


<table class="commonTable tableBG tableTopmargin">                                         
    <tr>
        <th>Posted By</th>
        <th>Email to/By Hand</th>
        <th>Name</th>
        <th>Dob</th>
        <th>Height</th>
        <th>Sent Date</th>
    </tr>
    <c:if test="${matchListReport.size()>0}">

        <s:iterator value="matchListReport" var="matchListReportId">
            <tr>
                <td>
                    ${matchListReportId.postedBy}
                </td>
                <td>
                    ${matchListReportId.mailNote}
                </td>
                <td>
                    <a href="getContactDetail?contactId=${matchListReportId.matchId}" target="_blank" style="color: #000;">  ${matchListReportId.name} </a>   
                </td>
                <td>
                    ${matchListReportId.dobString}
                </td>
                <td>
                    ${matchListReportId.heightString}
                </td>
                <td>
                    ${matchListReportId.dayString}
                </td>



            </tr>
        </s:iterator>
    </c:if>
    <c:if test="${matchListReport.size()==0}">
        <tr >
            <td colspan="6">
                Nothing found to display
            </td>
        </tr>
    </c:if>

</table>


