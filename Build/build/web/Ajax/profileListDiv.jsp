<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page buffer = "500kb" %>
<!--{contactListId.cityName}changed by vineet on 24-12-2016-->
<display:table   name="contactList"  id="contactListId" pagesize="25" export="true" requestURI="" class="borderNoneTable tableBG uiTable" >

    <display:column  title="" class="tdposition" media="html">
        <c:if  test="${contactListId.lockFlag==1}">
            <div class="leftImg">    
                <a href="unlockProfile?contactId=${contactListId.contactId} &flag=0"  title="Unlock Profle" onclick="return unlockProfile();">
                    <img src="${pageContext.request.contextPath}/img/icons/lockIcon.png"/>
                </a>
            </div>
        </c:if>
        <c:if  test="${contactListId.lockFlag==0}">
            <div class="leftImg">
                <a href="#"  title="Lock" data-toggle="modal" data-target="#lockProfile" onclick="return lockProfile(${contactListId.contactId})"><img src="${pageContext.request.contextPath}/img/icons/pauseIcon.png"/></a>
            </div>
        </c:if>
        <span class="selectList"></span>
        <div class="img-place"><img class="img-circle" style="width: 55px;height: 55px;" alt="Photo" src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contactListId.image1}"></div>
            <c:if test="${contactListId.categoryId=='' && userSession.permission=='N'}">
            <span class="slNumber"><a title="Authentication" data-toggle="modal" data-target="#myModal" href="#" onclick="fetchAuthenticationData(${contactListId.contactId})"> ${contactListId.category}${contactListId.profileId}  (${contactListId.shortName}) ${contactListId.assignedToArm}</a></span>
        </c:if>
        <c:if test="${contactListId.categoryId!='' && userSession.permission=='N'}">
            <span class="slNumber"><a title="Authentication"  href="#" onclick="fetchAuthenticationData(${contactListId.contactId})"> ${contactListId.category}${contactListId.profileId}  (${contactListId.shortName}) ${contactListId.assignedToArm}</a></span>
        </c:if>
        <c:if test="${contactListId.categoryId=='' && userSession.permission=='Y'}">
            <span class="slNumber"><a title="Authentication" data-toggle="modal" data-target="#myModal" href="#" onclick="fetchAuthenticationData(${contactListId.contactId})"> ${contactListId.category}${contactListId.profileId}  (${contactListId.shortName}) ${contactListId.assignedToArm}</a></span>
        </c:if>
        <c:if test="${contactListId.categoryId!=''  && userSession.permission=='Y'}">
            <span class="slNumber"><a title="Authentication"  data-toggle="modal" data-target="#myModal"  href="#" onclick="fetchAuthenticationData(${contactListId.contactId})"> ${contactListId.category}${contactListId.profileId}  (${contactListId.shortName}) ${contactListId.assignedToArm}</a></span>
        </c:if>

        <span class="activeProfile">
            <c:if test="${contactListId.status !=0}"><span style="color: red">Moved</span></c:if>
            <c:if test="${contactListId.status == 0}">
                <c:if  test="${contactListId.pauseFlag==1}">
                    <a href="#" class="holdProfileButton"  title="Pause" data-toggle="modal" data-target="#pauseProfile" onclick="return pauseProfile(${contactListId.contactId})"></a>
                </c:if>
                <c:if  test="${contactListId.approved==0 && contactListId.pauseFlag==0 && contactListId.categoryId!=0}">
                    <a href="#" class="inactiveProfileButton"  title="Pause" data-toggle="modal" data-target="#pauseProfile" onclick="return pauseProfile(${contactListId.contactId})"></a>
                </c:if>
                <c:if  test="${contactListId.approved==0 && contactListId.pauseFlag==0 && contactListId.categoryId==0}">
                    <a class="inactiveProfileButton" title="Please select category first"></a>
                </c:if>
                <c:if  test="${contactListId.approved!=0 && contactListId.pauseFlag==0}">
                    <a href="#" class="activeProfileButton"  title="Open" data-toggle="modal" data-target="#openProfile" onclick="return openProfile(${contactListId.contactId})"></a>
                </c:if></c:if>
            </span>
    </display:column>
    <display:column  sortable="true"  title="Name" style="width:100px;" sortProperty="firstName" media="html">
        <%--<c:if  test="${contactListId.entryFlag==1}">--%>
        <!--<div class="profileFrom colorYellow">CRM</div>-->
        <%--</c:if>--%>
        <c:if  test="${contactListId.entryFlag==0}">
            <div class="profileFrom colorBlue">WEB</div>
        </c:if>
            
             <c:if test="${contactListId.deviceName =='Android'}">
                                                    <div class="profileFrom colorBlue">App</div>
                                                </c:if>
                                             <c:if test="${contactListId.deviceName =='iOS'}">
                                                    <div class="profileFrom colorBlue">App</div>
                                                </c:if>    
            
            
        <c:if  test="${contactListId.lockFlag==1}">
            <a href="#" onclick="showInactiveAlert1()" target="_blank">     ${contactListId.firstName} ${contactListId.middleName} ${contactListId.lastName}</a>
        </c:if>
        <c:if  test="${contactListId.lockFlag==0}">
            <a href="getContactDetail?contactId=${contactListId.contactId}" target="_blank">     ${contactListId.firstName} ${contactListId.middleName} ${contactListId.lastName}</a>
        </c:if>
        <div class="iconDiv">
            <input type="hidden" value="${contactListId.status}" id="disableEmail">  <!--Added by vineet to Disable AddEmail on clicking email -->
            <c:if test="${contactListId.status == 0}"> 
             <a href="#" class="profileAction lockAction" title="Password" onclick="sendPassword(${contactListId.contactId})"></a> <!-- -${contactListId.password} removed from title because they don't want right nnow  -->
            </c:if>
<!--<a href="#" class="profileAction lockAction" title="Password-${contactListId.password}" onclick="sendPassword(${contactListId.contactId})"></a>-->
            <a href="#" class="profileAction emaiAction" title="Email" data-toggle="modal" data-target="#email" onclick="email(${contactListId.contactId})"></a>
            <!--<a href="#" class="profileAction rupeeAction" title="Payment" data-toggle="modal" data-target="#payment" onclick="payment()"></a>-->
            <c:if  test="${contactListId.paymentStatusFlag==0}">
                <a href="#" class="payiconPink" title="Payment" data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>                                                
            </c:if>
            <c:if  test="${contactListId.paymentStatusFlag==1}">
                <a href="#" class="payiconOrange" title="Payment" data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>                                                
            </c:if>
            <c:if  test="${contactListId.paymentStatusFlag==2}">
                <a href="#" class="payiconBlue" title="Payment" data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>                                                
            </c:if>
<!--<a href="#"  class="reportAction followreportAction" title="Follow-Up" data-toggle="modal" data-target="#followup" onclick="followUp(${contactListId.contactId})"></a>-->
            <c:if test="${contactListId.status == 0}">
                <a href="getMatchListByName?contactId=${contactListId.contactId}" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatus statusReport" title="Match Report"></a>
                <a href="getMatchListByName?contactId=${contactListId.contactId}&statusFlag=1" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatusicon statusreportIcon" title="Status Report"></a>
                <!--<a href="#!" class="reportActionDivstatus statusReport" title="Match report" ></a>-->
            </c:if>
            <c:if test="${contactListId.shortListIcon > 0}"> <!-- Added by vineet on 1--12-2016 -->
                <a href="#" class="profileActionShortIcon IMPAction" title="Short List" data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a> 
            </c:if>
            <c:if test="${contactListId.shortListIcon == 0}">
                <a href="#" class="profileAction IMPAction" title="Short List" data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a> 
            </c:if>
<!--<a href="#" class="profileAction IMPAction" title="ShortList" data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a>-->                                                      
            <a  class="reportAction feedbackreportAction" title="Additional Information"  data-toggle="modal" data-target="#feedback" onclick="feedbackNewEdit(${contactListId.contactId})"></a>
            <c:if test="${contactListId.pdfPresentationFile!=null}">
<!--                <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${contactListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
                <a target="_blank" onclick="saveDownloadInfo(${contactListId.contactId},'View Pdf from profile list Accessed ')" href="${pdfpresentationPath}${contactListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>
            </c:if>
            <a href="#" class="profileAction othersAction" title="Send Registration Form"  onclick="sendRegistrationForm(${contactListId.contactId})"></a>
            <c:if test="${contactListId.status != 0}"> 
                <br><span style="color: red">Moved By ${contactListId.movedUserName} ON ${contactListId.movedDate}</span>
            </c:if> 
        </div>
    </display:column>
    <display:column  sortProperty="age" title="D.O.B" sortable="true"  paramProperty="dobString" media="html">
        ${contactListId.dobString}/${contactListId.age}
    </display:column>
    <display:column  title="Height" sortable="true" sortProperty="height">
        ${contactListId.heightString}
    </display:column>
    <display:column  title="Education" sortable="true">
        ${contactListId.education}
    </display:column>
    <display:column  title="City" sortable="true">

        ${contactListId.presentCity}
    </display:column>
    <display:column  title="Community" sortable="true" >
        ${contactListId.community}
    </display:column>
    <display:column  title="Reg.Date" sortable="true" >
        ${contactListId.regDateString}  
    </display:column>
    <display:column  title="Gotra" sortable="true" >
        ${contactListId.gotra}  
    </display:column>
    <display:column  title="Native Place" sortable="true" >
        ${contactListId.nativeData}  
    </display:column>
    <display:column  title="Added By" sortable="true" >
        ${contactListId.profileCreatedBy}  
    </display:column>
    <display:column media="csv" property="contactId">
    </display:column>
    <display:column media="csv" property="name">
    </display:column>
    <display:column media="excel" property="contactId">
    </display:column>
    <display:column media="excel" property="name">
    </display:column>
    <display:setProperty name="paging.banner.placement" value="both"/>
    <display:setProperty name="export.csv.include_header" value="true" />
    <display:setProperty name="export.csv" value="true" />
    <display:setProperty name="export.csv.filename" value="product_master.csv"/>
    <display:setProperty name="export.excel.filename" value="product_master.xls"/>
    <display:setProperty name="export.xml" value="false" />
    <display:setProperty name="export.xml.filename" value="product_master.xml"/> 
</display:table>