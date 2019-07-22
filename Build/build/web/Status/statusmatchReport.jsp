<%-- 
    Document   : status
    Created on : 12 Apr, 2016, 7:31:16 PM
    Author     : OpenSpace004
--%>
<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="java.util.List"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page language="java" import="com.crm.manager.ProfileManager"%>
<%@ taglib prefix="s" uri="/struts-tags" %>       
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subhlagan - A Bond Of Trust </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>

        <!--Do not remove - this is common css for subhlagan-->
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style-responsive.css" rel="stylesheet" />
        <link href="../css/subhlagan-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/datepicker.css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <!-- <link href="../css/bootstrap-timepicker.min.css" rel="stylesheet"/>-->
        <link href="../css/timepicki.css" rel="stylesheet">
        <link href="../css/elegant-icons-style.css" rel="stylesheet" />
        <link href="../css/magnific-popup.css" rel="stylesheet" /> 
        <link href="../css/font-awesome.min.css" rel="stylesheet" />

        <script src="../js/statusmatchreport.js"></script>
        <!--<link rel="stylesheet" href="/resources/demos/style.css">-->

        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />
        <script src="../js/jquery.js"></script>
        <!--<link rel="stylesheet" href="/css/jquery-ui.css">-->
        <script src="../js/jquery-1.10.2.js"></script>
        <script src="../js/jquery-ui.js"></script>
        <!--        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>-->
        <script type="text/javascript" src="../js/jquery.multiselect.min.js"></script>
        <script src="../js/rotate.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/jquery.multiselect.css" />
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
        <script src="../js/jquery.magnific-popup.js"></script> 
        <script type="text/javascript">

            $(function () {
                $("#newSelect").multiselect({
                    noneSelectedText: "Category",
                    selectedText: "# Category"
                });

            });
            $(function () {
                $("#newSelect1").multiselect({
                    noneSelectedText: "Community",
                    selectedText: "# Community"
                });
            });
            $(function () {
                $("#countryId").multiselect({
                    noneSelectedText: "Country",
                    selectedText: "# Country"
                });
            });
        </script>

        <!-- For media - TAB autosearch -->
        <script src="../js/DatalistPolyfill.js"></script>


    </head>

    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">

                    <!-- ### check for profile is is null then not show content ### -->
                    <c:if test="${contact.profileId eq null}">
                        <script>
                            document.getElementById('txtAutoCompleteHeader').style.display = "block";
                            document.getElementById('msg').style.display = "block";
                        </script>
                        <c:set var="display" value="display:none;" ></c:set>
                            <div id="msg" style="margin-top: 100px;margin-left: 35%;"> Searched person belongs to other category.</div>
                    </c:if>

                    <c:if test="${contact.approved==0 || contact.lockFlag == 1}">
                        <c:set var="display" value="display:none;" ></c:set>
                        <div id="msg" style="margin-top: 100px;margin-left: 35%;"> This contact is not authorized to search match.</div>
                    </c:if>



                    <div class="row" style="${display}">
                        <div class="col-lg-12 marginTOP">
                            <div class="headerMainContent">
                                <h4 class="candidateName"> <a style="color:#000000;text-decoration: none;" href="getContactDetail?contactId=${contact.contactId}" target="_blank" >${contact.firstName} ${contact.middleName} ${contact.lastName}</a></h4>
                                <!--copy till here-->

                                <div class="col-lg-12 paddingNone collapse in" id="collapse1" >
                                    <br/>
                                    <div class="col-lg-1 col-sm-2 candidateimgPlace paddingNone">
                                        <a href="getContactDetail?contactId=${contact.contactId}" target="_blank" >
<!--                                            <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1}" height="100" width="80"></img> -->
                                            <img src="${profileimgPath}${contact.image1}" height="100" width="80"></img> 
                                        </a>
                                    </div>
                                    <input type="text" id="categoryPermissionString" value="${contact.categoryPermissionString}"  style="display:none;">
                                    <input type="text" id="cityAuto" value="${cityList1}" style="display:none;">
                                    <input type="text" id="educationAuto" value="${educationList1}" style="display:none;">
                                    <input type="text" id="kundaliContactId" value="${contact.contactId}" style="display:none;"/>
                                    <input type="text" id="statusFlag" value="${request.getParameter("statusFlag")}" style="display:none;" />
                                    <input type="text" id="twoWayFlag" value="${request.getParameter("twoWayFlag")}" style="display:none;" />
                                    <input type="hidden" id="searchContactId"  />
                                    <input type="hidden" id="contactIdForSentBioDataUnique" value="${contact.contactId}"/>
                                    <input type="hidden" id="emailFlagIcon" value="${request.getParameter("emailFlagIcon")}"/>


                                    <div  class="col-lg-9 col-sm-7 addingNone">
                                        <div class="col-lg-4 paddingNone">
                                            <div class="profileMatchData">
                                                <label>Profile Id: </label>
                                                <span>
                                                    ${contact.category}${contact.profileId} (<span style="color:#f44a4a">${contact.assignedToString}</span>) ${contact.assignedToArm}

                                                </span>
                                            </div>
                                            <div class="profileMatchData">
                                                <label>D.O.B</label>
                                                <span>${contact.dobString}(${contact.age} Years)</span>
                                            </div>
                                            <div class="profileMatchData">
                                                <label>Height:</label>
                                                <span>${contact.heightString}</span>
                                            </div>
                                            <!--                                            <div class="matchTopDataLeft">
                                                                                            <span> Profile Id: </span>
                                                                                            <span>D.O.B.</span>
                                                                                            <span>Height:</span>
                                                                                            <span> Education:</span>
                                            
                                                                                        </div>-->
                                            <!--                                            <div class="matchTopDataRight" style="width:62% !important">
                                                                                            <span>
                                            ${contact.category}${contact.profileId}(${contact.assignedToString})

                                        </span>
                                        <span>${contact.dobString}</span>
                                        <span>${contact.heightString}</span>
                                        <span>${contact.educationIntro}</span>
                                        <span></span>
                                    </div>-->
                                        </div>

                                        <!--<div class="col-lg-4">-->
                                        <div class="col-lg-4 paddingNone">
                                            <!--<div class="profileMatchData">-->
                                            <div class="profileMatchData">
                                                <label>Community: </label>
                                                <span> ${contact.communityName}</span>
                                            </div>
                                            <!--                                            <div class="profileMatchData">
                                                                                            <label>Category:</label>
                                                                                            <span>${contact.category}</span>
                                                                                        </div>-->

                                            <div class="profileMatchData">
                                                <label>Gotra :</label>
                                                <span>${contact.gotraName}</span>
                                            </div>

                                            <div class="profileMatchData">
                                                <label>City:</label>
                                                <span>${contact.presentCity}</span>
                                                <!--<span>{contact.city}</span>-->
                                            </div>
                                            <!--                                            <div class="matchTopDataLeft">
                                                                                            <span>Community: </span>
                                                                                            <span>Category:</span>
                                                                                            <span>City:</span>
                                            
                                                                                        </div>-->

                                            <!--                                            <div class="matchTopDataRight">
                                                                                            <span> ${contact.communityName}</span>
                                                                                            <span>${contact.category}</span>
                                                                                            <span>${contact.city}</span>
                                            
                                                                                        </div>-->
                                        </div>
                                        <div class="col-lg-4 paddingNone">
                                            <div class="profileMatchData">
                                                <label>Native:</label>
                                                <span>${contact.nativeData}</span>
                                            </div>
                                            <div class="profileMatchData">
                                                <label>Education</label>
                                                <span>${contact.educationIntro}</span>
                                            </div>
                                            <!--                                            <div class="profileMatchData">
                                                                                            <label>Reg Date:</label>
                                                                                            <span>${contact.statusRegDate}</span>
                                                                                        </div>-->
                                            <div class="profileMatchData">
                                                <label>Contact :</label>
                                                <span>${contact.mobile1}</span>
                                            </div>
                                            <!--                                            <div class="matchTopDataLeft">
                                            
                                                                                            <span>Native:</span>
                                            
                                                                                            <span>Education</span>
                                                                                            <span style="min-height: 38px">Reg Date:</span>
                                            
                                                                                        </div>-->

                                            <!--                                            <div class="matchTopDataRight">
                                            
                                                                                            <span>${contact.nativeData}</span>
                                            
                                                                                            <span>${contact.educationIntro}</span>
                                                                                            <span>${contact.regDateString}</span>
                                                                                        </div>-->
                                        </div>                                    
                                    </div>
                                    <div class="col-lg-2 col-sm-3 inboxMessageDiv">
                                        <div class="inboxMessageDivInner">                                             
                                            <div class="inboxmessageNumber">
                                                <span id="size">

                                                </span>
                                            </div>                                             
                                            <img src="../img/emailImage.png"/>
                                            <span>
                                                <a  data-toggle="modal" data-target="#myModal3" onclick="fetchOutBoxData()" >
                                                    View OutBox
                                                </a>
                                            </span>
                                        </div>
                                    </div>

                                </div>



                            </div>
                            <ul class="nav nav-tabs">
                                <input type="hidden" id="divideList" value="0"  />
                                <c:if test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16) && (userSession.deptId!=18) && (userSession.deptId!=10) && (userSession.deptId!=11)}"> <!-- conditions Added by Vineet on 24-11-2016 -->
                                    <li class="active"><a data-toggle="tab" id="matchReportId" href="#home" onclick="return matchReportIndi(${contact.contactId});">Match Report</a></li>
                                    <!--<li class="active"><a data-toggle="tab" id="matchReportId" href="#home" onclick="return matchReportIndi();">Match Report</a></li>-->
                                </c:if>
                                <li><a data-toggle="tab" id="statusReportTab"  href="#menu1" onclick="statusReportIndividual(${contact.contactId})">Status Report</a></li>
                                <div class="reportActionDiv">
                                    <table class="borderNoneTable">
                                        <tr>
                                            <td>
                                                <a href="#menus2" id="emailTabMenuDisplay"   data-toggle="tab" class="reportAction emailreportAction"  onclick="fetchEmailStatusFinal(${contact.contactId})" ></a>
                                                <!--<a href="#menus2" id="emailTabMenuDisplay"   data-toggle="tab" class="reportAction emailreportAction"  onclick="fetchEmailStatusFinal(${contact.contactId})" ></a>-->

                                                <a id="men3" href="#menus3"  data-toggle="tab" class="reportAction feedbackreportAction"  onclick="feedbackNewEdit(${contact.contactId})"></a>
                                                 <!--<a id="men3" href="#menus3"  data-toggle="tab" class="reportAction feedbackreportAction"  onclick="feedbackNewEdit(${contact.contactId})"></a>-->

<!--<a href="#menus4"  data-toggle="tab" class="reportAction followreportAction" title="Follow-up" onclick="followUpStatusFinal(${contact.contactId})"></a>-->

                                                <a href="#menus5"  data-toggle="tab" class="reportActionDivstatus actlogAction"  onclick="fetchActivityLog(${contact.contactId})"></a>

<!--<a href="#menus5"  data-toggle="tab" class="reportActionDivstatus actlogAction" onclick="fetchActivityLog(${contact.contactId})"></a>-->
                                                <!--<a  data-toggle="tab" class="reportAction editreportAction" ></a>-->

                                            </td>
                                        </tr>
                                    </table>
                                    <div class="loading">
                                        <img src="../img/loader1.gif" id="loading" style="display:none;" >
                                    </div>
                                </div>
                                <div class="statusFloatRight">

                                    <input type="hidden" value="${userSession.deptId}" id="deptId">
                                    <a class="listviewStyle "  id="listView" onclick="showdivStatus(${contact.contactId})" href="#statusList1"   ><img src="../img/icons/listview.png"/></a>
                                    <a  id="listView"  class="listViewStatus" onclick="statusReportIndividual(${contact.contactId})" href="#statusList1"   ><img src="../img/icons/listview1.png"/></a>

                                    <a  style="display:none" class="listviewStyle"  id="gridViewMatch" onclick="showMatchDiv(${contact.contactId})" href="#matchList"  ><img src="../img/icons/listview.png"/></a>
                                    <a style=" display:none" id="listViewMatch" onclick="MatchReportIndividual(${contact.contactId})" href="#matchList1"   ><img src="../img/icons/listview1.png"/></a>
                                    <a  style="color: #F44A4A;padding: 2px 0 0 14px;"   data-toggle="collapse" href="#collapse1" class="pull-right"><i id="collapseIcon" class="glyphicon glyphicon-chevron-up"></i></a>
                                    <!--<img id="collapseIcon" src="../img/icons/boyGreenIcon.png"/>-->
                                </div>

                            </ul>

                            <div class="tab-content">

                                <!--                                  <div id="all"  class="tab-pane fade ">
                                                                    all
                                                                </div>-->
                                <!--                                <div id="sent"  class="tab-pane fade ">
                                                                    sent
                                                                </div>
                                                                <div id="received"  class="tab-pane fade ">
                                                                    received
                                                                </div>
                                                                <div id="both"  class="tab-pane fade ">
                                                                    both
                                                                </div>
                                                                <div id="rejected"  class="tab-pane fade ">
                                                                    rejected
                                                                </div>-->
                                <c:if test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16) && (userSession.deptId!=18) && (userSession.deptId!=10) && (userSession.deptId!=11)}">
                                    <div id="home" class="tab-pane fade in active">
                                        <div class="col-lg-12">
                                            <div class="matchprofileDetailTABS">
                                                <div class="nameSearch" id="searchDivMatchList">
                                                    <div class="nameSearchInner" style="margin-top: 6px;">
                                                        <input type="text" id="searchBy" list="searchName" name="contact.search"  placeholder="Search by Name " />
                                                        <!--<input type="text" id="searchBy" list="searchNameHeader" name="contact.search"  placeholder="Search by Name Header " />-->
                                                        <!--your input textbox-->
                                                        <input type="submit" value="" id="searchBy" class="searchButton" onclick="searchMatchList()">
                                                    </div>
                                                </div>
                                                <a class="matchtabLink active" href="#home"  onclick="displaySearch()" id="searchTab">
                                                    <!--                                                <div class="dropdown1">
                                                    --><img title="Search" src="${pageContext.request.contextPath}/img/icons/search.png"/>

                                                    <!--                                                    <div class="dropdown-content1">
                                                                                                            
                                                                                                            <select name="contact.matchStatus" style="z-index: 11;">
                                                                                                                <option value="-1">Match Status</option>
                                                                                                                <option value="1">Accept(One Way)</option>
                                                                                                                <option value="2">Accept(Two Way)</option>
                                                                                                                <option value="-3">Reject(One Way)</option>
                                                                                                                <option value="-4">Reject(Two Way)</option>
                                                                                                                <option value="-5">Pending(One Way)</option>
                                                                                                                <option value="6">Pending(One Way)</option>
                                                                                                            </select>
                                                                                                       
                                                                                                            
                                                                                                        </div>-->
                                                    <!--</div>-->
                                                </a>
                                                <!--<a class="matchtabLink" href="#all" data-toggle="tab">All</a>-->
                                                <a class="matchtabLink" href="#sent" onclick="displaySent(${contact.contactId}, 1)"><img title="Sent" src="${pageContext.request.contextPath}/img/Sent_2.jpg"/></a>
                                                <a class="matchtabLink" href="#received"  onclick="displaySent(${contact.contactId}, 2)"><img title="Received" src="${pageContext.request.contextPath}/img/Received_2.jpg"/></a>
                                                <a class="matchtabLink" href="#both"  onclick="displaySent(${contact.contactId}, 3)"><img title="Both" src="${pageContext.request.contextPath}/img/Both.jpg"/></a>
                                                <a class="matchtabLink " onclick="displaySent(${contact.contactId}, 4)"><img title="Rejected" src="${pageContext.request.contextPath}/img/Rejected_Me.jpg"/></a>
                                                <a class="matchtabLink " onclick="displaySent(${contact.contactId}, 5)"><img title="Rejected One Side" src="${pageContext.request.contextPath}/img/I_Rejected.jpg"/></a>
                                                <a class="matchtabLink " onclick="displaySent(${contact.contactId}, 6)"><img title="Unique Sent" src="${pageContext.request.contextPath}/img/Unique_Sent.png"/></a>
                                                <a class="matchtabLink " onclick="refreshMatchReport()"><img title="Refresh" src="${pageContext.request.contextPath}/img/icons/refresh.png" /></a>
                                                <!--                                                <div class="inboxCount">
                                                                                                    <div class="inboxMessageDivInner">                                             
                                                                                                        <div class="inboxCountNumber" style="color:#0000">
                                                                                                            <span id="sizeForOutBoxCountDisplay" style="color:#0000">
                                                
                                                                                                            </span>
                                                                                                        </div>                                             
                                                                                                    </div>
                                                                                                </div>-->
                                                <!--                                                <input type="text" id="searchBy" list="searchName" name="contact.search"  placeholder="Search by Name " />your input textbox
                                                                                                <button onclick="searchMatchList()" value="Search">Search</button>-->



                                                <b class="recordDisplay" style="margin-left:20px;display: inline-block;vertical-align: top;padding: 10px 0 0 0;" id="matchHeaderListSizeDuplicate">${matchList.size()} Records found</b>
                                            </div>

                                        </div>
                                        <div id="sent1" style="display:none;">


                                        </div>
                                        <div id="matchReportListDivSentUnique" style="display:none;">


                                        </div>
                                        <div id="received1" style="display:none;">


                                        </div>
                                        <div id="both1" style="display:none;">


                                        </div>
                                        <div id="rejected1" style="display:none;">


                                        </div>
                                        <div id="rejectedoneside1" style="display:none;">


                                        </div>


                                        <div id="search1" style="display:none; position:relative; width:100%">
                                            <div id="sub3" class="searchBlock">

                                                <div class="withMemberDiv">
                                                    <span style="display:none;">
                                                        <select  id="maritalStatus">
                                                            <option value="">Select</option>
                                                            <option ${contact.maritalStatus=="Never Married"?'selected':''} value="">Never Married</option>
                                                            <option ${contact.maritalStatus=="Divorced"?'selected':''} value="">Divorced</option>
                                                            <option ${contact.maritalStatus=="Widowed"?'selected':''} value="">Widowed</option>
                                                        </select>
                                                    </span>

                                                    <span style="display:none;">
                                                        <select  id="gender" >
                                                            <option  value="">Gender</option>
                                                            <option  ${contact.gender=="M"?'selected':''} value="M">Female</option>
                                                            <option  ${contact.gender=="F"?'selected':''} value="F">Male</option>
                                                        </select>     
                                                    </span>
                                                    <!--<span>-->
                                                    <!--                                                    <select  tabindex="7" style="height: 100px;" id="categoryId" name="contact.categoryId" >
                                                                                                            <option value="">Category</option>
                                                    <%--<s:iterator value="categoryList" id="categoryListId">--%>
                                                    <%--<c:if test="${categoryListId.gender==contact.gender}">--%>
                                                        <option value="${categoryListId.categoryId}">${categoryListId.categoryName}</option>
                                                    <%--</c:if>--%>
                                                    <%--</s:iterator>--%>   
                                                </select>  -->
                                                    <!--</span>-->
                                                    <!--<span>-->
                                                    <!--                                                    <div class="selectBox" onclick="showCheckboxes()">
                                                                                                            <select id="catDiv">
                                                                                                                <option>Select Category</option>
                                                                                                            </select>
                                                                                                            <div class="overSelect"></div>
                                                                                                        </div>
                                                                                                        <div id="checkboxes" class="chkbox">
                                                    <%--<s:iterator value="categoryList" id="categoryListId"  status="loop">--%>
                                                    <%--<c:if test="${categoryListId.gender!=contact.gender}">--%>
                                                        <label for="one"><input id="ckbox${categoryListId.categoryId}" type="checkbox" value="${categoryListId.categoryId}"/>${categoryListId.categoryName}</label>
                                                    <%--</c:if>--%>
    
                                                    <%--</s:iterator>--%>   
                                                </div>-->
                                                    <!--</span>-->


                                                    <span>
                                                        <div id="checkboxes" class="chkbox">
                                                            <select class="newSelect" id="newSelect" multiple="multiple" name="example-basic" size="5">
                                                                <s:iterator value="categoryList" id="categoryListId"  status="loop">
                                                                    <c:if test="${categoryListId.gender!=contact.gender}">
                                                                        <option  id="ckbox${categoryListId.categoryId}" value="${categoryListId.categoryId}">${categoryListId.categoryName}</option>
                                                                    </c:if>
                                                                </s:iterator>                   
                                                            </select>
                                                        </div>
                                                    </span>


                                                    <span >
                                                        <div id="checkboxes2" class="chkbox">
                                                            <select  style="margin:0px;" class="newSelect" id="countryId" multiple="multiple" name="example-basic" size="5">
                                                                <s:iterator value="countryList" id="countryListId"  status="loop">                                              
                                                                    <option id="ckbox${countryListId.countryId}" value="${countryListId.countryId}">${countryListId.countryName}</option>                                               
                                                                </s:iterator>                   
                                                            </select>
                                                        </div>
                                                    </span>


                                                    <span>
                                                        <input id="tags" placeholder="city" type="text" >

                                                    </span>



                                                    <span>
                                                        <!--<input type="text" id="searchBy" placeholder="Name"/>-->
                                                        <input id="excludeCity" placeholder="Exclude city" type="text" >


                                                        <input type="hidden" id="ajaxContactId"  value="${contact.contactId}"  /><!--your input textbox-->
                                                        <datalist id="searchName" >
                                                            <s:iterator value="profileList" var="contactListAllId">
                                                                <option value="${contactListAllId.firstName} ${contactListAllId.middleName} ${contactListAllId.lastName} ${contactListAllId.profileId}"> </option>

                                                            </s:iterator>

                                                        </datalist>

                                                    </span>
                                                    <span>
                                                        <select  tabindex="1"  id="partnerage1" style="display: inline-block;vertical-align: top;">   
                                                            <option value="" >Select Age From  </option>
                                                            <option ${contact.desiredPartnersAge1=="18"?'selected':''} value="18" >18</option>
                                                            <option ${contact.desiredPartnersAge1=="19"?'selected':''} value="19" >19</option>
                                                            <option ${contact.desiredPartnersAge1=="20"?'selected':''} value="20" >20</option>
                                                            <option ${contact.desiredPartnersAge1=="21"?'selected':''} value="21">21</option>
                                                            <option ${contact.desiredPartnersAge1=="22"?'selected':''} value="22" >22</option>
                                                            <option ${contact.desiredPartnersAge1=="23"?'selected':''} value="23" >23</option>
                                                            <option ${contact.desiredPartnersAge1=="24"?'selected':''} value="24" >24</option>
                                                            <option ${contact.desiredPartnersAge1=="25"?'selected':''} value="25" >25</option>
                                                            <option ${contact.desiredPartnersAge1=="26"?'selected':''} value="26" >26</option>
                                                            <option ${contact.desiredPartnersAge1=="27"?'selected':''} value="27" >27</option>
                                                            <option ${contact.desiredPartnersAge1=="28"?'selected':''} value="28" >28</option>
                                                            <option ${contact.desiredPartnersAge1=="29"?'selected':''} value="29">29</option>
                                                            <option ${contact.desiredPartnersAge1=="30"?'selected':''} value="30" >30</option>
                                                            <option ${contact.desiredPartnersAge1=="31"?'selected':''} value="31" >31</option>
                                                            <option ${contact.desiredPartnersAge1=="32"?'selected':''} value="32" >32</option>
                                                            <option ${contact.desiredPartnersAge1=="33"?'selected':''} value="33" >33</option>
                                                            <option ${contact.desiredPartnersAge1=="34"?'selected':''} value="34" >34</option>
                                                            <option ${contact.desiredPartnersAge1=="35"?'selected':''} value="35" >35</option>
                                                            <option ${contact.desiredPartnersAge1=="36"?'selected':''} value="36" >36</option>
                                                            <option ${contact.desiredPartnersAge1=="37"?'selected':''} value="37" >37</option>
                                                            <option ${contact.desiredPartnersAge1=="38"?'selected':''} value="38" >38</option>
                                                            <option ${contact.desiredPartnersAge1=="39"?'selected':''} value="39" >39</option>
                                                            <option ${contact.desiredPartnersAge1=="40"?'selected':''} value="40" >40</option>
                                                            <option ${contact.desiredPartnersAge1=="41"?'selected':''} value="41">41</option>
                                                            <option ${contact.desiredPartnersAge1=="42"?'selected':''} value="42">42</option>
                                                            <option ${contact.desiredPartnersAge1=="43"?'selected':''} value="43" >43</option>
                                                            <option ${contact.desiredPartnersAge1=="44"?'selected':''} value="44" >44</option>
                                                            <option ${contact.desiredPartnersAge1=="45"?'selected':''} value="45" >45</option>
                                                            <option ${contact.desiredPartnersAge1=="46"?'selected':''} value="46" >46</option>
                                                            <option ${contact.desiredPartnersAge1=="47"?'selected':''} value="47" >47</option>
                                                            <option ${contact.desiredPartnersAge1=="48"?'selected':''} value="48" >48</option>
                                                            <option ${contact.desiredPartnersAge1=="49"?'selected':''} value="49" >49</option>
                                                            <option ${contact.desiredPartnersAge1=="50"?'selected':''} value="50" >50</option>
                                                            <option ${contact.desiredPartnersAge1=="51"?'selected':''} value="51" >51</option>
                                                            <option ${contact.desiredPartnersAge1=="52"?'selected':''} value="52">52</option>
                                                            <option ${contact.desiredPartnersAge1=="53"?'selected':''} value="53" >53</option>
                                                            <option ${contact.desiredPartnersAge1=="54"?'selected':''} value="54" >54</option>
                                                            <option ${contact.desiredPartnersAge1=="55"?'selected':''} value="55" >55</option>
                                                            <option ${contact.desiredPartnersAge1=="56"?'selected':''} value="56">56</option>
                                                            <option ${contact.desiredPartnersAge1=="57"?'selected':''} value="57" >57</option>
                                                            <option ${contact.desiredPartnersAge1=="58"?'selected':''} value="58" >58</option>
                                                            <option ${contact.desiredPartnersAge1=="59"?'selected':''} value="59" >59</option>
                                                            <option ${contact.desiredPartnersAge1=="60"?'selected':''} value="60">60</option>
                                                            <option ${contact.desiredPartnersAge1=="61"?'selected':''} value="61">61</option>
                                                            <option ${contact.desiredPartnersAge1=="62"?'selected':''} value="62" >62</option>
                                                            <option ${contact.desiredPartnersAge1=="63"?'selected':''} value="63" >63</option>
                                                            <option ${contact.desiredPartnersAge1=="64"?'selected':''} value="64" >64</option>
                                                            <option ${contact.desiredPartnersAge1=="65"?'selected':''} value="65"  >65</option>
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <select  tabindex="1"  id="partnerage2" style="display: inline-block;vertical-align: top;">  
                                                            <option value="">Select Age To  </option>
                                                            <option ${contact.desiredPartnersAge2=="18"?'selected':''} value="18">18</option>
                                                            <option ${contact.desiredPartnersAge2=="19"?'selected':''} value="19">19</option>
                                                            <option ${contact.desiredPartnersAge2=="20"?'selected':''} value="20">20</option>
                                                            <option ${contact.desiredPartnersAge2=="21"?'selected':''} value="21">21</option>
                                                            <option ${contact.desiredPartnersAge2=="22"?'selected':''} value="22">22</option>
                                                            <option ${contact.desiredPartnersAge2=="23"?'selected':''} value="23">23</option>
                                                            <option ${contact.desiredPartnersAge2=="24"?'selected':''} value="24" >24</option>
                                                            <option ${contact.desiredPartnersAge2=="25"?'selected':''} value="25" >25</option>
                                                            <option ${contact.desiredPartnersAge2=="26"?'selected':''} value="26" >26</option>
                                                            <option ${contact.desiredPartnersAge2=="27"?'selected':''} value="27" >27</option>
                                                            <option ${contact.desiredPartnersAge2=="28"?'selected':''} value="28" >28</option>
                                                            <option ${contact.desiredPartnersAge2=="29"?'selected':''} value="29" >29</option>
                                                            <option ${contact.desiredPartnersAge2=="30"?'selected':''} value="30" >30</option>
                                                            <option ${contact.desiredPartnersAge2=="31"?'selected':''} value="31" >31</option>
                                                            <option ${contact.desiredPartnersAge2=="32"?'selected':''} value="32">32</option>
                                                            <option ${contact.desiredPartnersAge2=="33"?'selected':''} value="33" >33</option>
                                                            <option ${contact.desiredPartnersAge2=="34"?'selected':''} value="34" >34</option>
                                                            <option ${contact.desiredPartnersAge2=="35"?'selected':''} value="35" >35</option>
                                                            <option ${contact.desiredPartnersAge2=="36"?'selected':''} value="36" >36</option>
                                                            <option ${contact.desiredPartnersAge2=="37"?'selected':''} value="37" >37</option>
                                                            <option ${contact.desiredPartnersAge2=="38"?'selected':''} value="38" >38</option>
                                                            <option ${contact.desiredPartnersAge2=="39"?'selected':''} value="39" >39</option>
                                                            <option ${contact.desiredPartnersAge2=="40"?'selected':''} value="40">40</option>
                                                            <option ${contact.desiredPartnersAge2=="41"?'selected':''} value="41" >41</option>
                                                            <option ${contact.desiredPartnersAge2=="42"?'selected':''} value="42" >42</option>
                                                            <option ${contact.desiredPartnersAge2=="43"?'selected':''} value="43" >43</option>
                                                            <option ${contact.desiredPartnersAge2=="44"?'selected':''} value="44" >44</option>
                                                            <option ${contact.desiredPartnersAge2=="45"?'selected':''} value="45" >45</option>
                                                            <option ${contact.desiredPartnersAge2=="46"?'selected':''} value="46">46</option>
                                                            <option ${contact.desiredPartnersAge2=="47"?'selected':''} value="47" >47</option>
                                                            <option ${contact.desiredPartnersAge2=="48"?'selected':''} value="48" >48</option>
                                                            <option ${contact.desiredPartnersAge2=="49"?'selected':''} value="49">49</option>
                                                            <option ${contact.desiredPartnersAge2=="50"?'selected':''} value="50" >50</option>
                                                            <option ${contact.desiredPartnersAge2=="51"?'selected':''} value="51" >51</option>
                                                            <option ${contact.desiredPartnersAge2=="52"?'selected':''} value="52" >52</option>
                                                            <option ${contact.desiredPartnersAge2=="53"?'selected':''} value="53" >53</option>
                                                            <option ${contact.desiredPartnersAge2=="54"?'selected':''} value="54" >54</option>
                                                            <option ${contact.desiredPartnersAge2=="55"?'selected':''} value="55" >55</option>
                                                            <option ${contact.desiredPartnersAge2=="56"?'selected':''} value="56" >56</option>
                                                            <option ${contact.desiredPartnersAge2=="57"?'selected':''} value="57" >57</option>
                                                            <option ${contact.desiredPartnersAge2=="58"?'selected':''} value="58" >58</option>
                                                            <option ${contact.desiredPartnersAge2=="59"?'selected':''} value="59" >59</option>
                                                            <option ${contact.desiredPartnersAge2=="60"?'selected':''} value="60" >60</option>
                                                            <option ${contact.desiredPartnersAge2=="61"?'selected':''} value="61" >61</option>
                                                            <option ${contact.desiredPartnersAge2=="62"?'selected':''} value="62" >62</option>
                                                            <option ${contact.desiredPartnersAge2=="63"?'selected':''} value="63">63</option>
                                                            <option ${contact.desiredPartnersAge2=="64"?'selected':''} value="64">64</option>
                                                            <option ${contact.desiredPartnersAge2=="65"?'selected':''} value="65" >65</option>
                                                        </select>
                                                    </span>

                                                </div>
                                                <div class="withPhotosDiv">
                                                    <span>                                                 

                                                        <div id="checkboxes1" class="chkbox">
                                                            <select class="newSelect" id="newSelect1"  multiple="multiple"  size="5">
                                                                <s:iterator value="communityList" id="communityListId"  >                                                     
                                                                    <option value="${communityListId.communityId}">${communityListId.communityName}</option>
                                                                </s:iterator>                   
                                                            </select>
                                                        </div>
                                                    </span>
                                                    <span>
                                                        <select id="gotra">
                                                            <option value="">Same Gotra</option>
                                                            <option value="Yes">Yes</option>
                                                            <option value="No">No</option>
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <input id="tags1" placeholder="Education" type="text"  >

                                                    </span>



                                                    <!--                                                <span>                                          
                                                                                                        <select id="migrate">
                                                                                                            <option value="">Migrate</option>
                                                                                                            <option value="Yes">Yes</option>
                                                                                                            <option value="No">No</option>
                                                                                                        </select>                                                            
                                                                                                    </span>-->
                                                    <span style="display:none;">       
                                                        <select  tabindex="2"  id="motherTongueId"  name="contact.motherTongueId">
                                                            <option value="">mother tongue</option>
                                                            <s:iterator value="motherTongueList" id="motherTongueListId">
                                                                <option value="${motherTongueListId.motherTongueId}">${motherTongueListId.motherTongue}</option>
                                                            </s:iterator>   
                                                        </select>
                                                    </span>
                                                    <span>  

                                                        <input type="hidden" id="hiddenHeightFrom" value="${contact.desiredPartnersHeight}">
                                                        <s:select headerKey="" headerValue="Height From" list="heightList" listKey="baseId" listValue="baseValue" tabindex="5"  id="heightFrom" name="contact.heightString" value="%{contact.desiredPartnersHeight}">
                                                            <!--<option value="">Height From</option>-->
                                                            <%--<s:iterator value="heightList" id="heightListId">--%>
                                                                <!--<option ${contact.desiredPartnersHeight} value="${heightListId.baseId}">${heightListId.baseValue}</option>-->
                                                            <%--</s:iterator>--%>   
                                                        </s:select>
                                                    </span>
                                                    <span>
                                                        <input type="hidden" id="hiddenHeightTo" value="${contact.desiredPartnersHeight2}">
                                                        <s:select headerKey="" headerValue="Height To" list="heightList" listKey="baseId" listValue="baseValue" tabindex="5"  id="heightTo" name="contact.heightString" value="%{contact.desiredPartnersHeight2}"></s:select>
                                                            <!--<option value="">Height To</option>-->
                                                        <%--<s:iterator value="heightList" id="heightListId">--%>
                                                            <!--<option value="${heightListId.baseId}">${heightListId.baseValue}</option>-->
                                                        <%--</s:iterator>--%>   

                                                    </span>
                                                    <span>
                                                        <select id="manglik"  >
                                                            <option value="" >Select Manglik</option>
                                                            <option value="Don't Know" >Don't Know</option>
                                                            <option value="Yes" >Yes</option>
                                                            <option value="No" >No</option>
                                                            <option value="Anshik" }>Anshik</option>
                                                        </select>
                                                    </span>
                                                    <span>

                                                        <s:select headerKey="" headerValue="Rm List" list="rmList" listKey="userId" listValue="name" tabindex="5"  id="rmIdForMatchSearch" ></s:select>
                                                        </span>

                                                        <div id="searchButton" class="searchprofileButtonDiv" >
                                                            <a class="btn btn-primary" id="searchButtonTag" onclick="searchMatchList()">search</a>
                                                        </div>
                                                        <div id="searchButton" class="searchprofileButtonDiv" >
                                                            <a href="#" class="btn btn-primary" style="text-decoration: none" id="hideSearchBox" onclick="hideSearch()">Hide</a>
                                                        </div>
                                                        <div id="searchButton" class="searchprofileButtonDiv" >
                                                            <a  class="btn btn-primary" onclick="resetSearch()">Reset</a>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="scroll-panel leftscrolldata homeHide" id="homeHide">
                                                    <ul id="usersList" class="nav nav-pills nav-stacked col-lg-4 reportLeftDIV" style="direction:ltr; overflow: unset;width: 100%;">
                                                        <!--<ul id="usersList" class="nav nav-pills nav-stacked col-lg-4 reportLeftDIV" style="direction:ltr; overflow: auto;width: 100%;">-->

                                                        <!--                                                <input type=button name=type value='Show Layer' onclick="setVisibility('sub3', 'inline');">
                                                                                                        <input type=button name=type value='Hide Layer' onclick="setVisibility('sub3', 'none');">-->
                                                        <b class="recordDisplay" id="matchHeaderListSize">  ${matchList.size()} Records found </b>
                                                    <s:iterator value="matchList" var="matchListId" status="loop" >

                                                        <li style="background:${matchListId.bc}"> <div class="reportProfileDIV">
                                                                <div class="imageReportProfile">
<!--                                                                    <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${matchListId.image1}" style="width: 55px;height: 55px;" class="img-circle" />-->
                                                                    <img src="${profileimgPath}${matchListId.image1}" style="width: 55px;height: 55px;" class="img-circle" />
                                                                </div>
                                                                <div class="reportProfileName">
                                                                    <a data-toggle="tab"    href="#menu2" onclick="displayContactDetails(${matchListId.contactId})">${matchListId.firstName} </a>

                                                                    <div class="profileIDNum">
                                                                        <span class="matchid"><span class="color2">${matchListId.category}${matchListId.profileId}(${matchListId.shortName})${matchListId.assignedToArm}</span></span>
                                                                        <s:if test="%{!#matchListId.pdfPresentationFile.equals('') || #matchListId.pdfPresentationFile!=null}">
                                                                            <span class="pdficon">
<!--                                                                                <a target="_blank" href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${matchListId.pdfPresentationFile}" class="pdfActionDivstatus pdfAction" title="pdf" ></a>-->
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
                                                                    <!--<td>
                                                                    <!--   <div class="reportStatusDiv">
                                                                           <img src="../img/icons/boyGreenIcon.png" /> 
                                                                            <img src="../img/icons/connectArrow.png"/>
                                                                            <img src="../img/icons/girlGreenIcon.png"/>
                                                                          </div>
                                                                </td>-->
                                                                    <td colspan="3">
                                                                        <a data-toggle="tab" href="#emailList" class="profileAction emaiAction" title="Email" onclick="email(${matchListId.contactId})"></a>
                                                                        <a data-toggle="tab" href="#followupStatus" class="reportAction followreportAction" title="Follow-up" onclick="followUp(${matchListId.contactId})"></a>
                                                                        <a data-toggle="tab" href="#feedbackStatus" class="reportAction feedbackreportAction"  title="AdditionalInformation" onclick="feedback(${matchListId.contactId})"></a>
                                                                        <a data-toggle="tab" href="#statusReport" class="reportActionDivstatus statusReport" title="Status Report" onclick="statusReport(${matchListId.contactId})"></a>
                                                                        <!--<a data-toggle="tab" href="#kundaliReport" class="reportActionDivstatus horoscopeReport" title="kundali" > </a>-->                                          
                                                                        <a data-toggle="tab"  class="outboxAction moveoutboxAction iconinLine" title="move to outbox" id="movetooutbox${loop.index}"  onclick="moveToOutBox(${matchListId.contactId});moveToOutBoxColor(this.id)">   </a>
                                                                        <a data-toggle="tab" href="#activityLog" class="reportActionDivstatus actlogAction" title="Activity log" onclick="showAllActivity(${matchListId.contactId}, 1)">   </a>
                                                                        <a data-toggle="tab" href="#kundaliReportList" class="reportActionDivstatus kundaliAction" title="Kundali" id="kundaliMatch${matchListId.contactId}" onclick="getContactInfoKundali(${matchListId.contactId})">   </a>


                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </li>
                                                    </s:iterator>
                                                    <a data-toggle="tab" href="#refreshMatchreport"  id="refreshMatchReport"></a>
                                                </ul>
                                            </div>

                                            <div id="divcontent" class="tab-content fade in active col-lg-8 reportRightDIV scroll-panel borderYellow">

                                                <div id="menu2" class="tab-pane fade">
                                                    <div class="pop-gallery">
                                                        <div id="contactDetailsDiv">

                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="emailList"  class="tab-pane fade">
                                                    <h1 id="emailHeadingMatchReport" class="popupheads fontStylechange">Email History</h1>

                                                    <!--                                                <ul class="nav nav-tabs">
                                                                                                        <li class="active"><a data-toggle="tab" href="#statusEmailHistory"></a></li>
                                                                                                        <li><a data-toggle="tab" href="#addEmailStatus">Add Email3</a></li>
                                                    
                                                                                                    </ul>-->

                                                    <div class="tab-content">
                                                        <div id="statusEmailHistory" class="tab-pane fade in active">
                                                            <div id="emailHistory">

                                                            </div>



                                                        </div>
                                                        <div id="addEmailStatus" class="tab-pane fade">
                                                            <form method="post" action="saveEmail"  enctype="multipart/form-data"> 


                                                                <section>
                                                                    <div class="formDATA">
                                                                        <label>To1*</label>
                                                                        <div class="controlsData">
                                                                            <input type="hidden" name="email.contactId" id="emailcontactId">
                                                                            <input type="text"  id="recepientIds" name="email.recepientIds"/>
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
                                                                                <form action="#" class="form-horizontal">
                                                                                    <div class="form-group">

                                                                                        <textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>

                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                            <!--                                                                        <input type="textarea"  id="emailContent" name="email.content"/>-->
                                                                            <label  id="emailContentValidate" style="color:red;display: none;width: 100%;"/>Please enter content</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label value="Signature" >Signature1</label>
                                                                        <div class="controlsData">
                                                                            <input type="radio" name="email.signature" value="1" checked> Yes
                                                                            <input type="radio" name="email.signature" value="2"> No<br>
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label value="Attachment" />Attachment</label>
                                                                        <div class="controlsData">
                                                                            <input type="file" name="email.emailAttachment" />
                                                                            <input type="hidden" name="email.contactId" id="emailcontactId">
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <input type="Set" value="submit" onclick="return saveEmail()" class="btn btn-primary"/>
                                                                    </div>
                                                                </section>

                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div id="followupStatus" class="tab-pane fade">
                                                    <!-- Add Follow up start-->
                                                    <h1 id="followupMatchReport" class="popupheads fontStylechange">Follow up</h1>
                                                    <!-- Add Follow up ends-->
                                                    <div id="followupHistory">

                                                    </div>

                                                </div>
                                                <div id="activityLog" class="tab-pane fade">
                                                    <!-- Add Follow up start-->
                                                    <h1 class="popupheads fontStylechange" id="activityLogMatchReport">Activity Log</h1>
                                                    <!-- Add Follow up ends-->
                                                    <div id="activityLogDiv">

                                                    </div>

                                                </div>
                                                <div id="kundaliReportList" class="tab-pane fade">
                                                    <!-- Add Follow up start-->
                                                    <!--<h1 class="popupheads">Kundali</h1>-->
                                                    <!-- Add Follow up ends-->
                                                    <div id="kundaliReportDiv">

                                                    </div>

                                                </div>
                                                <div id="refreshMatchreport" class="tab-pane fade">


                                                </div>
                                                <div id="feedbackStatusOld" class="tab-pane fade">
                                                    <!--<ul class="nav nav-tabs">-->
                                                    <!--<li class="active"><a data-toggle="tab" href="#homeFeedBackStatus"  class="tabHeadSM tabPaddLeft">FeedBack History</a></li>-->
                                                    <!--<li><a data-toggle="tab" href="#addFeedBackStatus"  class="tabHeadSM tabPaddLeft">Add new FeedBack1</a></li>-->
                                                    <!--</ul>-->               
                                                    <div class="tab-content">
                                                        <!--<div id="homeFeedBackStatus" class="tab-pane fade in active">-->
                                                        <!--<div class="modal-body">-->
                                                        <!--<h1 id="feedbackMatchReport" class="popupheads fontStylechange">Feedback History</h1>-->
                                                        <!--<div id="feedBackHistory">-->
                                                        <!--</div>-->
                                                        <!--</div>-->
                                                        <!--</div>-->
                                                        <div id="addFeedBackStatus" class="tab-pane fade">
                                                            <div class="modal-body">


                                                                <div class="col-lg-12">
                                                                    <div class="formHEADDiv whiteBG">
                                                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/userDetailIcon.png" alt="Icon"/> <span>Add new feedback2</span></div>

                                                                    </div>
                                                                    <section class="formHalf">
                                                                        <div class="formDATA">

                                                                            <label>subject</label>
                                                                            <div class="controlsData">    
                                                                                <input type="text" name="fsubject" id="fsubject"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>FeedBack</label>
                                                                            <div class="controlsData">
                                                                                <input type="text" name="content" id="fcontent"/>
                                                                                <input type="hidden" name="fcontactId" id="fcontactId"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <button onclick="return saveFeedBack()" class="btn btn-go btn-margin">Save</button>

                                                                        </div>
                                                                    </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="feedbackStatus"  class="tab-pane fade">
                                                    <h1 class="popupheads fontStylechange" id="feedbackMatchReport">Additional Information</h1>
                                                    <ul class="nav nav-pills">
                                                        <li class="active"><a data-toggle="tab" id="additionalInfoListMatchLi" href="#additionalInfoListMatch"  class="tabHeadSM tabPaddLeft">Additional Information</a></li>
                                                        <li><a data-toggle="tab" href="#additionalInfoListMatchQuestions"  class="tabHeadSM tabPaddLeft">Questions</a></li>

                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="additionalInfoListMatch" class="tab-pane fade in active">
                                                            <div class="modal-body">

                                                                <div id="feedBackHistory">

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="additionalInfoListMatchQuestions" class="tab-pane fade" onclick="">
                                                            <div class="modal-body">
                                                                <div id="121">
                                                                    <section>
                                                                        <div class="formDATA">
                                                                            <label>Budget / Range</label>
                                                                            <div class="controlsData" id="budgetDivMatch">
                                                                                ${contact.budget}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Preference</label>
                                                                            <div class="controlsData" id="preferenceDivMatch">
                                                                                ${contact.preference}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Family (income or Salary)<input type="hidden" id="questionContactId" ></label>
                                                                            <div class="controlsData" id="familySalaryDivMatch">
                                                                                ${contact.familySalary}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Property Of Ownership</label>
                                                                            <div class="controlsData" id="propertyOfOwnershipDivMatch">
                                                                                ${contact.propertyOfOwnership}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Reason of Divorce</label>
                                                                            <div class="controlsData" id="reasonOfDivorceDivMatch">
                                                                                ${contact.reasonOfDivorce}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Whether divorce is settled</label>
                                                                            <div class="controlsData" id="divorcedOrSettledDivMatch">
                                                                                ${contact.divorcedOrSettled}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Reference given by</label>
                                                                            <div class="controlsData" id="referenceGivenByDivMatch">
                                                                                ${contact.referenceGivenBy}
                                                                            </div>
                                                                        </div>
                                                                        <div class="formDATA">
                                                                            <label>Family Background</label>
                                                                            <div class="controlsData" id="familyBackgroundDivMatch">
                                                                                ${contact.familyBackground}
                                                                            </div>
                                                                        </div>



                                                                    </section>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="statusReport" class="tab-pane fade" style="margin-top: 15px;">
                                                    <!--vineeta-->
                                                    <h1 class="popupheads fontStylechange" id="statusReportListHead"></h1>
                                                    <div class="withPhotosDiv matchdivwidthchange">
                                                        <span>
                                                            <select name="contact.matchStatus" id="matchStatus">
                                                                <option value="-1">Match Status</option>
                                                                <option value="1">Accept(One Way)</option>
                                                                <option value="2">Accept(Two Way)</option>
                                                                <option value="3">Reject(One Way)</option>
                                                                <option value="4">Reject(Two Way)</option>
                                                                <option value="5">Pending(One Way)</option>
                                                                <option value="6">Pending(Two Way)</option>
                                                            </select>
                                                        </span>
                                                        <span>
                                                            <select name="contact.meetingStatus"  id="meetingStatus">
                                                                <option value="-1">Meeting Status</option>
                                                                <option value="1">Accept)</option>
                                                                <option value="2">Reject</option>
                                                                <option value="3">Reschedule</option>
                                                            </select>
                                                        </span>
                                                        <span>
                                                            <select name="contact.finalStatus" id="finalStatus">
                                                                <option value="-1">Final Status</option>
                                                                <option value="1">Success</option>
                                                                <option value="2">Reject</option>
                                                                <option value="3">Not a success</option>
                                                            </select>
                                                        </span>
                                                        <span>
                                                            <select name="contact.priority" id="priority">
                                                                <option value="-1">Priority</option>
                                                                <option value="3">High</option>
                                                                <option value="2">Medium</option>
                                                                <option value="1">Low</option>
                                                            </select>
                                                        </span>
                                                        <span>
                                                            <div class="controlsData controlWidth"><input  type="text" name="contact.search" id="search" placeholder="Name"/></div>
                                                        </span>
                                                        <div class="searchprofileButtonDiv" >                       
                                                            <input value="Search" style="text-transform: none;"  class="btn btn-primary" onclick="searchStatusReport()" />
                                                        </div>
                                                        <div id="statusReportList">


                                                        </div>

                                                    </div>
                                                    <!--vineeta-->


                                                    <!-- <div style="width:15%;display: inline-block;"> 
                                                     <select name="contact.matchStatus" id="matchStatus">
                                                         <option value="-1">Match Status</option>
                                                         <option value="1">Accept(One Way)</option>
                                                         <option value="2">Accept(Two Way)</option>
                                                         <option value="-3">Reject(One Way)</option>
                                                         <option value="-4">Reject(Two Way)</option>
                                                         <option value="-5">Pending(One Way)</option>
                                                         <option value="6">Pending(One Way)</option>
                                                     </select>
                                                 </div>
                                                 <div style="width:15%;display: inline-block;">         
                                                     <select name="contact.meetingStatus"  id="meetingStatus">
                                                         <option value="-1">Meeting Status</option>
                                                         <option value="1">Accept)</option>
                                                         <option value="2">Reject</option>
                                                         <option value="3">Reschedule</option>
                                                     </select>
                                                 </div>
                                                 <div style="width:15%;display: inline-block;" >         
                                                     <select name="contact.finalStatus" id="finalStatus">
                                                         <option value="-1">Final Status</option>
                                                         <option value="1">Success</option>
                                                         <option value="2">Reject</option>
                                                         <option value="3">Not a success</option>
                                                     </select>
                                                 </div>
                                                 <div style="width:15%;display: inline-block;" >         
                                                     <select name="contact.priority" id="priority">
                                                         <option value="-1">Priority</option>
                                                         <option value="3">High</option>
                                                         <option value="2">Medium</option>
                                                         <option value="1">Low</option>
                                                     </select>
                                                 </div>
                                                 <div style="width:15%;display: inline-block; vertical-align: top" >   
                                                     <div class="controlsData"><input  type="text" name="contact.search" id="search" placeholder="Name/Profile Id"/></div>
                                                 </div>
                                                 <div style="width:15%;display: inline-block;"> 
                                                     <button value="Search"  class="btn btn-primary" onclick="searchStatusReport()" >Search</button>
                                                 </div>
                                                 <div id="statusReportList">
    
    
                                                 </div>-->

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="matchListReport">
                                        <!-- For match Report List -->
                                        <div class="scroll-panel scrollHeight" id="matchReportIndividualDiv"></div>
                                        <!-- Finished Match List -->
                                    </div>
                                </c:if>
                                <div id="menu1" class="tab-pane fade topMargin">


                                    <div class="withPhotosDiv divwidthchange">
                                        <span>
                                            <select name="contact.matchStatus" id="imatchStatus" tabindex="1">
                                                <option value="-1">Match Status</option>
                                                <option value="1">Accept(One Way)</option>
                                                <option value="2">Accept(Two Way)</option>
                                                <option value="3">Reject(One Way)</option>
                                                <option value="4">Reject(Two Way)</option>
                                                <option value="5">Pending(One Way)</option>
                                                <option value="6">Pending(Two Way)</option>
                                            </select>
                                        </span>
                                        <span>
                                            <select name="contact.meetingStatus"  id="imeetingStatus" tabindex="2">
                                                <option value="-1">Meeting Status</option>
                                                <option value="1">Accept</option>
                                                <option value="2">Reject</option>
                                                <option value="3">Reschedule</option>
                                            </select>
                                        </span>
                                        <span>
                                            <select name="contact.finalStatus" id="ifinalStatus" style="display:none" tabindex="3">
                                                <option value="-1">Final Status</option>
                                                <option value="1">Success</option>
                                                <option value="2">Not a success</option>
                                            </select>
                                            <select id="imovedStatus" tabindex="4">
                                                <option value="-1">Moved Status</option>
                                                <option value="0">Active</option>
                                                <option value="1">Success</option>
                                                <option value="2">Lost Opportunity</option>
                                                <option value="3">delete</option>
                                            </select>
                                        </span>
                                        <span>
                                            <select name="contact.priority" id="ipriority" tabindex="5">
                                                <option value="-1">Priority</option>
                                                <option value="3">High</option>
                                                <option value="2">Medium</option>
                                                <option value="1">Low</option>
                                            </select>
                                        </span>
                                        <span>
                                            <div class="controlsData controlWidth"><input  type="text" name="contact.search" id="isearch" placeholder="Name/ProfileId" tabindex="6"/></div>
                                        </span>

                                        <span>
                                            <input id="statusCity" placeholder="City" type="text" tabindex="7">
                                        </span>

                                        <div class="searchprofileButtonDiv" >
                                            <!--<button value="Search"  class="btn btn-primary" onclick="searchStatusReport1(${contact.contactId})" >Search</button>-->
                                            <a  class="btn btn-primary" onclick="searchStatusReport1(${contact.contactId})" tabindex="8"> Search</a>
                                        </div>
                                        <div id="statusReportList">


                                        </div>

                                    </div>

                                    <!--                                    <h3>Status Report</h3>-->
                                    <div id="statusDivRow" >
                                        <!--Search filter is moved on top to statusDivrow to use for statusDivcolumn Also  Vineet-->

                                        <div id="statusReportIndividualDiv">

                                        </div>


                                    </div>




                                    <!----new vertical--->
                                    <div id="statusDivColumn" style="display:none;" >
                                        <!--                                        <div class="withPhotosDiv">
                                                                                    <span>
                                                                                        <select name="contact.matchStatus" id="imatchStatus">
                                                                                            <option value="-1">Match Status</option>
                                                                                            <option value="1">Accept(One Way)</option>
                                                                                            <option value="2">Accept(Two Way)</option>
                                                                                            <option value="3">Reject(One Way)</option>
                                                                                            <option value="4">Reject(Two Way)</option>
                                                                                            <option value="5">Pending(One Way)</option>
                                                                                            <option value="6">Pending(Two Way)</option>
                                                                                        </select>
                                                                                    </span>
                                                                                    <span>
                                                                                        <select name="contact.meetingStatus"  id="imeetingStatus">
                                                                                            <option value="-1">Meeting Status</option>
                                                                                            <option value="1">Accept</option>
                                                                                            <option value="2">Reject</option>
                                                                                            <option value="3">Reschedule</option>
                                                                                        </select>
                                                                                    </span>
                                                                                    <span>
                                                                                        <select name="contact.finalStatus" id="ifinalStatus">
                                                                                            <option value="-1">Final Status</option>
                                                                                            <option value="1">Success</option>
                                                                                            <option value="2">Not a success</option>
                                                                                            <option value="3">Not a success</option>
                                                                                        </select>
                                                                                    </span>
                                                                                    <span>
                                                                                        <select name="contact.priority" id="ipriority">
                                                                                            <option value="-1">Priority</option>
                                                                                            <option value="3">High</option>
                                                                                            <option value="2">Medium</option>
                                                                                            <option value="1">Low</option>
                                                                                        </select>
                                                                                    </span>
                                                                                    <span>
                                                                                        <div class="controlsData controlWidth"><input  type="text" name="contact.search" id="isearch" placeholder="Name/ProfileId"/></div>
                                                                                    </span>
                                        
                                                                                    <span>
                                                                                        <input id="statusCity" placeholder="City" type="text" >
                                                                                    </span>
                                        
                                                                                    <div class="searchprofileButtonDiv" >
                                                                                        <button value="Search"  class="btn btn-primary" onclick="searchStatusReport1(${contact.contactId})" >Search</button>
                                                                                    </div>
                                                                                    <div id="statusReportList">
                                        
                                        
                                                                                    </div>
                                        
                                                                                </div>-->

                                        <div class="scroll-panel leftscrolldata">
                                            <ul id="statusReportList" class="nav nav-pills nav-stacked col-lg-4  reportLeftDIV" style="direction:ltr;overflow: unset;width: 100%;">
                                                <div id="subinay2">

                                                </div>
                                            </ul>
                                        </div>
                                        <div id="divcontent" class="tab-content fade in active col-lg-8 borderYellow reportRightDIV scroll-panel">
                                            <div id="emailListIndividual"  class="tab-pane fade">
                                                <h1 class="popupheads fontStylechange" id="emailHistoryHeadingStatusReportIndividual">Email History</h1>
                                                <ul class="nav nav-tabs">
                                                    <!--<li class="active"><a data-toggle="tab" href="#statusEmailHistoryIndividual">Email History</a></li>-->
                                                    <!--<li><a data-toggle="tab" href="#addEmailStatusIndividual">Add Email</a></li>-->

                                                </ul>
                                                <div class="tab-content">

                                                    <div id="statusEmailHistoryIndividual" class="tab-pane fade in active">
                                                        <div id="emailHistoryIndividual">

                                                        </div>
                                                    </div>
                                                    <div id="addEmailStatusIndividual" class="tab-pane fade">
                                                        <form method="post" action="saveEmail"  enctype="multipart/form-data"> 


                                                            <section>
                                                                <div class="formDATA">
                                                                    <label>To2*</label>
                                                                    <div class="controlsData">
                                                                        <input type="text"  id="irecepientIds" name="email.recepientIds"/>
                                                                        <label  id="irecepientIdsValidate" style="color:red;width: 100%;display: none;"/>Please enter recepients</label>
                                                                    </div>

                                                                </div>
                                                                <div class="formDATA">
                                                                    <label>Subject*</label>
                                                                    <div class="controlsData">
                                                                        <input type="text"  id="iemailSubject" name="email.subject"/>
                                                                        <label  id="iemailSubjectValidate" style="color:red;display: none;width: 100%;">Please enter subject</label>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">

                                                                    <label value="Content*" >Content</label>
                                                                    <div class="controlsData">
                                                                        <div class="form">

                                                                            <div class="form-group">

                                                                                <textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>

                                                                            </div>

                                                                        </div>
                                                                        <!--                                                                        <input type="textarea"  id="emailContent" name="email.content"/>-->
                                                                        <label  id="iemailContentValidate" style="color:red;display: none;width: 100%;"/>Please enter content</label>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label value="Signature" >Signature2</label>
                                                                    <div class="controlsData">
                                                                        <input type="hidden" name="email.contactId" id="iemailcontactId">
                                                                        <input type="radio" name="email.signature" value="1" checked> Yes
                                                                        <input type="radio" name="email.signature" value="2"> No<br>
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <label value="Attachment" />Attachment</label>
                                                                    <div class="controlsData">
                                                                        <input type="file" name="email.emailAttachment" />
                                                                        <input type="hidden" name="email.contactId" id="iecontactId">
                                                                    </div>
                                                                </div>
                                                                <div class="formDATA">
                                                                    <input type="submit" value="submit" onclick="return saveEmailIndividual()" class="btn btn-primary"/>
                                                                </div>
                                                            </section>

                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                            <div id="followupStatusIndividual"  class="tab-pane fade">
                                                <div class="addfollowup">
                                                    <!--<h3 class="popupheads">Add New Followup1</h3>-->
                                                    <!--                                                    <div class="formDATA followup">
                                                                                                            <label>Subject*</label><br/>
                                                                                                            <div class="controlsData controlWidth">
                                                                                                                <select id="iprojectId">
                                                                                                                    <option value="0">--Select--</option>
                                                                                                                    <option value="3">Matching</option>
                                                                                                                    <option value="4">Meeting</option>
                                                                                                                    <option value="2">Payment</option>
                                                                                                                    <option value="1">Renewal</option>
                                                                                                                </select>                                
                                                                                                                <label  id="ivalidateProject" style="color:red;display:none;" >Please select project </label>
                                                                                                            </div>
                                                    
                                                                                                        </div>-->
                                                    <!--                                                    <div class="formDATA followup">
                                                                                                            <label>Details*</label><br/>
                                                                                                            <div class="controlsData controlWidth">
                                                                                                                <input type="text"  id="icontent" >
                                                                                                            </div>
                                                                                                            <label  id="ivalidateContent" class="validationMesssage" style="color:red;display:none;" >Please enter content </label>
                                                                                                        </div>-->

                                                    <!--                                                    <div class="formDATA followup">
                                                                                                            <label value="Next Date*" >Next Date*</label><br/>
                                                                                                            <div class="controlsData controlWidth">
                                                                                                                <input class="form-control" id="inextDate" type="text" placeholder="Next Date"  />
                                                    
                                                                                                            </div>
                                                                                                            <label id="ivalidateDate" class="validationMesssage"  style="color:red;display:none;">Please select date</label>
                                                                                                        </div>-->

                                                    <!--                                                    <div class="formDATA followupgo">
                                                    
                                                                                                            <input type="submit"  onclick="return saveFollowUpIndividual()" value="Go" class="btn btn-go btn-margin">
                                                                                                        </div>-->

                                                </div>
                                                <!-- Add Follow up ends-->
                                                <!-- FOLLOWUP HistorySTART-->
                                                <!--<h3 class="popupheads">Followup History</h3>-->

                                                <input type="hidden"  id="ifollowupContactId"  >

                                                <div id="followupHistoryIndividual">
                                                    <!--ajax comes here-->

                                                </div>

                                            </div>
                                            <div id="armFollowup"  class="tab-pane fade">
                                                <h1 class="popupheads fontStylechange" id="profileHeader">Profile Follow-up</h1>
                                                <div id="profileFollowupDiv">

                                                </div>
                                            </div>
                                            <div id="feedbackStatusIndividual"  class="tab-pane fade">
                                                <!--<ul class="nav nav-tabs">-->
                                                <!--<li class="active"><a data-toggle="tab" href="#homeFeedBackIndividual"  class="tabHeadSM tabPaddLeft">FeedBack History</a></li>-->
                                                <!--<li><a data-toggle="tab" href="#menu1Individual"  class="tabHeadSM tabPaddLeft">Add new feedBack3</a></li>-->

                                                <!--</ul>-->
                                                <h1 class="popupheads">FeedBack History</h1>
                                                <div class="tab-content">
                                                    <!--<div id="homeFeedBackIndividual" class="tab-pane fade in active">-->
                                                    <!--<div class="modal-body">-->

                                                    <div id="feedbackHistoryIndividual">

                                                    </div>


                                                    <!--</div>-->
                                                    <!--</div>-->
                                                    <div id="menu1Individual" class="tab-pane fade">
                                                        <div class="modal-body">
                                                            <div class="col-lg-12">
                                                                <div class="formHEADDiv whiteBG">
                                                                    <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/userDetailIcon.png" alt="Icon"/> <span>Add new feedback</span></div>
                                                                </div>
                                                                <section class="formHalf">
                                                                    <div class="formDATA">
                                                                        <label>subject</label>
                                                                        <div class="controlsData">    
                                                                            <input type="text" name="fsubject" id="ifsubject"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>FeedBack</label>
                                                                        <div class="controlsData">
                                                                            <input type="text" name="content" id="ifcontent"/>
                                                                            <input type="hidden" name="fcontactId" id="ifcontactId"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <a href="#homeFeedBack" data-toggle="tab"></a>

                                                                        <button  onclick="return saveFeedBackIndividual()" value="Go" class="btn btn-go btn-margin">Save</button>
                                                                    </div>
                                                                </section>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="statusReportIndividualVertical"  class="tab-pane fade">
                                                <h1 class="popupheads fontStylechange" id="statusReportIndividualVerticalHead">Status Report</h1>
                                                <div class="withPhotosDiv matchdivwidthchange">

                                                    <span>
                                                        <input type="hidden" id="vsearchContactId">
                                                        <select name="contact.matchStatus" id="vmatchStatus">
                                                            <option value="-1">Match Status</option>
                                                            <option value="1">Accept(One Way)</option>
                                                            <option value="2">Accept(Two Way)</option>
                                                            <option value="3">Reject(One Way)</option>
                                                            <option value="4">Reject(Two Way)</option>
                                                            <option value="5">Pending(One Way)</option>
                                                            <option value="6">Pending(Two Way)</option>
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <select name="contact.meetingStatus"  id="vmeetingStatus">
                                                            <option value="-1">Meeting Status</option>
                                                            <option value="1">Accept</option>
                                                            <option value="2">Reject</option>
                                                            <option value="3">Reschedule</option>
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <select name="contact.finalStatus" id="vfinalStatus">
                                                            <option value="-1">Final Status</option>
                                                            <option value="1">Success</option>
                                                            <option value="2">Not a success</option>
                                                            <!--<option value="3">Not a success</option>-->
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <select name="contact.priority" id="vpriority">
                                                            <option value="-1">Priority</option>
                                                            <option value="3">High</option>
                                                            <option value="2">Medium</option>
                                                            <option value="1">Low</option>
                                                        </select>
                                                    </span>
                                                    <span>
                                                        <div class="controlsData controlWidth"><input  type="text" name="contact.search" id="vsearch" placeholder="Name/ProfileId"/></div>

                                                    </span>
                                                    <div class="searchprofileButtonDiv" >
                                                        <input value="Search" style="text-transform: none;"  class="btn btn-primary" onclick="searchStatusReport2()" />
                                                    </div>                                                
                                                </div>

                                                <div id="statusReportIndividualVerticalDiv">


                                                </div>
                                            </div>
                                            <div id="profileActivityIndividualVertical"  class="tab-pane fade">
                                                <h1 class="popupheads fontStylechange" id="profileActivityIndividualVerticalHeading">Profile Activity</h1>
                                                <div id="profileActivityIndividualVerticalDiv">

                                                </div>
                                            </div>

                                            <div id="kundaliVertical"  class="tab-pane fade">
                                                <h1 class="popupheads"></h1>
                                                <div id="kundaliVerticalDiv">

                                                </div>
                                            </div>
                                            <div id="additionalInfoListVertical"  class="tab-pane fade">
                                                <h1 class="popupheads fontStylechange" id="additionalInfoListVerticalHeading">Additional Information</h1>
                                                <ul class="nav nav-pills">
                                                    <li class="active"><a data-toggle="tab" id="additionalInfoListVerticalHomeLi" href="#additionalInfoListVerticalHome"  class="tabHeadSM tabPaddLeft">Additional Information</a></li>
                                                    <li><a data-toggle="tab" href="#additionalInfoListVerticalQuestions"  class="tabHeadSM tabPaddLeft">Questions</a></li>

                                                </ul>
                                                <div class="tab-content">
                                                    <div id="additionalInfoListVerticalHome" class="tab-pane fade in active">
                                                        <div class="modal-body">

                                                            <div id="additionalInfoListVerticalHomeDiv">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="additionalInfoListVerticalQuestions" class="tab-pane fade" onclick="">
                                                        <div class="modal-body">
                                                            <div id="121">
                                                                <section>
                                                                    <div class="formDATA">
                                                                        <label>Budget / Range</label>
                                                                        <div class="controlsData" id="budgetDivVertical">
                                                                            ${contact.budget}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Preference</label>
                                                                        <div class="controlsData" id="preferenceDivVertical">
                                                                            ${contact.preference}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Family (income or Salary)<input type="hidden" id="questionContactId" ></label>
                                                                        <div class="controlsData" id="familySalaryDivVertical">
                                                                            ${contact.familySalary}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Property Of Ownership</label>
                                                                        <div class="controlsData" id="propertyOfOwnershipDivVertical">
                                                                            ${contact.propertyOfOwnership}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Reason of Divorce</label>
                                                                        <div class="controlsData" id="reasonOfDivorceDivVertical">
                                                                            ${contact.reasonOfDivorce}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Whether divorce is settled</label>
                                                                        <div class="controlsData" id="divorcedOrSettledDivVertical">
                                                                            ${contact.divorcedOrSettled}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Reference given by</label>
                                                                        <div class="controlsData" id="referenceGivenByDivVertical">
                                                                            ${contact.referenceGivenBy}
                                                                        </div>
                                                                    </div>
                                                                    <div class="formDATA">
                                                                        <label>Family Background</label>
                                                                        <div class="controlsData" id="familyBackgroundDivVertical">
                                                                            ${contact.familyBackground}
                                                                        </div>
                                                                    </div>



                                                                </section>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="displayContactVertical" class="tab-pane fade">
                                                <!--<div class="popup-gallery">-->

                                                <div id="displayContactVertical1">

                                                </div>
                                                <!--</div>-->
                                            </div>


                                        </div>

                                    </div>
                                    <!----new vertical ends--->

                                    <!--                                    <div id="menus2" class="tab-pane fade">
                                                                            <h3>Status Report</h3>
                                                                            <div id="statusReportIndividualDiv3">
                                                                                sdfsdf
                                                                            </div>
                                                                        </div>-->


                                </div>
                                <div id="menus2" class="tab-pane fade">


                                    <br/>
                                    <ul class="nav nav-pills">
                                        <li class="active"><a data-toggle="tab" href="#homeEmailStatusFinal"  class="tabHeadSM tabPaddLeft">Email History</a></li>
                                        <li><a data-toggle="tab" id="addEmailStatusFinalTab" href="#addEmailStatusFinal"  class="tabHeadSM tabPaddLeft">Add new email</a></li>

                                    </ul>
                                    <div class="tab-content">
                                        <div id="homeEmailStatusFinal" class="tab-pane fade in active">
                                            <div class="modal-body">

                                                <div id="emailHistoryStatusFinal">

                                                </div>
                                            </div>
                                        </div>



                                        <div id="addEmailStatusFinal" class="tab-pane fade">
                                            <div class="modal-body">


                                                <div class="col-lg-12 paddingNone">
                                                    <div class="formHEADDiv whiteBG">


                                                    </div>
                                                    <form method="post" id="ratesId" action="saveEmailStatus"  enctype="multipart/form-data"> 


                                                        <section>
                                                            <div class="formDATA">
                                                                <label>To*</label>
                                                                <div class="controlsData">
                                                                    <input type="text" style="text-transform: none;" id="sfrecepientIds" name="email.recepientIds" value="${contact.emailRef}"/>
                                                                    <label  id="sfrecepientIdsValidate" style="color:red;width: 100%;display: none;"/>Please enter recepients</label>
                                                                </div>

                                                            </div>
                                                            <div class="formDATA">
                                                                <label>Subject*</label>
                                                                <div class="controlsData">
                                                                    <input type="text"  id="sfemailSubject" name="email.subject"/>
                                                                    <label  id="sfemailSubjectValidate" style="color:red;display: none;width: 100%;">Please enter subject</label>
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">

                                                                <label value="Content*" >Content</label>
                                                                <div class="controlsData">
                                                                    <div class="form">
                                                                        <form action="#" class="form-horizontal">
                                                                            <div class="form-group">

                                                                                <textarea class="form-control ckeditor"  rows="6" id="emailContent" ></textarea>
                                                                                <textarea style="display:none"  rows="6" name="email.content" id="emailContent1"></textarea>


                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    <!--                                                                        <input type="textarea"  id="emailContent" name="email.content"/>-->
                                                                    <label  id="emailContentValidate" style="color:red;display: none;width: 100%;"/>Please enter content</label>
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">
                                                                <label value="Signature" >Signature</label>
                                                                <div class="controlsData">
                                                                    <input type="hidden" name="email.contactId1" id="sfcontactId" value="${contact.contactId}">
                                                                    <input type="radio" name="email.signature" value="1" checked> Yes
                                                                    <input type="radio" name="email.signature" value="2"> No<br>
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">
                                                                <label value="Attachment" />Attachment</label>
                                                                <div class="controlsData">
                                                                    <input type="file" name="email.emailAttachment" />
                                                                    <input type="hidden" name="email.contactId" id="sfemailcontactId">
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">
                                                                <input type="submit" value="submit" onclick="return saveEmailStatusFinal()" class="btn btn-primary"/>
                                                            </div>
                                                        </section>

                                                    </form>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div id="menus3" class="tab-pane fade topMargin">
                                    <div class="tab-content">
                                        <ul class="nav nav-pills">
                                            <li class="active"><a data-toggle="tab" href="#Additional"  class="tabHeadSM tabPaddLeft">Additional Information</a></li>
                                            <li><a data-toggle="tab" href="#Questions"  class="tabHeadSM tabPaddLeft">Questions</a></li>

                                        </ul>
                                        <div class="tab-content">
                                            <div id="Additional" class="tab-pane fade in active">
                                                <div class="modal-body">

                                                    <div id="feedBackHistoryImportantInformation">

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="Questions" class="tab-pane fade" onclick="">
                                                <div class="modal-body">
                                                    <div id="121">
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
                                                                <label>Property Of Ownership</label>
                                                                <div class="controlsData" id="propertyOfOwnershipDiv">
                                                                    ${contact.propertyOfOwnership}
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">
                                                                <label>Reason of Divorce</label>
                                                                <div class="controlsData" id="reasonOfDivorceDiv">
                                                                    ${contact.reasonOfDivorce}
                                                                </div>
                                                            </div>
                                                            <div class="formDATA">
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



                                                        </section>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div id="">
                                        </div>
                                    </div>
                                </div>
                                <div id="menus5" class="tab-pane fade topMargin">


                                    <div class="tab-content">
                                        <h3  style="padding-left:15px;display: inline-block;"><a href="#" onclick="fetchActivityList(0,${contact.contactId})" title="All"><img src="../img/icons/allicon.png"/></a></h3>
                                        <h3  style="padding-left:15px;display: inline-block;"><a href="#" onclick="fetchActivityList(1,${contact.contactId})" title="Profile Detail"><img src="../img/icons/profiledetailicon.png"/></a></h3>
                                        <h3 style="padding-left:15px;display: inline-block;"><a href="#" onclick="fetchActivityList(2,${contact.contactId})" title="Meeting"><img src="../img/icons/meetingicon.png"/></a> </h3>
                                        <h3  style="padding-left:15px;display: inline-block;"><a href="#" onclick="fetchActivityList(3,${contact.contactId})" title="Match"><img src="../img/icons/matchicon.png"/></a></h3>

                                        <div id="activityDiv">

                                        </div>


                                    </div>
                                </div>
                                <div id="menus4" class="tab-pane fade">
                                    <!-- Add Follow up start-->
                                    <div class="addfollowup">
                                        <h3 class="popupheads">Add New Follow-Up</h3>
                                        <div class="formDATA followup">
                                            <label>Subject*</label><br/>
                                            <div class="controlsData controlWidth">
                                                <select id="sffprojectId">
                                                    <option value="0">--Select--</option>
                                                    <option value="3">Matching</option>
                                                    <option value="4">Meeting</option>
                                                    <option value="2">Payment</option>
                                                    <option value="1">Renewal</option>
                                                </select>                                
                                                <label  id="sffvalidateProject" style="color:red;display:none;" >Please select project </label>
                                            </div>

                                        </div>
                                        <div class="formDATA followup">
                                            <label>Details*</label><br/>
                                            <div class="controlsData controlWidth">
                                                <input type="text"  id="sffcontent1" >
                                            </div>
                                            <label  id="sffvalidateContent" class="validationMesssage" style="color:red;display:none;" >Please enter content </label>
                                        </div>

                                        <div class="formDATA followup">
                                            <div class="col-lg-6">
                                                <label value="Next Date*" >Next Date*</label><br/>
                                                <div class="controlsData controlWidth">
                                                    <input class="form-control" id="sffnextDate" type="text" placeholder="Next Date"  />

                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <label value="Next Date*" >Time</label><br/>
                                                <input id="timepicker3" type="text" name="timepicker3" class="form-control" style="height: 30px !important;"/>
                                            </div>
                                            <label id="sffvalidateDate" class="sffvalidationMesssage"  style="color:red;display:none;">Please select date</label>
                                        </div>

                                        <div class="formDATA followupgo">
                                            <input type="hidden"  id="sffollowupContactId" value="${contact.contactId}"  >
                                            <button  onclick="return saveFollowUpStatusFinal()"  class="btn btn-go btn-margin">Save</button>
                                        </div>

                                    </div>
                                    <!-- Add Follow up ends-->
                                    <div id="followupHistoryStatusFinal">

                                    </div>
                                </div>


                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title" >Match Status 1 </h4>


                                            </div>
                                            <div class="modal-body">
                                                <div class="col-lg-12">
                                                    <div class="formHEADDiv whiteBG">
                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Status</span></div>
                                                    </div>
                                                    <section class="formFull">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    Status  
                                                                </td>
                                                                <td>
                                                                    <input type="hidden" id="acontactId"/>
                                                                    <input type="hidden" id="afield"/>
                                                                    <input type="hidden" id="amatchId"/>
                                                                    <input type="hidden" id="amid"/>
                                                                    <input type="hidden" id="agroom"/>
                                                                    <select id="astatus">
                                                                        <option value="0">Pending</option>
                                                                        <option value="1">Accept</option>
                                                                        <option value="2">Reject</option>
                                                                    </select>




                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Remark 
                                                                </td>
                                                                <td>
                                                                    <input type="text"   id="aremark"/>
                                                                    <label value="Please enter remark" id="validateremark" style="display:none;color:red;"></label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <button type="button" class="btn btn-default" onclick="saveStatus()">Submit</button>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="display:none;">

                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal2">Close</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="exchange" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Profile Exchange</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-lg-12">
                                                    <div class="formHEADDiv whiteBG">
                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Profile Exchange</span></div>
                                                    </div>
                                                    <section class="formFull">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" id="exchangeContactId">
                                                                    <input type="hidden" id="exchangeMatchId">

                                                                    <ul>
                                                                        <li>  <a href="#" id="Resend" onclick="exchangeProfile(2)" style="display:none;">Resend</a></li>
                                                                        <li>    <a href="#" title="onewy" id="Onewy" onclick="exchangeProfile(3)" style="display:none;">Otherway</a></li>
                                                                        <li>   <a href="#" id="Oneway" onclick="exchangeProfile(3)" style="display:none;">Oneway</a></li>
                                                                        <li> <a href="#" id="Twoway" onclick="exchangeProfile(1)" style="display:none;">Twoway</a></li>
                                                                        <li>  <a href="#" id="Resend1" onclick="exchangeProfile(1)" style="display:none;">Resend</a></li>
                                                                        <li>    <a href="#" title="onewy" id="Onewy1" onclick="exchangeProfile(3)" style="display:none;">Otherway</a></li>
                                                                        <li>   <a href="#" id="Oneway1" onclick="exchangeProfile(2)" style="display:none;">Oneway</a></li>
                                                                    </ul>





                                                                    <!--was two way-->
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="display:none;">

                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="exchangeModal">Close</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="emailStatus" class="modal fade" role="dialog">
                                    <div class="modal-dialog modalWidth">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title" >Email Status</h4>
                                            </div>
                                            <div class="modal-body paddingNone">
                                                <div class="col-lg-12">
                                                    <div class="formHEADDiv whiteBG marginPadding">
                                                        <h4  id="emailStatusHeading">Email Status</h4>
                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Email Status</span></div>
                                                    </div>
                                                    <section class="formFull">
                                                        <div id="emailStatusDiv">

                                                        </div>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="display:none;">

                                                <button type="button" class="btn btn-default" data-dismiss="modal" id="exchangeModal">Close</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="additionalInfoListIndividual" class="modal fade" role="dialog" >
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title" id="additionalInfoListHorizontalHeading">Additional Information</h4>
                                            </div><br/>
                                            <ul class="nav nav-pills" style="margin-left:9px;">
                                                <li class="active"><a data-toggle="tab" href="#additionalInfoListHorizontalDiv"  class="tabHeadSM tabPaddLeft">Additional Information</a></li>
                                                <li><a data-toggle="tab" href="#additionalInfoListHorizontalQuestionsDiv"  class="tabHeadSM tabPaddLeft">Questions</a></li>
                                            </ul><br/>
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="additionalInfoListHorizontalDiv">
                                                    <div id="additionalInfoListHorizontalDiv" class="modal-body">

                                                    </div>
                                                </div>
                                                <div id="additionalInfoListHorizontalQuestionsDiv" class="tab-pane fade">

                                                    <div class="col-lg-12">

                                                        <div class="formDATA">
                                                            <label>Budget / Range</label>
                                                            <div class="controlsData" id="budgetDivHorizontal">
                                                                ${contact.budget}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Preference</label>
                                                            <div class="controlsData" id="preferenceDivHorizontal">
                                                                ${contact.preference}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Family (income or Salary)<input type="hidden" id="questionContactId" ></label>
                                                            <div class="controlsData" id="familySalaryDivHorizontal">
                                                                ${contact.familySalary}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Property Of Ownership</label>
                                                            <div class="controlsData" id="propertyOfOwnershipDivHorizontal">
                                                                ${contact.propertyOfOwnership}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Reason of Divorce</label>
                                                            <div class="controlsData" id="reasonOfDivorceDivHorizontal">
                                                                ${contact.reasonOfDivorce}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Whether divorce is settled</label>
                                                            <div class="controlsData" id="divorcedOrSettledDivHorizontal">
                                                                ${contact.divorcedOrSettled}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Reference given by</label>
                                                            <div class="controlsData" id="referenceGivenByDivHorizontal">
                                                                ${contact.referenceGivenBy}
                                                            </div>
                                                        </div>
                                                        <div class="formDATA">
                                                            <label>Family Background</label>
                                                            <div class="controlsData" id="familyBackgroundDivHorizontal">
                                                                ${contact.familyBackground}
                                                            </div>
                                                        </div>



                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- -->
                                </div>



                            </div>

                        </div>
                        <!--Added by vineet For Grid View on 28-11-2016-->
                        <div id="myModalIndividualForGridView" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" id="matchHeadingForGridView">Match Status</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <!--                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Status</span></div>-->
                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Status  
                                                        </td>
                                                        <td>
                                                            <input type="hidden" id="aicontactId1"/>
                                                            <input type="hidden" id="aifield1"/>
                                                            <input type="hidden" id="aimatchId1"/>
                                                            <input type="hidden" id="aimid1"/>
                                                            <input type="hidden" id="aigroom1"/>
                                                            <div id="changeStatusDiv1">
                                                                <select id="aistatus1">
                                                                    <option value="0">Pending</option>
                                                                    <option value="1">Accept</option>
                                                                    <option value="2">Reject</option>
                                                                </select>
                                                            </div>





                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Remark 
                                                        </td>
                                                        <td>
                                                            <div class="controlsData"><input type="text"   id="airemark1"/></div>
                                                            <label value="Please enter remark" id="ivalidateremark1" style="display:none;color:red;"></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            Send Mail 
                                                            <div class="controlsData"><input type="checkbox" value="1"  id="aisendMailFlag1" class="checkbox_checkForGrid"/></div>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <button class="btn btn-primary" type="button" class="btn btn-default" onclick="saveStatusIndividualForGridView()">Submit</button>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="display:none;">

                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal22">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--Added by vineet For Grid View on 28-11-2016-->

                        <div id="myModalIndividual" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" id="matchHeading">Match Status</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <!--                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Status</span></div>-->
                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Status  
                                                        </td>
                                                        <td>
                                                            <input type="hidden" id="aicontactId"/>
                                                            <input type="hidden" id="aifield"/>
                                                            <input type="hidden" id="aimatchId"/>
                                                            <input type="hidden" id="aimid"/>
                                                            <input type="hidden" id="aigroom"/>
                                                            <div id="changeStatusDiv">
                                                                <select id="aistatus">
                                                                    <option value="0">Pending</option>
                                                                    <option value="1">Accept</option>
                                                                    <option value="2">Reject</option>
                                                                </select>
                                                            </div>





                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Remark 
                                                        </td>
                                                        <td>
                                                            <div class="controlsData"><input type="text"   id="airemark"/></div>
                                                            <label value="Please enter remark" id="ivalidateremark" style="display:none;color:red;"></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            Send Mail 
                                                            <div class="controlsData"><input type="checkbox" value="1"  id="aisendMailFlag" class="checkbox_check"/></div>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <button class="btn btn-primary" type="button" class="btn btn-default" onclick="saveStatusIndividual()">Submit</button>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="display:none;">

                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal21">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>



                        <div id="myModalHorizontal" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Match Status1</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Status</span></div>
                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Status  
                                                        </td>
                                                        <td>
                                                            <input type="text" id="ahcontactId"/>
                                                            <input type="text" id="ahfield"/>
                                                            <input type="text" id="ahmatchId"/>
                                                            <input type="text" id="ahmid"/>
                                                            <input type="text" id="ahgroom"/>
                                                            <select id="ahstatus" style="display:none;">
                                                                <option value="0">Pending</option>
                                                                <option value="1">Accept</option>
                                                                <option value="2">Reject</option>
                                                            </select>





                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Remark 
                                                        </td>
                                                        <td>
                                                            <input type="text"   id="ahremark"/>
                                                            <label value="Please enter remark" id="hvalidateremark" style="display:none;color:red;"></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <button type="button" class="btn btn-default" onclick="saveStatusHorizontal()">Submit</button>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="display:none;">

                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal2">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div id="myModal1" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Set Meeting1 </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Set Meeting</span></div>

                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Venue:  
                                                        </td>
                                                        <td>       
                                                            <input type="text"  id="scheduleMeetingStatusid"/>
                                                            <input type="text"  id="scheduleMeetingContactId"/>
                                                            <input type="text"   id="venue">
                                                            <label  style="color:red;display:none;" id="validateVenue">Please enter venue</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Date/Time:
                                                        </td>
                                                        <td>
                                                            <input class="form-control" type="text"  id="scheduleDate" placeholder="Date" />                                                    
                                                            <label style="color:red;display:none" id="validatescheduleDate">Please select date</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Description
                                                        </td>
                                                        <td>
                                                            <input type="text" id="description">
                                                            <label style="color:red;display:none" id="validateDescription">Please enter description</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Groom Side:
                                                        </td>
                                                        <td>
                                                            <input type="text" id="fromGroomSide">                                                     
                                                            <label style="color:red;display:none" id="validatefromGroomSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Bride Side:
                                                        </td>
                                                        <td>
                                                            <input type="text" id="fromBrideSide">                                                      
                                                            <label   style="color:red;display:none" id="validatefromBrideSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="radio" name="contact.maritalStatus" value="1" checked="true" id="maritalStatus1" > New Meeting
                                                            <input type="radio" name="contact.maritalStatus" value="2"> Reschedule
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" value="1" checked="true">Send Mail
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" onclick="return scheduleMeeting()">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="myModal1Individual" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" id="closeMeeting">&times;</button>
                                        <h4 class="modal-title">Set Meeting </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <!--                                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Set Meeting</span></div>-->

                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Venue:  
                                                        </td>
                                                        <td>       
                                                            <input type="hidden"  id="ischeduleMeetingStatusid"/>
                                                            <input type="hidden"  id="ischeduleMeetingMatchId"/>
                                                            <input type="hidden"  id="ischeduleMeetingContactId"/>
                                                            <div class="controlsData"><input type="text"   id="ivenue"></div>
                                                            <label  style="color:red;display:none;" id="ivalidateVenue">Please enter venue</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Date/Time:
                                                        </td>
                                                        <td>
                                                            <div class="col-lg-6 paddingNone">
                                                                <input class="form-control" type="text"  id="ischeduleDate" placeholder="Date" />   
                                                                <label style="color:red;display:none" id="ivalidatescheduleDate">Please select date and time</label>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <input id="timepicker1" type="text" name="timepicker1" class="form-control" placeholder="Time"/>
                                                                <!--                                                                        <div class="input-group bootstrap-timepicker timepicker">
                                                                                                                                            <input id="timepicker1" type="text" class="form-control input-small" style="position: relative">
                                                                                                                                            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                                                                                                                        </div>-->
                                                            </div>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Description
                                                        </td>
                                                        <td>
                                                            <div class="controlsData"><input type="text" id="idescription"></div>
                                                            <label style="color:red;display:none" id="ivalidateDescription">Please enter description</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Groom Side:
                                                        </td>
                                                        <td>
                                                            <div class="controlsData"><input type="text" id="ifromGroomSide">  </div>                                                   
                                                            <label style="color:red;display:none" id="ivalidatefromGroomSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Bride Side:
                                                        </td>
                                                        <td>
                                                            <div class="controlsData"><input type="text" id="ifromBrideSide">     </div>                                                 
                                                            <label   style="color:red;display:none" id="ivalidatefromBrideSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Remarks:
                                                        </td>
                                                        <td>
                                                            <div class="controlsData">
                                                                <input type="text" id="ifRemarks">    
                                                            </div>                                                 

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="radio" name='mtp' value="1" checked="true" id="mtp1"> New Meeting
                                                            <input type="radio"  name='mtp' value="2" id="mtp2"> Reschedule
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="checkbox" value="1"   id="sendMailFlag" >Send Mail
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input class="btn btn-primary" type="submit" onclick="return scheduleMeetingIndividual()">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="myModal1Horizontal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Set Meeting2 </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Set Meeting3</span></div>

                                            </div>
                                            <section class="formFull">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Venue:  
                                                        </td>
                                                        <td>       
                                                            <input type="text"  id="hscheduleMeetingStatusid"/>
                                                            <input type="text"  id="hscheduleMeetingContactId"/>
                                                            <input type="text"   id="hvenue">
                                                            <label  style="color:red;display:none;" id="hvalidateVenue">Please enter venue</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Date/Time:
                                                        </td>
                                                        <td>
                                                            <input class="form-control" type="text"  id="hscheduleDate" placeholder="Date" />                                                    
                                                            <label style="color:red;display:none" id="hvalidatescheduleDate">Please select date</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Description
                                                        </td>
                                                        <td>
                                                            <input type="text" id="hdescription">
                                                            <label style="color:red;display:none" id="hvalidateDescription">Please enter description</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Groom Side:
                                                        </td>
                                                        <td>
                                                            <input type="text" id="hfromGroomSide">                                                     
                                                            <label style="color:red;display:none" id="hvalidatefromGroomSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            From Bride Side:
                                                        </td>
                                                        <td>
                                                            <input type="text" id="hfromBrideSide">                                                      
                                                            <label   style="color:red;display:none" id="hvalidatefromBrideSide">Please enter side</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <input type="radio" name="contact.maritalStatus" value="1" checked="true" id="maritalStatus1" > New Meeting
                                                            <input type="radio" name="contact.maritalStatus" value="2"> Reschedule
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" value="1" selected>Send Mail
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="submit" onclick="return scheduleMeetingHorizontal()">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div id="myModal2" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Change Meeting </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Change Meeting</span></div>

                                            </div>
                                            <section class="formFull">
                                                <div id="editMeeting">

                                                </div>

                                            </section>
                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal3">Close</button>-->

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="setPriority" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Change Priority</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Change Priority</span></div>

                                            </div>
                                            <input type="hidden" id="pcontactId"/>
                                            <input type="hidden" id="pmatchId"/>


                                            <section class="formFull">
                                                <a href="#" onclick="setPriority(3)">High</a><br/>
                                                <a href="#" onclick="setPriority(2)">Medium</a><br/>
                                                <a href="#" onclick="setPriority(1)">Low</a>

                                            </section>
                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal3">Close</button>-->

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="contactExchange" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Contact Exchange</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span id="exchangeHeading">Contact Exchange</span></div>

                                            </div>
                                            <input type="hidden" id="xcontactId"/>
                                            <input type="hidden" id="xmatchId"/>
                                            <div id="contactExchangeDiv">
                                            </div>


                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <button type="button" style="display:none;" class="btn btn-default" data-dismiss="modal" id="xchangeCloseButton">Close</button>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="myModal2Individual" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" >&times;</button>
                                        <h4 class="modal-title">Change Meeting </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <!--  <div class="formHEADDiv whiteBG">
                                                    <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Change Meeting</span></div>

                                                </div>-->
                                            <section class="formFull">
                                                <div id="editMeetingIndividual">

                                                </div>

                                            </section>
                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="myModal2Individual">Close</button>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="myModal2Horizontal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Change Meeting </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Change Meeting</span></div>

                                            </div>
                                            <section class="formFull">
                                                <div id="editMeetingHorizontal">

                                                </div>

                                            </section>
                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal" id="closeModal3">Close</button>-->

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div id="myModal3" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!--                                        <form action="emailBioData" method="post">-->
                                <input type="hidden" name="contact.contactId" value="${contact.contactId}" id="ocontactId">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Outbox</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <br/><br/>
                                            <table>
                                                <tr >
                                                    <td>Send By: </td>
                                                    <td><input type="radio" value="1"  id="intMailBy" name="email" checked> Email
                                                        <input type="radio"  value="2" id="intMailBy" name="email"> By Hand
                                                        <input type="radio" value="4"  id="intMailBy" name="email"> SMS
                                                        <input type="hidden" name="contact.email" id="emailForShortList"/>
                                                        <input type="hidden" name="contact.page" id="page" value="1"/>
                                                        <input type="hidden" name="contact.mailType" id="mailType"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        To:
                                                    </td>
                                                    <td>
                                                        <div class="controlsData"><input type="email" name="contact.mailTo" id="mailTo" readonly="true" value="${contact.emailRef}"/></div>
                                                    </td>
                                                </tr>
                                                <!--                                                            <tr>
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
                                                        <div class="controlsData"> <input type="email" name="contact.emailRef" id="emails"/></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Note:
                                                    </td>
                                                    <td>
                                                        <textarea type="text" name="contact.mailNote" id="mailNote"  style="height: 250px"></textarea>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br/>
                                            <section class="formFull" id="outBoxSection">
                                                <!--ajax comes here-->
                                            </section>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" style="display:none;" data-dismiss="modal" id="closeModal4">Close</button>
                                    </div>
                                </div>
                                <!--</form>-->
                            </div>
                        </div>
                        <!--copy from here-->      
                    </div>
                    </div>
                </section>
            </section>

        </section>
        <datalist id="searchNameHeader" style="display:none;">

            <%
                List contactList = new ProfileManager().getContactListByNameHeader();
                for (int i = 0; i < contactList.size(); i++) {
                    Contact contact = (Contact) contactList.get(i);
            %>
            <option value="<%=contact.getFirstName()%> <%=contact.getMiddleName()%> <%=contact.getLastName()%> <%=contact.getProfileId()%>"> </option>
            <%
                }
            %>

        </datalist>    
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <!--<script src="../js/jquery.js"></script>-->
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

                $("#tags,#excludeCity,#statusCity")
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
        <script>
            $('#timepicker1').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});
            $('#timepicker3').timepicki();
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var value = 0;
                $('#scheduleDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#ischeduleDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#inextDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#sffnextDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#hscheduleDate').datepicker({
                    format: "dd/mm/yyyy",
                });
                $("#collapseIcon").rotate({
                    bind:
                            {
                                click: function () {
                                    value += 180;
                                    $(this).rotate({animateTo: value})
                                }
                            }
                });
                var statusFlag = document.getElementById("statusFlag").value;
                if (statusFlag === "1")
                {
                    document.getElementById("statusReportTab").click();
                } else
                {

                    document.getElementById("matchReportId").click();
                    $('#divideList').val(0);
                    $('#listViewMatch').show();
                    $('#gridViewMatch').show();
                    $('#listView').hide();
                    $('.listViewStatus').hide();
                }

                var emailFlagIcon = document.getElementById("emailFlagIcon").value;
                if (emailFlagIcon === "1")
                {
                    $('#emailTabMenuDisplay').click();
                    $('#addEmailStatusFinalTab').click();
                }
                document.getElementById('searchBy').addEventListener('input', function () {

                    var val = document.getElementById("searchBy").value;
                    var data = val.split(" ");
                    if (data.length > 3)
                    {
                        $('.searchButton').click();
                    }
                });

//               document.getElementById('searchTab').click();
                var categoryPermissionId = document.getElementById("categoryPermissionString").value;
                var arrayOfValues = categoryPermissionId.split(",");
                for (var i = 0; i < arrayOfValues.length; i++)
                {
                    console.log(arrayOfValues);
                    document.getElementById('ui-multiselect-0-ckbox' + arrayOfValues[i]).click();
                }
                document.getElementById('hideSearchBox').click();
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
                            document.getElementById('sfemailSubject').value = "";
                            CKEDITOR.instances.emailContent.setData('');
                        }, error: function (jqXHR, textStatus, errorThrown) {
                            document.getElementById('loading').style.display = "none";
                            $("input[type=file]").val("");
                            document.getElementById('sfemailSubject').value = "";
                            CKEDITOR.instances.emailContent.setData('');
                        }
                    });
                    e.preventDefault();
                    e.unbind();
                });
            });

            $(document).ready(function () {
                $('.pop-gallery').magnificPopup({
                    delegate: '.statusPopup a',
                    type: 'image',
                    tLoading: 'Loading image #%curr%...',
                    mainClass: 'mfp-img-mobile',
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true,
                        preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
                    },
                    image: {
                        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
                        titleSrc: function (item) {
                            return item.el.attr('title') + '<small></small>';
                        }
                    }
                });
            });

            $(document).ready(function () {
                $('.popup-gallery').magnificPopup({
                    delegate: '.statusPopup a',
                    type: 'image',
                    tLoading: 'Loading image #%curr%...',
                    mainClass: 'mfp-img-mobile',
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true,
                        preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
                    },
                    image: {
                        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
                        titleSrc: function (item) {
                            return item.el.attr('title') + '<small></small>';
                        }
                    }
                });
            });

            $(document).ready(function ()
            {
//                var hFrom=document.getElementById('hiddenHeightFrom').value;
//                document.getElementById('heightFrom').value(hFrom);
//                
//                var hTo=document.getElementById('hiddenHeightTo').value;
//                document.getElementById('listViewMatch').click();

                $('#matchReportId').click(function ()
                {
                    var heightFrom = document.getElementById('hiddenHeightFrom').value;
                    document.getElementById('heightFrom').value = heightFrom;
                    var heightTo = document.getElementById('hiddenHeightTo').value;
                    document.getElementById('heightTo').value = heightTo;
                    $('#divideList').val(0);
                    $('#listViewMatch').show();
                    $('#gridViewMatch').show();
                    $('#homeHide').show();
                    $('#listView').hide();
                    $('.listViewStatus').hide();
                    $('#menus3').hide();
                    $('#menus2').hide();
                    $('#menus5').hide();
                });
                $('#listViewMatch').click(function ()
                {
                    $('#divideList').val(1);
                    $('#listView').hide();
                    $('sent1').hide();
                    $('search1').hide();
                    $('received1').hide();
                    $('both1').hide();
                    $('#menus3').hide();
                    $('#menus2').hide();
                    $('#menus5').hide();
                });
                $('#gridViewMatch').click(function () {
                    $('#divideList').val(0);
                    $('#matchListReport').hide();
                    $('#homeHide').show();
                    $('#divcontent').show();
                    $('#menus3').hide();
                    $('#menus2').hide();
                    $('#menus5').hide();


                });
                $(document).on("click", '#statusReportTab', function ()
                {
                    $('#listViewMatch').hide();
                    $('#gridViewMatch').hide();
                    $('#listView').show();
                    $('.listViewStatus').show();
                    $('#menus3').hide();
                    $('#menus2').hide();
                    $('#menus5').hide();
                });
                document.getElementById('txtAutoCompleteHeader').style.display = "block";

            });

            $(document).ready(function () {
                $('#xyz1').click(function () {
//                    $("homeHide").getNiceScroll().hide();
                    $("#usersList").niceScroll({
                        cursorcolor: "rgb(243, 131, 131)",
                        cursorwidth: 5,
                        cursoropacitymin: 0.7,
                        cursorheight: 30,
                        width: 10
                    });
                    $("#subinay2").niceScroll({
                        cursorcolor: "rgb(243, 131, 131)",
                        cursorwidth: 5,
                        cursoropacitymin: 0.7,
                        cursorheight: 30,
                        width: 10
                    });


                    $($(this).attr('href')).find("tab-pane").getNiceScroll().show();
                });


            });

            function matchReportIndi(contactId) {
//    alert();
                var contactId1 = contactId;
//    alert("matchReportIndi : " + contactId);

//    $('#divideList').val(0);
//    $('#listViewMatch').show();
//    $('#gridViewMatch').show();
//    $('#listView').hide();
//    $('.listViewStatus').hide();
//    $('#homeHide').show();
//    $('#searchTab').click();
                showMatchDiv(contactId1);
//    alert();
//    setTimeout(function () {
//        $('#searchButtonTag').click();
//    }, 500);
            }


            function searchMatchList()
            {
                var divide = document.getElementById("divideList").value;
                var ajaxContactId = document.getElementById("ajaxContactId").value;
                var maritalStatus = document.getElementById("maritalStatus").value;
                var gender = document.getElementById("gender").value;
                var desiredPartnersAge1 = document.getElementById("partnerage1").value;
                var desiredPartnersAge2 = document.getElementById("partnerage2").value;
                var categoryId = "";
                var communityId = "";
                var countryId = document.getElementById("countryId").value;
                var cityId = document.getElementById("tags").value;
                var education = document.getElementById("tags1").value;
                var excludeCity = document.getElementById("excludeCity").value;
                var gotra = document.getElementById("gotra").value;
                var motherTongueId = document.getElementById("motherTongueId").value;
                var heightFrom = document.getElementById("heightFrom").value;
                var heightTo = document.getElementById("heightTo").value;
                var searchBy = document.getElementById("searchBy").value;
                var manglik = document.getElementById("manglik").value;
                var rmIdForMatchSearch = document.getElementById("rmIdForMatchSearch").value;

                var allVals = [];
                var allVals1 = [];
                var allVals2 = [];
                $('#checkboxes2 :checked').each(function () {
                    allVals2.push($(this).val());

                });
                if (allVals2 !== "")
                {
                    countryId = allVals2;
                }
                $('#checkboxes :checked').each(function () {
                    allVals.push($(this).val());
                });
                if (allVals !== "")
                {
                    categoryId = allVals;
                }
                $('#checkboxes1 :checked').each(function () {
                    allVals1.push($(this).val());
                });
                if (allVals1 !== "")
                {
                    communityId = allVals1;
                }
                document.getElementById("loading").style.display = "block";
                document.getElementById("hideSearchBox").click();
                $.ajax({
                    type: "post",
                    url: "getMatchListByNameAjax",
                    data: "rmIdForMatchSearch=" + rmIdForMatchSearch + "&countryId=" + countryId + "&manglik=" + manglik + "&education=" + education + "&communityId=" + communityId + "&desiredPartnersAge2=" + desiredPartnersAge2 + "&desiredPartnersAge1=" + desiredPartnersAge1 + "&contactId=" + ajaxContactId + "&searchBy=" + searchBy + "&maritalStatus=" + maritalStatus + "&gender=" + gender + "&categoryId=" + categoryId + "&cityId=" + cityId + "&gotra=" + gotra + "&motherTongueId=" + motherTongueId + "&heightFrom=" + heightFrom + "&heightTo=" + heightTo + "&divide=" + divide + "&excludeCity=" + excludeCity,
                    success: function (html)
                    {
                        document.getElementById("loading").style.display = "none";

                        if (divide == 0)
                        {
                            document.getElementById("usersList").style.display = "block";
                            document.getElementById("usersList").innerHTML = html;
                            document.getElementById("matchHeaderListSizeDuplicate").innerHTML = document.getElementById("matchHeaderListSize").innerHTML;
                        } else
                        {
                            console.log(document.getElementById("matchHeaderListSize").innerHTML);
                            document.getElementById("matchReportIndividualDiv").style.display = "block";
                            document.getElementById("matchReportIndividualDiv").innerHTML = html;
                            document.getElementById("matchHeaderListSizeDuplicate").innerHTML = $("#ListMatchRecords").val();//document.getElementById("ListMatchRecords").value;
                        }
                    }, error: function ()
                    {
//            alert("Please try later");
                    }
                });
            }
        </script>

    </body>
</html>
