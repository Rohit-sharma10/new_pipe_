<%-- 
    Document   : profileList
    Created on : 12 Mar, 2016, 12:53:44 PM
    Author     : OpenSpace004
--%>
<!DOCTYPE html>
<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="java.util.List"%> 
<%@page language="java" import="com.crm.manager.ProfileManager"%>
<%@ page buffer = "500kb" %>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%--<%@ page buffer = "500kb" %>--%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style-responsive.css" rel="stylesheet" />
        <link href="../css/subhlagan-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/datepicker.css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="../css/elegant-icons-style.css" rel="stylesheet" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" />

        <script src="../js/jquery.js"></script>
        <link rel="stylesheet" href="/css/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>

        <script type="text/javascript" src="../js/jquery.multiselect.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/jquery.multiselect.css" />
        <script type="text/javascript" src="../js/profileList.js"></script>
        
        <script type="text/javascript">
            function saveDownloadInfo(contactId, activity)
            {
                $.ajax({
                    type: "post",
                    url: "savePdfDownloadActivity",
                    data: "contactId=" + contactId+ "&activity="+activity,
                    success: function (html) {

                    }
                });
            }
        </script>
    </head>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP">
                            <!--copy till here-->
                            <!--<form action="searchContact" method="post">-->
                            <div class="dashboardSearchLeft">
                                <div class="profileSearchDiv">
                                    <div class="listSearch">
                                        <div class="listSearchInner">
                                            <!--<input  id="search" type="text" placeholder="Search "/>-->
                                            <!--<input  id="searchName" type="text" placeholder="Search " name="contact.search"/>-->
                                            <input type="text" id="cityAuto" value="${cityList1}" style="display:none;">
                                            <input type="text" id="educationAuto" value="${cityList1}" style="display:none;">
                                            <input type="text" id="contactListAll" value="${contactListTest}" style="display:none;">
                                            <input type="text" id="txtAutoComplete" list="searchName" name="contact.search"  placeholder="Search" />
                                              <!--<input type="text" id="txtAutoComplete" list="searchNameHeader" name="contact.search"  placeholder="Search" />your input textbox-->
                                            <input type="submit" value="" id="searchMagnifyButton" class="searchButton" onclick="searchAutocomplete()">
                                        </div>
                                    </div> 
                                    <div class="profileAndPageDiv"><input value="Profile ID" style="width: 180px"/> <button value="Go" class="btn btn-go" />
                                        <input value="Page"/> <button value="Go" class="btn btn-go" />
                                    </div>     
                                    <div class="dateRangeSearch">
                                        <!--<label>Reg.Date</label> <h:inputText id="regdate"/> <h:commandButton value="Go" class="btn btn-go" />-->
                                        <label>Reg.<br/> Date</label>
                                        <div class="dateDIV">
                                            <input  type="text" placeholder="From" id="example1" name="contact.regDateFrom"/>
                                            <input  type="text" placeholder="To"  id="example2" name="contact.regDateTo"/>

                                            <input type="submit" class="btn btn-go" value="Go" onclick="return searchContacts()" />


                                        </div>
                                        <!--<div class="advanceSearchDiv">
                                        <button id="advanceSearch" value="Advance Search" class="btn btn-advanceSearch"    >Advance Search</button>-->
                                        <a href="#" id="advanceSearch" class="btn btn-advanceSearch"  onclick="showAdvanceSearch()">Advance Search</a>
                                        <a href="#"  id="advanceSearch1" class="btn btn-advanceSearch"  onclick="hideAdvanceSearch()" style="display:none;">Advance Search</a>
                                        <!--<button id="advanceSearch1" value="Advance Search" class="btn btn-advanceSearch"  style="display:none;" onclick="hideAdvanceSearch()"/>Advance Search</div>-->
                                    </div>

                                    <div class="addnewmemDiv">
                                        <a href="AddNewMember" value="Add New Member"  class="btn btn-primary whiteUser"  >Add New Member</a>
                                    </div> 

                                </div>
                            </div>
                            <!--</form>-->
                            <!--<form action="searchContact" method="post">-->


                            <div class="dashboardSearchRight dashboardWidthChange"  style="display: none" id="advanceSearchDiv">
                                <div class="profileSearchByDiv"  id="searchDiv">
                                    <div class="withPhotosDiv withPhotosDivs"> <!--Removed withMemberDiv -->

                                        <div class="headSM">Personal Details</div>
                                        <input type="hidden" value="<%=request.getParameter("untouchedFlag")%>" id="hiddenUntouchedFlag">

                                        <span>       
                                            <input type="checkbox" id="untouchedId" name="contact.untouchCheckBox" /><span style=" text-transform:uppercase">Untouched</span>
                                        </span>

                                        <!--Added by vineet For untouched date Query on 06-12-2016-->

                                        <span>
                                            <select id="untouchedDate">
                                                <option value="0">-- Untouched--</option>
                                                <option value="1">Untouched Date</option>                   
                                            </select>
                                        </span>

                                        <!--End 6-12-2016-->

                                        <span>
                                            <select  tabindex="10"  id="authorityId">
                                                <option value="0"> Authority</option>
                                                <option value="1">Authorized</option>
                                                <option value="2">Pending</option>
                                                <option value="3">Paused</option>
                                                <option value="4">Unlock</option>
                                                <option value="5">Hold</option>
                                            </select>
                                        </span>

                                        <span>
                                            <select  tabindex="1"  id="communityId" name="contact.communityId">
                                                <option value="0">Community</option>
                                                <s:iterator value="communityList" id="communityListId">
                                                    <option value="${communityListId.communityId}">${communityListId.communityName}</option>
                                                </s:iterator>   

                                            </select>
                                        </span>


                                        <!--                                        <span>
                                                                                    <select  tabindex="2"  id="motherTongueId"  name="contact.motherTongueId">
                                                                                        <option value="0">mother tongue</option>
                                        <%--<s:iterator value="motherTongueList" id="motherTongueListId">--%>
                                            <option value="${motherTongueListId.motherTongueId}">${motherTongueListId.motherTongue}</option>
                                        <%--</s:iterator>--%>   

                                    </select>
                                </span>-->
                                        <span>
                                            <input id="tags1" placeholder="Education" type="text" >
                                            <!--<select  tabindex="3"  id="educationId" name="contact.educationId">-->
                                            <!--<option value="0">Education</option>-->
                                            <%--<s:iterator value="educationList" id="educationListId">--%>
                                                <!--<option value="${educationListId.educationId}">${educationListId.educationName}</option>-->
                                            <%--</s:iterator>--%>   
                                            <!--</select>-->
                                        </span>
                                        <span>
                                            <select  tabindex="4"  id="countryId"  name="contact.countryId">
                                                <option value="0">Country</option>
                                                <s:iterator value="countryList" id="countryListId">
                                                    <option value="${countryListId.countryId}">${countryListId.countryName}</option>
                                                </s:iterator>   
                                            </select>
                                        </span>
                                        <!--                                        <span>
                                                                                    <select  tabindex="5"  id="cityId" name="contact.cityId">
                                                                                        <option value="0">City</option>
                                        <%--<s:iterator value="cityList" id="cityListId">--%>
                                            <option value="${cityListId.cityId}">${cityListId.cityName}</option>
                                        <%--</s:iterator>--%>   
                                    </select>
                                </span>-->

                                        <span>
                                            <input id="tags" placeholder="city" type="text" >

                                        </span>

                                    </div>
                                    <div class="withPhotosDiv withPhotosDivs">
                                        <div class="headSM">Other Details</div>

                                        <span>
                                            <select  tabindex="7"  id="categoryId" name="contact.categoryId">
                                                <option value="0">Category</option>
                                                <s:iterator value="categoryList" id="categoryListId">
                                                    <option value="${categoryListId.categoryId}">${categoryListId.categoryName}</option>
                                                </s:iterator>   
                                            </select>
                                        </span>
                                        <!--<span>-->
                                        <!--                                            <select  tabindex="7"  id="Priority" name="contact.priority" >
                                                                                        <option value="0">Priority</option>
                                                                                        <option value="1">Priority</option>
                                                                                        <option value="2">All</option>
                                                                                    </select>-->
                                        <!--</span>-->
                                        <span>
                                            <input type="text" name="contact.email" placeholder="EMAIL" id="emailIdForSearch"/>
                                            <!--                                                <select  tabindex="8"  id="Expiry"  name="contact.expiry">
                                                                                                <option value="0"> Expiry</option>
                                                                                                <option value="1">In Force</option>
                                                                                                <option value="2">Expired</option>
                                                                                            </select>-->
                                        </span>
                                        <span>
                                            <select  tabindex="9"  id="userId"  name="contact.userId" >
                                                <option value="0">SELECT RM</option>
                                                <s:iterator value="userList" id="userListId">
                                                    <c:if test="${(userListId.deptId==8) || (userListId.deptId==12) || (userListId.deptId==13) || (userListId.deptId==14) || (userListId.deptId==17)}">
                                                        <option value="${userListId.userId}">${userListId.name} </option>
                                                    </c:if>
                                                </s:iterator>   
                                            </select>
                                        </span>
                                        <!--Added by vineet on 24-11-2016-->
                                        <span>
                                            <select  tabindex="9"  id="armIds"  name="contact.armId" >
                                                <option value="0">SELECT ARM</option>
                                                <s:iterator value="userList" id="userListId">
                                                    <c:if test="${(userListId.deptId==9) || (userListId.deptId==15) || (userListId.deptId==16) || (userListId.deptId==18)}">
                                                        <option value="${userListId.userId}">${userListId.name} </option>
                                                    </c:if>
                                                </s:iterator>   
                                            </select>
                                        </span>

                                        <span>
                                            <select id="Status">
                                                <option value="0">Status</option>
                                                <option value="1">Success</option>
                                                <option value="2">Lost Opportunity</option>
                                                <option value="3">Delete</option> 
                                                </option>
                                            </select>
                                        </span>
                                        <span>
                                            <select id="photo">
                                                <option value="0">Photo</option>
                                                <option value="1">With Photo</option>
                                                <option value="2">Without Photo</option>                     
                                            </select>
                                        </span>
                                        <span>
                                            <input type="text" name="contact.mobile" placeholder="Mobile" id="mobileId"/>

                                        </span>
                                        <span>
                                            <select id="from">
                                                <option value="0">Select From</option>
                                                <option value="1">WEB</option>
                                                <option value="2">CRM</option>
                                                <option value="3">APP</option>
                                            </select>
                                        </span>
                                        <span>
                                            <select id="paymentStatus">
                                                <option value="-1">Payment Status</option>
                                                <option value="0">No payment</option>
                                                <option value="1">Partial payment</option>
                                                <option value="2">Full payment</option>
                                            </select>
                                        </span>
                                        <!--                                        <span>
                                                                                                                            <select  tabindex="10"  id="authorityId">
                                                                                                                                <option value="0"> Authority</option>
                                                                                                                                <option value="1">Authorized</option>
                                                                                                                                <option value="2">Pending</option>
                                                                                                                                <option value="3">Locked</option>
                                                                                                                                <option value="4">Unlock</option>
                                                                                                                            </select>
                                                                                </span>-->
                                        <div id="searchButton" class="searchprofileButtonDiv-profile-list">
                                            <select value="contact.officeId" name="contact.officeId" id="officeIdForSearch"  >
                                                <option  value="0">Office</option>
                                                <s:iterator value="officeList" id="officeListId">
                                                    <option value="${officeListId.officeId}">${officeListId.officeName}</option>
                                                </s:iterator>                                                            
                                            </select>
                                            
                                            
                                            <a class="btn btn-primary"  value="search" onclick="searchContacts()">Search</a>
                                            <a class="btn btn-primary"  value="Reset" onclick="resetFilters()">Reset</a>
                                        </div>

                                    </div>

                                </div>
                            </div>


                            <!--</form>-->
                            <!--{contactListId.cityName}changed by vineet on 24-12-2016-->
                            <div style="height: 40px"></div>
                            <div class="withPhotosDiv">
                                <div>

                                </div> 
                                <div class="headSM">  
                                    <!--<div style="float:left;"> Displaying <b>${contactList.size()}</b> record(s)</div>-->
                                    <div class="activeDataDiv">Active Profile Under You <b>${rmProfileCount[0]}</b> Out Of <b>${rmProfileCount[1]}</b>
                                    </div>
                                </div>
                            </div>
                            <div class="loading1">
                                <img src="../img/loader1.gif" id="loading1" style="display:none;" >
                            </div>
                            <div class="row">
                                <div class="col-lg-12" id="displayDiv" style="position:relative">

                                    <display:table   name="contactList" export="true" id="contactListId" pagesize="25"  requestURI="" class="borderNoneTable tableBG uiTable"  >
                                        <display:column  title="" class="tdposition" media="html">


                                            <c:if  test="${contactListId.lockFlag==1}">
                                                <div class="leftImg">
                                                    <a href="unlockProfile?contactId=${contactListId.contactId}&flag=0"  title="Unlock Profle" onclick="return unlockProfile();">
                                                        <img src="${pageContext.request.contextPath}/img/icons/lockIcon.png"/>
                                                    </a>
                                                </div>
                                            </c:if>
                                            <c:if  test="${contactListId.lockFlag==0}">
                                                <div class="leftImg">
                                                    <a href="#"  title="Pause" data-toggle="modal" data-target="#lockProfile" onclick="return lockProfile(${contactListId.contactId})"><img src="${pageContext.request.contextPath}/img/icons/pauseIcon.png"/></a>
                                                </div>
                                            </c:if>
                                            <!--<span class="selectList"><input type="checkbox" name=""></span>-->
                                            <div class="img-place">
<!--                                                <img class="img-circle" style="width: 55px;height: 55px;" alt="Photo" src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contactListId.image1}">-->
                                                <img class="img-circle" style="width: 55px;height: 55px;" alt="Photo" src="${profileimgPath}${contactListId.image1}">
                                            </div>

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

                                            <!--                                            <span class="activeProfile">
                                                                                            <a  class="holdProfileButton"></a>
                                                                                        </span>-->
                                            <span class="activeProfile">
                                                <!--                                                <div class="checkbox checkbox-slider--b-flat">
                                                                                                    <label>
                                                                                                        <input type="checkbox" checked=""><span>checked</span>
                                                                                                    </label>
                                                                                                </div>-->
                                                <!--Added by vineet on 28-11-2016 to check Lost Profile-->
                                                <c:if test="${contactListId.status != 0}"><span style="color: red">Moved</span></c:if>

                                                <c:if test="${contactListId.status == 0}">
                                                    <c:if  test="${contactListId.pauseFlag==1}">
                                                        <a href="#" class="holdProfileButton"  title="Hold" data-toggle="modal" data-target="#pauseProfile" onclick="return pauseProfile(${contactListId.contactId})"></a>
                                                        <!--<a class="holdProfileButton" href="updateAuthorization?contactId={contactListId.contactId}&flag=1"></a>-->
                                                    </c:if>
                                                    <c:if  test="${contactListId.approved==0 && contactListId.pauseFlag==0 && contactListId.categoryId!=0}">
                                                        <a href="#" class="inactiveProfileButton"  title="Hold" data-toggle="modal" data-target="#pauseProfile" onclick="return pauseProfile(${contactListId.contactId})"></a>
                                                        <!--<a class="inactiveProfileButton" href="updateAuthorization?contactId={contactListId.contactId}&flag=1"></a>-->
                                                    </c:if>
                                                    <c:if  test="${contactListId.approved==0 && contactListId.pauseFlag==0 && contactListId.categoryId==0}">
                                                        <a class="inactiveProfileButton" title="Please select category first"></a>
                                                    </c:if>
                                                    <c:if  test="${contactListId.approved!=0 && contactListId.pauseFlag==0}">
                                                        <a href="#" class="activeProfileButton"  title="Open" data-toggle="modal" data-target="#openProfile" onclick="return openProfile(${contactListId.contactId})"></a>
                                                        <!--<a class="activeProfileButton" href="updatePauseStatus?contactId={contactListId.contactId}&flag=1"></a>-->
                                                    </c:if></c:if>

                                                <%--<c:if  test="${contactListId.pauseFlag==1}">--%>
                                                <!--<a  class="holdProfileButton" title="Paused" href="updateAuthorization?contactId={contactListId.contactId}&flag=0" ></a>-->
                                                <%--</c:if>--%>

                                            </span>
                                            <!--<span class="activeProfile"></span>-->
                                         

                                        </display:column>
                                        <display:column  sortable="true"  title="Name" style="width:100px;" sortProperty="firstName" media="html" >
                                            <%--<c:if  test="${contactListId.entryFlag==1}" >--%>
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
                                                <a href="#" onclick="showInactiveAlert1()" target="_blank">     ${contactListId.firstName} ${contactListId.middleName} ${contactListId.lastName} (${contactListId.shortName}) ${contactListId.assignedToArm}</a>
                                            </c:if>
                                            <c:if  test="${contactListId.lockFlag==0}">
                                                <a href="getContactDetail?contactId=${contactListId.contactId}" target="_blank">     ${contactListId.firstName} ${contactListId.middleName} ${contactListId.lastName} (${contactListId.shortName}) ${contactListId.assignedToArm}</a>
                                            </c:if>
                                            <div class="iconDiv">
                                                 <input type="hidden" value="${contactListId.status}" id="disableEmail">  <!--Added by vineet to Disable AddEmail on clicking email -->
                                                <c:if test="${contactListId.status == 0}"> 
                                                <a href="#" class="profileAction lockAction"  onclick="sendPassword(${contactListId.contactId})"></a>  <!--{contactListId.password} removed from title because they don't want right nnow  -->
                                                    <!--<a href="#" class="profileAction lockAction"  onclick="sendPassword(${contactListId.contactId})"></a>  -${contactListId.password} removed from title because they don't want right nnow  -->
                                                </c:if>    
                                                <a href="#" class="profileAction emaiAction"  data-toggle="modal" data-target="#email" onclick="email(${contactListId.contactId})"></a>
                                                <!--<a href="#" class="profileAction emaiAction" title="Email" data-toggle="modal" data-target="#email" onclick="email({contactListId.contactId})"></a>-->
                                                <!--<a href="#" class="profileAction emaiAction"  data-toggle="modal" data-target="#email" onclick="email(${contactListId.contactId})"></a>-->
                                               
                                                <c:if  test="${contactListId.paymentStatusFlag==0}">
                                                    <a href="#" class="payiconPink"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>                                                
                                                     <!--<a href="#" class="payiconPink"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>-->                                                
                                                </c:if>
                                                <c:if  test="${contactListId.paymentStatusFlag==1}">
                                                    <a href="#" class="payiconOrange"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>                                                
                                                    <!--<a href="#" class="payiconOrange"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>-->                                                
                                                </c:if>
                                                <c:if  test="${contactListId.paymentStatusFlag==2}">
                                                    <a href="#" class="payiconBlue"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>
                                                    <!--<a href="#" class="payiconBlue"  data-toggle="modal" data-target="#payment" onclick="payment(${contactListId.contactId})"></a>-->
                                                </c:if>
                                                <!--<a href="#"  class="reportAction followreportAction" title="Follow-Up" data-toggle="modal" data-target="#followup" onclick="followUp(${contactListId.contactId})"></a>-->
                                                <!-- Added by vineet to hide match and status in moved list -->
                                                 <c:if test="${contactListId.status == 0}"> 
                                                    <a href="getMatchListByName?contactId=${contactListId.contactId}" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatus statusReport" ></a>
                                                    <!--<a href="getMatchListByName?contactId=${contactListId.contactId}" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatus statusReport" ></a>-->
                                                    
                                                    <a href="getMatchListByName?contactId=${contactListId.contactId}&statusFlag=1&twoWayFlag=${contactListId.oneTwoWayFlagArm}" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatusicon statusreportIcon" ></a>
                                                    <!--<a href="getMatchListByName?contactId=${contactListId.contactId}&statusFlag=1&twoWayFlag=${contactListId.oneTwoWayFlagArm}" onclick="return showInactiveAlert(${contactListId.approved},${contactListId.lockFlag})" class="reportActionDivstatusicon statusreportIcon"></a>-->
                                                </c:if>
                                                <!--<a href="#!" class="reportActionDivstatus statusReport" title="Match report" ></a>-->

                                                <c:if test="${contactListId.shortListIcon > 0}">
                                                    <a href="#" class="profileActionShortIcon IMPAction"  data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a> 
                                                     <!--<a href="#" class="profileActionShortIcon IMPAction"  data-toggle="modal" data-target="#shortList onclick="getShortSummary(${contactListId.contactId})"></a>--> 
                                                </c:if>
                                                <c:if test="${contactListId.shortListIcon == 0}">
                                                    <a href="#" class="profileAction IMPAction"  data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a> 
                                                    <!--<a href="#" class="profileAction IMPAction" data-toggle="modal" data-target="#shortList" onclick="getShortSummary(${contactListId.contactId})"></a>--> 
                                                </c:if>
                                                <a  class="reportAction feedbackreportAction"   data-toggle="modal" data-target="#feedback" onclick="feedbackNewEdit(${contactListId.contactId})"></a>
                                                <!--<a  class="reportAction feedbackreportAction"  data-toggle="modal" data-target="#feedback" onclick="feedbackNewEdit(${contactListId.contactId})"></a>-->
                                                
                                                <c:if test="${contactListId.pdfPresentationFile!=null}">
<!--                                                    <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${contactListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction"  ></a>-->
                                                    <a target="_blank" onclick="saveDownloadInfo(${contactListId.contactId},'View Pdf from profile list Accessed ')" href="${pdfpresentationPath}${contactListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction"  ></a>
                                                </c:if>
                                                <a href="#" class="profileAction othersAction"   onclick="sendRegistrationForm(${contactListId.contactId})"></a>     
                                                 <!--<a href="#" class="profileAction othersAction"  onclick="sendRegistrationForm(${contactListId.contactId})"></a>-->     
                                                 <c:if test="${contactListId.status != 0}">                                        
                                                     <br><span style="color: red">Moved By ${contactListId.movedUserName} ON ${contactListId.movedDate}</span>
                                                </c:if>  
                                            </div>


                                        </display:column>
                                        <display:column media="csv" property="contactId">
                                        </display:column>
                                        <display:column media="csv" property="name">
                                        </display:column>
                                        <display:column media="excel" property="contactId">
                                        </display:column>
                                        <display:column media="excel" property="name">
                                        </display:column>


                                        <display:column  sortProperty="age" title="D.O.B" sortable="true"  paramProperty="dobString">
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
                                        <%--<display:column  title="CAT" sortable="true">--%>

                                        <!--<div class="set">-->
                                        <%--<c:if test="${contactListId.categoryNumber==0}">--%>
                                        <!--<a href="#"  title="Authentication" data-toggle="modal" data-target="#myModal" onclick="fetchAuthenticationData(${contactListId.contactId})" >SET</a>-->
                                        <%--</c:if>--%>
                                        <%--<c:if test="${contactListId.categoryNumber!=0}">--%>
                                        <!--<a href="#!"  title="Authentication" > {contactListId.category}_{contactListId.categoryNumber} [{contactListId.assignedToString}]</a>-->
                                        <%--</c:if>--%>

                                        <!--</div>-->
                                        <%--</display:column>--%>
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
                                        <display:setProperty name="paging.banner.placement" value="both"/>
                                        <display:setProperty name="export.csv.include_header" value="true" />
                                        <display:setProperty name="export.csv" value="true" />
                                        <display:setProperty name="export.csv.filename" value="contact.csv"/>
                                        <display:setProperty name="export.excel.filename" value="contact.xls"/>
                                        <display:setProperty name="export.xml" value="false" />
                                        <display:setProperty name="export.xml.filename" value="product_master.xml"/> 
                                       
                                    </display:table>
                                </div>
                            </div>

                            <a class="" href="${pageContext.request.contextPath}/Profile/profileList" id="profileList"></a>
                            <!--feedBack-->
                            <div id="feedback" class="modal fade" role="dialog" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" id="feedBackHeading">Feedback</h4>
                                        </div><br/>
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a data-toggle="tab" href="#additionalInformationDiv"  class="tabHeadSM tabPaddLeft">Additional Information</a></li>
                                            <li><a data-toggle="tab" href="#questionsDiv"  class="tabHeadSM tabPaddLeft">Questions</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="additionalInformationDiv">
                                                <div id="feedBackHistoryImportantInformation" class="modal-body">
                                                 <div id="fname">
                                                     </div>
                                                </div>
                                            </div>
                                            <div id="questionsDiv" class="tab-pane fade">
                                                <div class="modal-body">
                                                    <div class="col-lg-12">
                                                        <div class="formHEADDiv whiteBG">
                                                            <div class="formHead"><span>Questions </span></div>
                                                        </div>
                                                        <form method="post" action="saveEmail"  > 
                                                            <section>
                                                                <div class="formDATA">
                                                                    <label>Budget / Range</label>
                                                                    <div class="controlsData" id="budgetDiv">
                                                                        ${contact.budget}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Preference</label>
                                                                    <div class="controlsData" id="preferenceDiv">
                                                                        ${contact.preference}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Family (income or Salary)<input type="hidden" id="questionContactId" ></label>
                                                                    <div class="controlsData" id="familySalaryDiv">
                                                                        ${contact.familySalary}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Property Of Ownership ${contact.maritalStatus}</label>
                                                                    <div class="controlsData" id="propertyOfOwnershipDiv">
                                                                        ${contact.propertyOfOwnership}
                                                                    </div>
                                                                </div>                                                                 
                                                                <div class="formDATA" id="div1">
                                                                    <label>Reason of Divorce </label>
                                                                    <div class="controlsData" id="reasonOfDivorceDiv">
                                                                        ${contact.reasonOfDivorce}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA" id="div2">
                                                                    <label>Whether divorce is settled</label>
                                                                    <div class="controlsData" id="divorcedOrSettledDiv">
                                                                        ${contact.divorcedOrSettled}
                                                                    </div>
                                                                </div>

                                                                <div class="formDATA">
                                                                    <label>Reference given by</label>
                                                                    <div class="controlsData" id="referenceGivenByDiv">
                                                                        ${contact.referenceGivenBy}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Family Background</label>
                                                                    <div class="controlsData" id="familyBackgroundDiv">
                                                                        ${contact.familyBackground}
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Additional Information</label>
                                                                    <div class="controlsData">
                                                                        <div class="form">
                                                                            <div class="form-group">
                                                                                <textarea id="additionalInformation" class="form-control" rows="6" ></textarea>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <input type="button" value="submit" onclick="saveQuestionRemark()" class="btn btn-primary"/>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Additional Information</label>
                                                                    <div class="controlsData">
                                                                        <div class="form">
                                                                            <div class="form-group" id="additionalInformationRemark">

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </section>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--email starts-->
                            <div id="email" class="modal fade" role="dialog" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Email</h4>
                                        </div><br/>
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a data-toggle="tab" data-target="#homeEmail" attremail="" href="#" onclick="email($(this).attr('attremail'))" class="tabHeadSM tabPaddLeft" id="homeEmails">Email History</a></li>
                                            <li><a data-toggle="tab" href="#addEmail" id="addMailNewForm" class="tabHeadSM tabPaddLeft">Add new email</a></li>

                                        </ul>

                                        <div class="tab-content">
                                            <div id="homeEmail" class="tab-pane fade in active">
                                                <div class="modal-body">
                                                    <h3>Email History</h3>
                                                    <div id="emailHistory">

                                                    </div>
                                                </div>
                                            </div>



                                            <div id="addEmail" class="tab-pane fade">
                                                <div class="modal-body">


                                                    <div class="col-lg-12">
                                                        <div class="formHEADDiv whiteBG">
                                                            <div class="formHead"> <img src="${pageContext.request.contextPath}/img/icons/userDetailIcon.png" alt="Icon"/> <span>Add new Email</span></div>

                                                        </div>
                                                        <form method="post" action="saveEmail"  id="ratesId" enctype="multipart/form-data"> 


                                                            <section>
                                                                <div class="formDATA">
                                                                    <label>To*</label>
                                                                    <div class="controlsData">
                                                                        <input type="text" style="text-transform: none;" id="recepientIds" name="email.recepientIds"/>
                                                                        <label  id="recepientIdsValidate" style="color:red;width: 100%;display: none;"/>Please enter recepients</label>
                                                                    </div>

                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Subject*</label>
                                                                    <div class="controlsData">
                                                                        <input type="text"  id="emailSubject" name="email.subject"/>
                                                                        <label  id="emailSubjectValidate" style="color:red;display: none;width: 100%;">Please enter subject</label>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">

                                                                    <label value="Content*" >Content</label>
                                                                    <div class="controlsData">
                                                                        <div class="form">

                                                                            <div class="form-group">

                                                                                <textarea id="emailContent" class="form-control ckeditor " rows="6" ></textarea>
                                                                                <input type="text" id="emailContent1" style="display:none" rows="6" name="email.content">

                                                                            </div>

                                                                        </div>
                                                                        <!--                                                                        <input type="textarea"  id="emailContent" name="email.content"/>-->
                                                                        <label  id="emailContentValidate" style="color:red;display: none;width: 100%;"/>Please enter content</label>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label value="Signature" >Signature</label>
                                                                    <div class="controlsData">
                                                                        <input type="radio" name="email.signature" value="1" checked> Yes
                                                                        <input type="radio" name="email.signature" value="2"> No<br>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label value="Attachment" />Attachment</label>
                                                                    <div class="controlsData">
                                                                        <input type="file" name="email.emailAttachment" />
                                                                        <input type="hidden" name="email.contactId" id="emailcontactId" >
                                                                    </div>
                                                                </div>
                                                                <div class="loading" style="top: 50% !important;">
                                                                    <img src="../img/loader1.gif" id="loading"  style="display:none;">
                                                                </div>
                                                                <div class="formDATA">
                                                                    <input type="submit" value="submit" onclick="return saveEmail()" class="btn btn-primary"/>
                                                                </div>
                                                            </section>

                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                            <!--                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                        </div>
                                    </div>



                                </div>

                            </div>

                        </div>
                    </div>

                    <!--email ends--> 

                    <!--follow up starts-->
                    <div id="followup" class="modal fade" role="dialog" >
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Follow-Up</h4>
                                </div><br/>
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#homeFollowup"  class="tabHeadSM tabPaddLeft">Followup History</a></li>
                                    <!--                                    <li><a data-toggle="tab" href="#addNewFollowup"  class="tabHeadSM tabPaddLeft">Add new followup</a></li>
                                                                        <li><a data-toggle="tab" href="#rescheduleFollowup"  class="tabHeadSM tabPaddLeft">Reschedule Followup</a></li>
                                                                        <li><a data-toggle="tab" href="#closeFollowup"  class="tabHeadSM tabPaddLeft" >Close</a></li>-->



                                </ul>

                                <div class="tab-content">
                                    <div id="homeFollowup" class="tab-pane fade in active">
                                        <div class="modal-body">
                                            <!-- Add Follow up start-->
                                            <div class="addfollowup">
                                                <h3 class="popupheads">Add New Follow-Up</h3>
                                                <div class="formDATA followup">
                                                    <label>Subject*</label><br/>
                                                    <div class="controlsData controlWidth">
                                                        <select id="projectId">
                                                            <option value="0">--Select--</option>
                                                            <option value="3">Matching</option>
                                                            <option value="4">Meeting</option>
                                                            <option value="2">Payment</option>
                                                            <option value="1">Renewal</option>
                                                        </select>                                
                                                        <label  id="validateProject" style="color:red;display:none;" >Please select project </label>
                                                    </div>

                                                </div>
                                                <div class="formDATA followup">
                                                    <label>Details*</label><br/>
                                                    <div class="controlsData controlWidth">
                                                        <input type="text"  id="content" >
                                                    </div>
                                                    <label  id="validateContent" class="validationMesssage" style="color:red;display:none;" >Please enter content </label>
                                                </div>

                                                <div class="formDATA followup">
                                                    <div class="col-lg-6">
                                                        <label value="Next Date*" >Next Date*</label><br/>
                                                        <div class="controlsData controlWidth">
                                                            <input class="form-control" id="nextDate" type="text" placeholder="Next Date"  />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label value="Next Date*" >Time</label><br/>
                                                        <input id="timepicker1" type="text" name="timepicker1" class="form-control" style="height: 30px !important;"/>
                                                    </div>


                                                    <label id="validateDate" class="validationMesssage"  style="color:red;display:none;">Please select date</label>
                                                </div>

                                                <div class="formDATA followupgo">

                                                    <input type="submit"  onclick="return saveFollowUp()" value="Go" class="btn btn-go btn-margin">
                                                </div>
                                                <input type="hidden"  id="followupContactId"  >
                                            </div>
                                            <!-- Add Follow up ends-->
                                            <!-- fOLLOWUP START-->
                                            <h3 class="popupheads">Follow-Up History</h3>



                                            <div id="followupHistory">

                                            </div>
                                            <!-- fOLLOWUP ends-->

                                            <!-- close tab start-->
                                            <!--                                            <section  id="closeFollowupSection">
                                                                                            <div class="addfollowup">
                                                                                                <h3 class="popupheads">Close Followup</h3>
                                                                                                <div class="controlsData controlWidth">
                                                                                                    <input type="text" id="closeFollowupContent"/>
                                                                                                    <input type="hidden" id="ccontactId"/>
                                                                                                    <input type="hidden" id="cfollowupId"/>
                                                                                                </div>
                                                                                                <div class="formDATA followupgo">
                                                                                                    <input type="submit"  onclick="return closeFollowup()" value="Go" class="btn btn-go btn-margin">
                                                                                                </div>
                                                                                            </div>
                                                                                        </section>-->
                                            <!-- close tab ends-->

                                        </div>
                                    </div>                                                                                             
                                </div>




                                <div class="modal-footer">

                                    <!--                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                </div>
                            </div>

                        </div>

                    </div>


                    <!--follow up ends-->


                    <div id="myModal" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Authentication </h4>
                                </div>
                                <div class="modal-body">
                                    <form action="updateExpiry" method="post">


                                        <table id="authenticationTable" style="border: 0!important;width:100%;">
                                            <tr>
                                                <td>
                                                    Office
                                                </td>
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Category</td>
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                            </tr>

                                            <tr id="checkBoxCategoryId">
                                                <td>
                                                    Category Permission
                                                </td>
                                                <td colspan="2">

                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    Package
                                                </td>
                                                <td colspan="2">

                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="3" class="authenticationCategoryTabel">


                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Expiry Date 
                                                </td>
                                                <td colspan="2">

                                                </td>
                                            </tr>
                                        </table>   
                                        <div style="width: 100%; text-align: center; margin: 10px 0"> <a onclick="return updateExpiry()" class="btn btn-primary">save</a></div>
                                    </form>

                                </div>
                                <div class="modal-footer">

                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--feedBack ends-->
                    <!--payment starts-->
                    <div id="payment" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Payment </h4>
                                </div>
                                <div class="modal-body">


                                    <div id="paymentDiv">

                                    </div>




                                </div>
                                <div class="modal-footer">

                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal"></button>-->
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--payment ends-->
                    <!--short starts-->
                    <div id="shortList" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">
                            <!--<form action="emailBioData" method="post">-->
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Short List </h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="contact.contactId"  id="ocontactId">

                                    <table>
                                        <tr>
                                            <td>Send By: </td>
                                            <td><input type="radio" value="1"  id="intMailBy" name="email" checked> Email
                                                <input type="radio"  value="2" id="intMailBy" name="email"> By Hand
                                                <input type="hidden" name="contact.email" id="emailForShortList"/>
                                                <input type="hidden" name="contact.mailType" id="mailType"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                To:
                                            </td>
                                            <td>
                                                <div class="controlsData"><input type="email" name="contact.mailTo" id="mailTo" readonly="true" value="${contact.email}"/></div>
                                            </td>
                                        </tr>
                                        <!--                                            <tr>
                                                                                        <td>                                                           
                                                                                            Template:
                                                                                        </td>
                                                                                        <td>
                                                                                            <div class="controlsData" id="templateDivId">
                                        
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>-->
                                        <tr>
                                            <td>                                                           
                                                Add Email:
                                            </td>
                                            <td>
                                                <div class="controlsData" > <input type="email" name="contact.emailRef" id="emails"/></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Note:
                                            </td>
                                            <td>
                                                <div class="controlsData controlWidth"><textarea id="mailNote" name="contact.mailNote"  style="height: 250px"></textarea></div>
                                            </td>
                                        </tr>
                                    </table>

                                    <div  id="shortListData">

                                    </div>
                                </div>
                                <div class="modal-footer">

                                    <button type="button" class="btn btn-default" style="display:none;" data-dismiss="modal" id="shortListClose">Close</button>

                                </div>
                                <div class="modal-footer">

                                </div>
                            </div>
                            <!--</form>-->
                        </div>
                    </div>
                    <!--short ends-->
                    <!--lock Profile starts-->
                    <div id="lockProfile" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">
                            <form action="updateLock" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Pause Profile</h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="lockProfileTrail.contactId"  id="lockProfileContactId">
                                        <table>
                                            <tr>
                                                <td>From Date: </td>
                                                <td>
                                                    <div class="controlsData">
                                                        <input type="text" name="lockProfileTrail.fromDateString" required="true" id="lockFromDate" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    To Date:
                                                </td>
                                                <td>
                                                    <div class="controlsData">
                                                        <input type="text" name="lockProfileTrail.toDateString" required="true" id="lockToDate" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Remark:
                                                </td>
                                                <td>
                                                    <div class="controlsData controlWidth">
                                                        <textarea name="lockProfileTrail.remark" required="true" id="lockRemark" ></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer" align="center">
                                        <input type="submit" value="Pause" class="btn btn-default"  />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--lock Profile ends-->
                    <!--pause Profile starts-->
                    <div id="pauseProfile" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">
                            <form action="updateAuthorization" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Open Profile</h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="lockProfileTrail.contactId"  id="pauseProfileContactId">
                                        <table>
                                            <tr>
                                                <td>
                                                    Remark:
                                                </td>
                                                <td>
                                                    <div class="controlsData controlWidth">
                                                        <textarea  name="lockProfileTrail.remark" required="true" id="lockRemark" ></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    Send Mail <input type="checkbox" name="lockProfileTrail.sendMailFlag" value="1"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer" align="center">
                                        <input type="submit" value="Open" class="btn btn-default"  />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--pause Profile ends-->
                    <!--open Profile starts-->
                    <div id="openProfile" class="modal fade authenticationDiv" role="dialog">
                        <div class="modal-dialog">
                            <form action="updatePauseStatus" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Hold Profile</h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="lockProfileTrail.contactId"  id="openProfileContactId">
                                        <table>
                                            <tr>
                                                <td>
                                                    Remark:
                                                </td>
                                                <td>
                                                    <div class="controlsData controlWidth">
                                                        <textarea  name="lockProfileTrail.remark" required="true" id="lockRemark" ></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer" align="center">
                                        <input type="submit" value="Hold" class="btn btn-default"  />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--open Profile ends-->
                    <!--copy from here-->
                    </div>
                    </div>
                </section>
            </section>
        </section>
        <datalist id="searchNameHeader" style="display:none;">

            <%
                List contactList=new ProfileManager().getContactListByNameHeader();
                for (int i = 0; i < contactList.size(); i++) {
                    Contact contact = (Contact) contactList.get(i);
            %>
            <option value="<%=contact.getFirstName()%> <%=contact.getMiddleName()%> <%=contact.getLastName()%> <%=contact.getProfileId()%>"> </option>
            <%
                }
            %>

        </datalist>                          
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <script>
            $(function () {
                fetchCityListAuto();
                var newAvailableTags = document.getElementById('cityAuto').value;
                var abc = newAvailableTags.substring(1, newAvailableTags.length - 1);
                var def = abc.split(",");
                function split(val) {
                    return val.split(/,\s*/);
                }
                function extractLast(term) {
                    return split(term).pop();
                }

                $("#tags")
                        // don't navigate away from the field on tab when selecting an item
                        .bind("keydown", function (event) {
                            if (event.keyCode === $.ui.keyCode.TAB &&
                                    $(this).autocomplete("instance").menu.active) {
                                event.preventDefault();
                            }

                            newAvailableTags = document.getElementById('cityAuto').value;
                            abc = newAvailableTags.substring(1, newAvailableTags.length - 1);
                            def = abc.split(",");
                        })
                        .autocomplete({
                            minLength: 0,
                            source: function (request, response) {
                                // delegate back to autocomplete, but extract the last term
                                response($.ui.autocomplete.filter(
                                        def, extractLast(request.term)));
                            },
                            focus: function () {
                                // prevent value inserted on focus
                                return false;
                            },
                            select: function (event, ui) {
                                var terms = split(this.value);
                                // remove the current input
                                terms.pop();
                                // add the selected item
                                terms.push(ui.item.value);
                                // add placeholder to get the comma-and-space at the end
                                terms.push("");
                                this.value = terms.join(", ");
                                return false;
                            }
                        });
            });

            $(function () {
                fetchEducationListAuto();
                var newAvailableTags = document.getElementById('educationAuto').value;

                var abc = newAvailableTags.substring(1, newAvailableTags.length - 1);
                var def = abc.split(",");
                function split(val) {
                    return val.split(/,\s*/);
                }
                function extractLast(term) {
                    return split(term).pop();
                }

                $("#tags1")
                        // don't navigate away from the field on tab when selecting an item
                        .bind("keydown", function (event) {

                            if (event.keyCode === $.ui.keyCode.TAB &&
                                    $(this).autocomplete("instance").menu.active) {
                                event.preventDefault();
                            }
                            newAvailableTags = document.getElementById('educationAuto').value;
                            abc = newAvailableTags.substring(1, newAvailableTags.length - 1);
                            def = abc.split(",");
                        })
                        .autocomplete({
                            minLength: 0,
                            source: function (request, response) {
                                // delegate back to autocomplete, but extract the last term
                                response($.ui.autocomplete.filter(
                                        def, extractLast(request.term)));
                            },
                            focus: function () {
                                // prevent value inserted on focus
                                return false;
                            },
                            select: function (event, ui) {
                                var terms = split(this.value);
                                // remove the current input
                                terms.pop();
                                // add the selected item
                                terms.push(ui.item.value);
                                // add placeholder to get the comma-and-space at the end
                                terms.push("");
                                this.value = terms.join(", ");
                                return false;
                            }
                        });
            });
        </script>
        <!--<script src="../js/jquery.js"></script>-->
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <script src="../js/bootstrap-wysiwyg.js"></script>
        <script src="../js/bootstrap-wysiwyg-custom.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>
        <link href="../css/timepicki.css" rel="stylesheet">
        <script src="../js/timepicki.js"></script>

        <script src="../js/scripts.js"></script>
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#example1').datepicker({
                    format: "dd/mm/yyyy"

                });
                $('#example1').on('changeDate', function (ev) {
                    $(this).datepicker('hide');
                });
                $('#example2').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#example2').on('changeDate', function (ev) {
                    $(this).datepicker('hide');
                });
                $('#nextDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#nextDate').on('changeDate', function (ev) {
                    $(this).datepicker('hide');
                });
                $('#lockFromDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#lockFromDate').on('changeDate', function (ev) {
                    $(this).datepicker('hide');
                });

                //                                                            $('#lockToDate').on('changeDate', function (ev) {
                //                                                                $(this).datepicker('hide');
                //                                                            });
                $('#timepicker1').timepicki();



                $('#lockToDate').datepicker({
                    format: "dd/mm/yyyy",
                    startDate: new Date()
                });

            });


        </script>



        <script>
            $(document).ready(function ()
            {
                var hiddenUntouchedFlag = document.getElementById("hiddenUntouchedFlag").value;
                if (hiddenUntouchedFlag === "1")
                {
                    document.getElementById("untouchedId").checked = true;
                }
                $('#search').keyup(function ()
                {
                    //                alert($(this).val());
                    searchTable($(this).val());
                });
                $('#txtAutoComplete').keypress(function (e) {
                    if (e.keyCode == 13)
                        $('#searchMagnifyButton').click();
                });
                $("#ratesId").submit(function (e) {
                    var formObj = $(this);
                    var formUrl = formObj.attr("action");
                    var formData = new FormData(this);
                    //                    $("#frontLoadingPanelId").addClass("frontLoadingPanel");
                    document.getElementById('loading').style.display = "block";

                    $.ajax({
                        url: formUrl,
                        type: 'POST',
                        data: formData,
                        mimeType: 'multipart/form-data',
                        contentType: false,
                        cache: false,
                        processData: false,
                        success: function (html, textStatus, jqXHR) {
                            $("#messageId").html(html);
                            document.getElementById('loading').style.display = "none";
                            $("input[type=file]").val("");
                            document.getElementById('emailSubject').value = "";
                            CKEDITOR.instances.emailContent.setData('');
                            document.getElementByClass('ckeditor').value = "";

                        }, error: function (jqXHR, textStatus, errorThrown) {

                        }
                    });
                    e.preventDefault();
                    e.unbind();
                });

                document.getElementById('txtAutoCompleteHeader').style.display = "block";
                document.getElementById('searchMagnifyButtonHeader').style.display = "block";
            });
            function unlockProfile()
            {
                if (confirm('Are you sure You Want to unlock this Profile?')) {
                } else {
                    return false;
                }
            }
            document.getElementById('txtAutoComplete').addEventListener('input', function () {
                var val = document.getElementById("txtAutoComplete").value;
                var data = val.split(" ");
                if (data.length > 4)
                {
                    document.getElementById('searchMagnifyButton').click();
                }
            });

            function searchTable(inputVal)
            {
                var table = $('#contactListId');
                table.find('tr').each(function (index, row)
                {

                    var allCells = $(row).find('td');
                    //                    alert(allCells);
                    if (allCells.length)
                    {
                        var found = false;
                        allCells.each(function (index, td)
                        {
                            var regExp = new RegExp(inputVal, 'i');
                            if (regExp.test($(td).text()))
                            {
                                found = true;
                                return false;
                            }
                        });
                        if (found == true)
                        {
                            $(row).show();
                        } else
                        {
                            $(row).hide();
                        }


                    }
                });
            }

            $('input:checkbox').on('click', function (e) {
                e.stopImmediatePropagation();

                var checked = (e.currentTarget.checked) ? false : true;
                e.currentTarget.checked = (checked) ? false : checked.toString();
            });

        </script>
        <script>
            $(function () {
                var availableTutorials1 = document.getElementById('contactListAll').value;
                var abc = availableTutorials1.substring(1, availableTutorials1.length - 1);
                var availableTutorials = abc.split(",");
                $("#txtAutoComplete").autocomplete({
                    source: availableTutorials,
                    select: function (event, ui) {
                        // do something when an item from the list is selected, for example:
                        var data = ui.item.value.split(" ");
                        if (data.length > 4)
                        {
                            document.getElementById('txtAutoComplete').value = ui.item.value;
                            document.getElementById('searchMagnifyButton').click();
                        }
                    }

                });

            });
        </script>
    </body>
</html>
