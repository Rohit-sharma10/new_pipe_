<%-- 
    Document   : registration
    Created on : 21 Mar, 2016, 12:55:43 PM
    Author     : OpenSpace004
--%>
<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="java.util.List"%> 
<%@page language="java" import="com.crm.manager.ProfileManager"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utfviewpdf2-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
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
        <link href="../css/magnific-popup.css" rel="stylesheet" /> <!--For image pop up -->
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <!--<script src="../js/jquery.js"></script>-->
        <script src="../js/jquery.autocomplete.js"></script>
        <script src="../js/registration.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />

    </head>
    <script type="text/javascript">
        $(function () {
            $("#restrictedProfileAutoComplete").autocomplete("../List.jsp");

        });
        $(function () {
            $("#birthcity").autocomplete("AstroCityAutoComplete.jsp");

        });
        $(function () {
            $("#grewUpCityId").autocomplete("CityAutocomplete.jsp");

        });
        $(function () {
//            $("#locationForWorkId").autocomplete("CityAutocomplete.jsp");

        });
        
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
    <style>
        .validation{

        }
        ac_results {
            padding: 0px;
            border: 1px solid #aeabab;
            background-color: #aeabab;
            overflow: hidden;
        }
        .ac_results ul {
            width: 100%;
            list-style-position: outside;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .ac_results li {
            margin: 0px;
            padding: 2px 5px;
            cursor: default;
            display: block;
            color: #fff;
            font-family:verdana;background-color: #aeabab; cursor: pointer;border-bottom: 1px dashed #ccc;
            /*
            if width will be 100% horizontal scrollbar will apear
            when scroll mode will be used
            */
            /*width: 100%;*/
            font-size: 12px;
            /*
            it is very important, if line-height not setted or setted
            in relative units scroll will be broken in firefox
            */
            line-height: 16px;
            overflow: hidden;
        }
        .ac_results li:hover{background-color: #e0e0e0;
                             color: #888;}
        .ac_loading {
            background: white url('../images/indicator.gif') right center no-repeat;
        }
        .ac_odd {
            background-color: #fcc300;
            color: #ffffff;
        }
        .ac_over {
            background-color: #fcc300;
            color: #000;
        }
        .input_text{
            font-family:Arial, Helvetica, sans-serif;
            font-size:12px;
            border:1px solid #84a10b;
            padding:2px;
            width:150px;
            color:#000;
            background:white url(../images/search.png) no-repeat 3px 2px;
            padding-left:17px;
        }

    </style>
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
                            <form>
                                <a href="fetchRegistration?contactId=${contact.contactId}" id="fetchRegistrationButton1"></a>
                                <a href="fetchRegistration?contactId=${contact.contactId}" onclick="showpdf()" id="fetchRegistrationButton"></a>
                            </form>

                            <div class="row">
                                <div class="col-lg-12 fixedHeadCandidate">
                                    <div class="headerMainContent">

                                        <div class="candidateDetailleft">
                                            <h4 class="candidateName">${contact.firstName} ${contact.middleName} ${contact.lastName}</h4>

                                            <div class="profileIDDiv">
                                                <div class="profileIDNum">${contact.category}${contact.profileId}</span> (<span class="color2">${contact.assignedToString}</span>) ${contact.assignedToArm}</div>
                                                <!--                                                <div class="pastCommLink"><a href="#">Past Communication</a></div>-->
                                            </div>

                                            <div class="candidatedetailONE">
                                                <span class="color1 upperText">Age:</span> <span class="color1 font700">${contact.age} Years</span>
                                                <span class="spanGAp"></span>
                                                <span class="color1 upperText">Height: </span> <span class="color1 font700">
                                                    <span class="color1 upperText">${contact.heightString} </span> <span class="color1 font700">

                                                    </span>
                                                </span>
                                            </div>
                                        </div>


                                        <div class="otherInfoDivheaderRight">
                                            <div class="dateScheduled">
                                                <span><img src="${pageContext.request.contextPath}/img/icons/clockIcon.png"/></span>
                                                <span class="color4 upperText">Last Edited on:</span> <span class="color5 font500"> ${contact.lastEditedDate}</span>
                                            </div>
                                            <div class="otherLinksDiv">
                                                <!--<a class="btn btn-primary" title="Bootstrap 3 themes generator" href=""></a>-->

                                                <%--<c:if test="${contact.movedStatus!='Active' && userSession.deptId==8}">--%>
                                                    <!--<div   class="btn btn-primary" ><a href="chengeMovedStatus?movedFlag=0&contactId=${contact.contactId}"  >Active</a></div>-->
                                                <%--</c:if>--%>
                                                <div value="View Biodata"  class="btn btn-primary" ><a href="#" data-toggle="modal" data-target="#biodata" >Upload Biodata</a></div>

                                                <div value="Generate PDF"  class="btn btn-red" onclick="createPdfPresentation(${contact.contactId})">Generate PDF</div>
                                                
                                                <div  style="display:inline-block">

                                                    <c:if test="${contact.pdfPresentationFile!=null}">
                                                        <div class="btn btn-primary" id="viewpdf1" onclick="saveDownloadInfo(${contact.contactId},'View Pdf ')"> 
<!--                                                            <a href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${contact.pdfPresentationFile}">View Pdf</a>-->
                                                            <a href="${pdfpresentationPath}${contact.pdfPresentationFile}">View Pdf</a>
                                                        </div>
                                                    </c:if>
                                                    
                                                    <c:if test="${contact.biodata!=null}">
                                                        <div class="btn btn-red" onclick="saveDownloadInfo(${contact.contactId},'View biodata ')">
                                                            <!--<a href="http://52.36.146.110:8080/sl_data/sl_data/biodata/${contact.biodata}">View biodata</a>-->
                                                            <a href="${biodata_path}${contact.biodata}">View biodata</a>
                                                        </div>
                                                    </c:if>


                                                </div>   
                                                <!-- #### NEW PDF FORMAT - 4-9-2018 #### -->
                                                <div value="Generate PDF New Format"  class="btn btn-red" onclick="createPdfPresentationNewFormat(${contact.contactId})">Generate PDF New Format</div>
                                                <div  style="display:inline-block">
                                                    <c:if test="${contact.pdfPresentationFileNewFormat!=null}">
                                                        <div class="btn btn-primary" id="viewpdf2" onclick="saveDownloadInfo(${contact.contactId},'View Pdf New Format ')"> 
<!--                                                            <a href="http://52.36.146.110:8080/sl_data/sl_data/pdfpresentation/${contact.pdfPresentationFileNewFormat}">View Pdf New Format</a>-->
                                                            <a href="${pdfpresentationPath}${contact.pdfPresentationFileNewFormat}">View Pdf New Format</a>
                                                        </div>
                                                    </c:if>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--photo-->                      
                            <div class="row">
                                <div class="col-lg-12"><br/>
                                    <section class="panel noShadow">
                                        <header class="panel-heading tab-bg-primary noeffect1">
                                            <ul class="nav nav-tabs tabBG">
                                                <li class="active">
                                                    <a href="#home-2" data-toggle="tab" class="upperText">
                                                        <i class="icon-home"></i>Photo Album
                                                    </a>
                                                </li>
                                               
                                                <c:if test="${userSession.deptId==12}">
                                                <li class="">
                                                    <a href="#about-2" data-toggle="tab" class="upperText">
                                                        <i class="icon-user"></i>
                                                        Profile Activity
                                                    </a>
                                                </li>
                                                </c:if>
                                            </ul>
                                        </header>
                                        <div class="panel-body noBorder" id="mainDiv">
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="home-2">
                                                    <div class="uploadPhotoDIV" style="display:none;">
                                                        <button value="Upload New Photos" class="btn btn-primary-upload-photo">Upload New Photos</button>
                                                        <input type="file" value=""    id="fileForLogo" />
                                                        <span class="imgUploadNote">Image size should be not more than 160px (width) X 200px (height)</span>
                                                    </div>






                                                    <div class="candidatePHOTO">
                                                        <div class="popup-gallery">
                                                            <div class="candidatePHOTOContent" id="divimage1" >
                                                                <div class="candidateIMGDiv">

                                                                    <c:if test="${contact.image1!='' && contact.image1!=null}">
                                                                        <!--<a href="#" data-toggle="modal" data-target="#bigImage1" >-->
<!--                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1}" title="Image 1"><img  src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1_replica}" class="popup-image"/></a>-->
                                                                        <a href="${profileimgPath}${contact.image1}" title="Image 1"><img  src="${profileimgPath}${contact.image1_replica}" class="popup-image"/></a>
                                                                        
                                                                        <!--<a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/{contact.image1}" title="Image 1"><img  src="E:/sagar_subhlagan/pdf/{contact.image1}" class="popup-image"/></a>-->
                                                                        </c:if>


                                                                </div>
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="#"   data-toggle="modal" data-target="#image"><img onclick="uploadImage(1)" src="${pageContext.request.contextPath}/img/icons/refreshIcon.png" alt="Icon" title="Upload Image"/></a></span>
                                                                    <span>
                                                                        <a href="#"   data-toggle="modal" data-target="#image1"><img src="../img/icons/deleteIcon.png" alt="Icon" onclick="deleteImage(1)" title="Delete"/></a>
                                                                    </span>
                                                                </div>
                                                            </div> 
                                                            <div class="candidatePHOTOContent" id="divimage2">
                                                                <div class="candidateIMGDiv">

                                                                    <c:if test="${contact.image2!='' && contact.image2!=null}">
                                                                        <!--<a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2}" title="Image 2"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2_replica}"/></a>-->
                                                                        <a href="${profileimgPath}${contact.image2}" title="Image 2"> <img src="${profileimgPath}${contact.image2_replica}"/></a>
                                                                        </c:if>
                                                                </div>
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="#"   data-toggle="modal" data-target="#image"><img onclick="uploadImage(2)" src="${pageContext.request.contextPath}/img/icons/refreshIcon.png" alt="Icon" title="Change Image"/></a></span>
                                                                    <span>
                                                                        <a href="#"   data-toggle="modal" data-target="#image1"><img src="../img/icons/deleteIcon.png" alt="Icon" onclick="deleteImage(2)" title="Delete"/></a>
                                                                    </span>
                                                                </div>
                                                            </div> 
                                                            <div class="candidatePHOTOContent" id="divimage3">
                                                                <div class="candidateIMGDiv">
                                                                    <c:if test="${contact.image3!='' && contact.image3!=null}">
<!--                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3}" title="Image 3"><img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3_replica}"/></a>-->
                                                                        <a href="${profileimgPath}${contact.image3}" title="Image 3"><img src="${profileimgPath}${contact.image3_replica}"/></a>
                                                                        </c:if>
                                                                </div>
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="#"  data-toggle="modal" data-target="#image"><img  onclick="uploadImage(3)" src="../img/icons/refreshIcon.png" alt="Icon" title="Change Image"/></a></span>
                                                                    <span>
                                                                        <a href="#"   data-toggle="modal" data-target="#image1"><img src="../img/icons/deleteIcon.png" alt="Icon" onclick="deleteImage(3)" title="Delete"/></a>

                                                                    </span>
                                                                </div>
                                                            </div> 

                                                            <div class="candidatePHOTOContent" id="divimage4">
                                                                <div class="candidateIMGDiv">
                                                                    <c:if test="${contact.image4!='' && contact.image4!=null}">
<!--                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4 }" title="Image 4"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4_replica}"/></a>-->
                                                                        <a href="${profileimgPath}${contact.image4 }" title="Image 4"> <img src="${profileimgPath}${contact.image4_replica}"/></a>
                                                                        </c:if>
                                                                </div>
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="#"  data-toggle="modal" data-target="#image"><img onclick="uploadImage(4)" src="../img/icons/refreshIcon.png" alt="Icon" title="Change Image"/></a></span>
                                                                    <span>
                                                                        <a href="#"   data-toggle="modal" data-target="#image1"><img src="../img/icons/deleteIcon.png" alt="Icon" onclick="deleteImage(4)" title="Delete"/></a>
                                                                    </span>
                                                                </div>
                                                            </div>

                                                            <div class="importantNoteCandidate">
                                                                <!--                                                            <div class="alertNoteDiv"> <img src="{pageContext.request.contextPath}/img/icons/alertIcon.png" alt="Icon"/>  Important note </div>
                                                                                                                            <div class="meetingText">This profile is inactive as Meeting is scheduled on</div>
                                                                                                                            <div class="meetingDataDiv">
                                                                
                                                                                                                            </div>-->
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div><!--PHOTO ALBUM ENDS-->



                                                <!--For Testing Hetal; mam-->

                                                <div class="popup-gallery">
                                                    <!--	<a href="http://farm9.staticflickr.com/8242/8558295633_f34a55c1c6_b.jpg" title="The Cleaner"><img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8382/8558295631_0f56c1284f_b.jpg" title="Winter Dance"><img src="http://farm9.staticflickr.com/8382/8558295631_0f56c1284f_s.jpg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8225/8558295635_b1c5ce2794_b.jpg" title="The Uninvited Guest"><img src="http://farm9.staticflickr.com/8225/8558295635_b1c5ce2794_s.jpg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8383/8563475581_df05e9906d_b.jpg" title="Oh no, not again!"><img src="http://farm9.staticflickr.com/8383/8563475581_df05e9906d_s.jpg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8235/8559402846_8b7f82e05d_b.jpg" title="Swan Lake"><img src="http://farm9.staticflickr.com/8235/8559402846_8b7f82e05d_s.jpg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8235/8558295467_e89e95e05a_b.jpg" title="The Shake"><img src="http://farm9.staticflickr.com/8235/8558295467_e89e95e05a_s.jpg" height="75" width="75"></a>
                                                            <a href="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_b.jpg" title="Who's that, mommy?"><img src="http://farm9.staticflickr.com/8378/8559402848_9fcd90d20b_s.jpg" height="75" width="75"></a>-->
                                                </div>




                                                <div class="tab-pane" id="about-2">
                                                    <div class="yourActHead">Your Activity</div>
                                                    <div id="profileActivity" class="tabbable tabs-left">
                                                        <ul class="profileActivityLEFT">
                                                            <li class="active"><a href="#home" data-toggle="tab" onclick="showAllActivity(${contact.contactId})">All</a></li>
                                                            <li><a href="#tab2" data-toggle="tab" onclick="fetchActivityList(1,${contact.contactId})">Profile Details</a></li>
                                                            <li><a href="#tab3" data-toggle="tab" onclick="fetchActivityList(3,${contact.contactId})">Match</a></li>
                                                            <li><a href="#tab4" data-toggle="tab" onclick="fetchActivityList(2,${contact.contactId})">Meeting</a></li>
                                                            <li><a href="#tab5" data-toggle="tab" onclick="fetchActivityList(5,${contact.contactId})">Contact Exchange</a></li>
                                                            <li><a href="#tab6" data-toggle="tab" onclick="fetchLockUnlockRemark(${contact.contactId})">Lock/Unlock Remark</a></li>
                                                            <!--<li><a href="#tab6" data-toggle="tab">Boy/Girl Met</a></li>-->
                                                        </ul>
                                                        <div class="tab-content profileActivityRIGHT scroll-panel">

                                                            <div class="tab-pane fade in active" id="home">
                                                                <!--For loader div-->
                                                                <div class="loader" style="display:none">
                                                                    <center><img src="../img/loader1.gif"/></center>
                                                                </div>
                                                                <!--loader div End-->
                                                                <div id="all">

                                                                </div>

                                                            </div>
                                                            <!--                                                            <div class="tab-pane" id="tab2">
                                                                                                                            Profile Details
                                                                                                                        </div>
                                                                                                                        <div class="tab-pane" id="tab3">
                                                                                                                            Client Preference Set
                                                                                                                        </div>-->
                                                            <!--                                                            <div class="tab-pane" id="tab4">
                                                                                                                            <ul>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                                <li>
                                                                                                                                    <div class="profileContentDiv">
                                                                                                                                        <div class="meetingDate">13-Nov-2015 02.37pm by <span>Varun Gupta</span></div>
                                                                                                                                        <div class="meetingData">Meeting with <span><a href="#">Nishant Kumar Gupta</a></span> on 12-Nov-2015 At Taj Land's End, Bandra</div>
                                                                                                                                    </div>
                                                                                                                                </li>
                                                                                                                            </ul>
                                                                                                                        </div>-->
                                                            <!--                                                            <div class="tab-pane" id="tab5">
                                                                                                                            Meeting Scheduled
                                                                                                                        </div>-->
                                                            <!--                                                            <div class="tab-pane" id="tab6">
                                                                                                                            Meeting Success
                                                                                                                        </div>-->
                                                            <!--                                                            <div class="tab-pane" id="tab7">
                                                                                                                            Boy Met
                                                                                                                        </div>-->
                                                        </div>	
                                                    </div>
                                                </div><!--PROFILE ACTIVITY ENDS-->
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div><!--CANDIDATE PHOTOS ENDS-->                       

                            <div class="row"><!--starts1-->
                                <div class="col-lg-12">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/userDetailIcon.png" alt="Icon"/> <span>Profile Overview</span></div>
                                        <div class="formEdit"><a href="#!" id="edit" ></a>
                                        </div>
                                    </div>
                                    <section class="formHalf">


                                        <div class="formDATA">
                                            <label>Height</label>
                                            <div class="controlsData">


                                                ${contact.heightString}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Date of Birth</label>
                                            <div class="controlsData"> 

                                                ${contact.dobString}  (${contact.age} Years)
                                            </div>
                                        </div>

                                        <div class="formDATA">

                                            <label>Education</label>
                                            <div class="controlsData">
                                                ${contact.educationIntro}
                                            </div>

                                        </div>
                                        <div class="formDATA">

                                            <label>Occupation</label>
                                            <div class="controlsData">

                                                ${contact.occupationName}
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Business</label>
                                            <div class="controlsData">

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Residence Address</label>
                                            <div class="controlsData">
                                                ${contact.contactAddress}
                                            </div>
                                        </div>

                                    </section><!--form half left ends-->

                                    <section class="formHalf">

                                        <div class="formDATA">

                                            <label>Father's Name</label>
                                            <div class="controlsData">
                                                ${contact.father}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Mother's Name</label>
                                            <div class="controlsData">
                                                ${contact.mother}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Native</label>
                                            <div class="controlsData">

                                                ${contact.nativeData}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Gotra</label>
                                            <div class="controlsData">
                                                ${contact.gotraName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Sibling</label>
                                            <div class="controlsData">
                                                Brothers :${brotherList.size()} 
                                                Sisters :${sisterList.size()} 
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Gender</label>
                                            <div class="controlsData">
                                                <c:if test="${contact.gender=='M'}">
                                                    Male
                                                </c:if>
                                                <c:if test="${contact.gender=='F'}">
                                                    Female
                                                </c:if>
                                            </div>
                                        </div>
                                    </section><!--form half right ends-->
                                </div><!--Profile overview ends-->
                                <div class="col-lg-12">
                                    <div class="profileDetailTABS">
                                        <a href="#intro" class="scroll btnLink active">Introductory</a>
                                        <a href="#education" class="scroll btnLink">Education</a>
                                        <a href="#family" class="scroll btnLink">Family</a>
                                        <a href="#business" class="scroll btnLink">Business / Profession</a>
                                        <a href="#familybusiness" class="scroll btnLink">Family Business / Profession</a>
                                        <a href="#medical" class="scroll btnLink">Medical History</a>
                                        <a href="#contactdetail" class="scroll btnLink">Contact Details</a>
                                        <a href="#prefer" class="scroll btnLink">Preferences</a>
                                        <a href="#specialcase" class="scroll btnLink">Special Case</a>
                                        <!--<a href="#regfee" class="scroll btnLink">Payment Of Registration Fee</a>-->
                                        <a href="#restrictedProfle" class="scroll btnLink">Restricted Profile</a>
                                        <a href="#officeUse" class="scroll btnLink">Office use</a>
                                    </div>
                                </div><!--TABS ENDS-->

                                <!--intro starts-->
                                <div class="col-lg-12" id="introductoryDivDisplay">
                                    <div id="intro" class="scrollanchor"></div>
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="${pageContext.request.contextPath}/img/icons/partnerIcon.png" alt="Icon"/> 
                                            <span>Introductory</span>
                                        </div>
                                        <div class="formEdit"><a href="#!" onclick="displayIntro()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Name</label>
                                            <div style="text-transform: capitalize;" class="controlsData">
                                                ${contact.firstName} ${contact.middleName} ${contact.lastName}
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Gender</label>
                                            <div style="text-transform: capitalize;" class="controlsData">
                                                <c:if test="${contact.gender=='M'}">
                                                    Male
                                                </c:if>
                                                <c:if test="${contact.gender=='F'}">
                                                    Female
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Birth</label>
                                            <div class="controlsData">
                                                <div class="dobDiv">

                                                    <div class="dobdetail">Date : ${contact.dobString}</div>
                                                    <div class="dobdetail">Time : ${contact.hour}:${contact.minute}:${contact.second}</div>
                                                    <div class="dobdetail">Place : ${contact.birthcity}</div>
                                                    <div class="dobdetail">Country : ${contact.birthCountryName}</div>
                                                </div>
                                                <!--                                                <table>
                                                                                                    <tr>
                                                                                                        <th>Date</th> <th>Time</th><th>Place</th>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td> <br/>  ({contact.dobString}  )</td>
                                                                                                        <td>{contact.hour}:{contact.minute}</td>
                                                                                                        <td>{contact.birthcity}</td>
                                                                                                    </tr>
                                                                                                </table>-->
                                            </div>
                                        </div>
                                        <!--                                        <div class="formDATA">
                                                                                    <label>Country</label>
                                                                                    <div class="controlsData">
                                                                                        
                                                                                    </div>
                                                                                </div>-->
                                        <div class="formDATA">
                                            <label>Native Place</label>
                                            <div class="controlsData">
                                                ${contact.nativeData}
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Caste </label>
                                            <div class="controlsData">
                                                ${contact.communityName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Gotra </label>
                                            <div class="controlsData">
                                                ${contact.gotraName}
                                            </div>
                                        </div>
                                        <!--                                        <div class="formDATA">
                                                                                    <label>Current Place</label>
                                                                                    <div class="controlsData">
                                        
                                                                                    </div>
                                                                                </div>-->
                                        <div class="formDATA">
                                            <label>Grew up in City</label>
                                            <div class="controlsData">                                                                                   
                                                ${contact.city}                                                                
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Grew up in Country</label>
                                            <div class="controlsData">                                        
                                                ${contact.countryName} 
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Present City</label>
                                            <div class="controlsData">                                        
                                                ${contact.presentCity} 
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Present Country </label>
                                            <div class="controlsData">                                        
                                                ${contact.presentCountryName} 
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Occupation</label>
                                            <div class="controlsData">
                                                ${contact.occupationName}
                                            </div>
                                            <label>Detail</label>
                                            <div class="controlsData">
                                                ${contact.locationForWork}
                                            </div>
                                        </div>

                                    </section>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Hobbies</label>
                                            <div class="controlsData">
                                                ${contact.hobbies}
                                            </div>
                                        </div>
                                        <!--                                        <div class="formDATA">
                                                                                    <label>Detail(Hobbies)</label>
                                                                                    <div class="controlsData">
                                        ${contact.hobiesAndIntrests}
                                    </div>
                                </div>-->
                                        <div class="formDATA">
                                            <label>Skin Tones</label>
                                            <div class="controlsData">
                                                ${contact.complexion}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Body Type</label>
                                            <div class="controlsData">
                                                ${contact.bodytype}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Height</label>
                                            <div class="controlsData">
                                                ${contact.heightString}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Weight(Kg)</label>
                                            <div class="controlsData">
                                                ${contact.bodyWeight==0.0?'':contact.bodyWeight}
                                            </div>
                                        </div>


                                        <div class="formDATA">
                                            <label>Food Habits</label>
                                            <div class="controlsData">
                                                ${contact.diet}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Zodiac Sign</label>
                                            <div class="controlsData">
                                                ${contact.zodiacName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Manglik</label>
                                            <div class="controlsData">
                                                ${contact.manglik}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Education</label>
                                            <div class="controlsData">
                                                ${contact.educationIntro}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>About Me</label>
                                            <div class="controlsData">
                                                ${contact.aboutMeHtml}
                                            </div>
                                        </div>
                                    </section>
                                </div><!--INTRODUCTORY ENDS-->

                                <!--edit intro starts-->
                                <form method="post" action="saveIntroductoryForm">
                                    <div class="col-lg-12" id="introductoryDivEdit" style="display:none;">

                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="${pageContext.request.contextPath}/img/icons/partnerIcon.png" alt="Icon"/> 
                                                <span>Introductory</span>
                                            </div>
                                            <div class="formEdit">
                                                <input onclick="return hideIntro()" class="btn btn-primary saveBtn" type="submit" value="Save">
                                                <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                            </div>
                                        </div>

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Name</label>
                                                <div class="controlsData">
                                                    <input type="text"  value="${contact.firstName}" name="contact.firstName" style="width: 30%!important;display: inline-block!important;">
                                                    <input type="text" value="${contact.middleName}" name="contact.middleName"  style="width: 30%!important;display: inline-block!important;">
                                                    <input type="text" value="${contact.lastName}" name="contact.lastName" style="width: 30%!important;display: inline-block!important;">
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Gender</label>
                                                <div class="controlsData">

                                                    <select name="contact.gender" value="${contact.gender}" >
                                                        <option value="M" ${contact.gender=="M"?'selected':''}>Male</option>
                                                        <option value="F" ${contact.gender=="F"?'selected':''}>Female</option>

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Birth</label>
                                                <div class="controlsData">
                                                    <ul class="dobedit">

                                                        <li><span class="spanWidth1">Date : </span>
                                                            <input type="text" class="dobInput inputWidthChange" id="dob" value="${contact.dobString1}" name="contact.dobString">
                                                        </li>
                                                        <li><span class="spanWidth1">Time :</span>
                                                            <s:select cssClass="timeSelect"  class="time" id="hourId" listKey="baseValue" listValue="baseValue" list="hourList" name="contact.hour" headerKey="0" headerValue="---Select Hour---" ></s:select>
                                                            <s:select  cssClass="timeSelect" class="time" id="minuteId" listKey="baseValue" listValue="baseValue" list="minuteList" name="contact.minute" headerKey="0" headerValue="---Select Minute---"></s:select>
                                                            <s:select  cssClass="timeSelect" class="time" id="secondId" listKey="baseValue" listValue="baseValue" list="secondList" name="contact.second" headerKey="0" headerValue="---Select second---"></s:select>
                                                            </li>
                                                            <li><span class="spanWidth1">Place : </span>
                                                                <input type="text" class="dobInput inputWidthChange" placeholder="Enter Place" id="birthcity" value="${contact.birthcity}" name="contact.birthcity">
                                                            <label id="validatebirthcity" style="display:none;width:100%;color:red;">Please enter valid birth place</label>
                                                        </li>

                                                        <li><span class="spanWidth1">Country : </span>
                                                            <s:select cssClass="countrySelect" listKey="birthCountryId" listValue="birthCountryName" list="birthCountryList" name="contact.birthCountryId" headerKey="0" headerValue="---Select Country---" ></s:select>
                                                                <!--<label id="validatebirthcity" style="display:none;width:100%;color:red;">Please enter valid birth place</label>-->
                                                            </li>

                                                        </ul>

                                                    </div>
                                                </div>
                                                <!--                                                <div class="formDATA">
                                                                                                    <label>Birth Country</label>
                                                                                                    <div class="controlsData">
                                            <%--<s:select   listKey="birthCountryId" listValue="birthCountryName" list="birthCountryList" name="contact.birthCountryId" headerKey="0" headerValue="---Select Country---"></s:select>--%>
                                            </div>
                                        </div>-->
                                            <div class="formDATA">
                                                <label>Native Place</label>
                                                <div class="controlsData">
                                                    <input type="text" value="${contact.nativeData}" name="contact.nativeData" id="nativeData">
                                                    <label id="validatenativeData" style="color:red;display:none;width:100%;">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Caste</label>
                                                <div class="controlsData">

                                                    <s:select  list="communityList"   listKey="communityId" listValue="communityName"  value="contact.communityId"  headerKey="0" headerValue="--Select community--" name="contact.communityId" />

                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Gotra</label>
                                                <div class="controlsData">

                                                    <s:select  list="gotraList"   listKey="gotraId" listValue="gotraName"  value="contact.gotraId"  headerKey="0" headerValue="--Select gotra--" name="contact.gotraId" />

                                                </div>
                                            </div>
                                            <!--                                            <div class="formDATA">
                                                                                            <label>Current Place</label>
                                                                                            <div class="controlsData">
                                            
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="formDATA">
                                                <label>Grew up in City</label>
                                                <div class="controlsData">
                                                    <input type="text" id="grewUpCityId" placeholder="Enter City"   value="${contact.city}" name="contact.city" class="dobInput"/>

                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Grew up in Country</label> <div class="controlsData">
                                                    <s:select  listKey="countryId" listValue="countryName" list="countryList" headerKey="0" headerValue="--Select Country--" name="contact.countryId" value="%{contact.countryId}" ></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Present City</label>
                                                    <div class="controlsData">
                                                        <input type="text" id="presentCityId" placeholder="Enter City"   value="${contact.presentCity}" name="contact.presentCity" class="dobInput"/>

                                                </div>
                                            </div>
                                                    
                                                    <div class="formDATA">
                                                <label>Present Country</label> <div class="controlsData">
                                                    <s:select  listKey="countryId" listValue="countryName" list="countryList" headerKey="0" headerValue="--Select Country--" name="contact.presentCountryId" value="%{contact.presentCountryId}" ></s:select>
                                                    </div>
                                                </div>

                                            <div class="formDATA">
                                                <label>Occupation</label>
                                                <div class="controlsData">
                                                    <s:select id="occupationId" listKey="workId" listValue="workName" list="workList" headerKey="0" headerValue="--Select Work--" name="contact.occupationId" value="%{contact.occupationId}" ></s:select>


                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Detail </label>
                                                    <div class="controlsData">
                                                        <input type="text" id="locationForWorkId" placeholder="Enter Detail"   value="${contact.locationForWork}"ocation name="contact.locationForWork" class="dobInput"/>

                                                </div>
                                            </div>
                                            <!--                                            <div class="formDATA">
                                                                                            <label>Location</label>
                                                                                            <div class="controlsData">
                                            
                                                                                            </div>
                                                                                        </div>-->
                                        </section>

                                        <!--Added For Auto Hobbies-->
                                        <input type="text" id="hobbiesAuto" value="${hobbiesList}" style="display:none;">
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Hobbies</label>
                                                <div class="controlsData">
                                                    <!--                                                    <span>
                                                                                                            <input id="hobbies" placeholder="Hobbies" type="text" >
                                                                                                        </span>-->
                                                    <s:select multiple="true" value="%{contact.hobbiesArray}" name="contact.hobbies" list="hobbiesList" listKey="hobbiesid" listValue="hobbies" style="height:90px!important;" ></s:select>

                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Skin Tones</label>
                                                    <div class="controlsData">


                                                    <s:select name="contact.complexionId" list="skinToneList" headerKey="0" headerValue="--Select Skin Tones--" listKey="complexionId" listValue="complexionType"></s:select>

                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Body Type</label>
                                                    <div class="controlsData">
                                                    <s:select name="contact.bodyTypeId"  id="bodyTypeId" list="bodyTypeList" headerKey="0" headerValue="--Select Body Type--" listKey="bodyTypeId" listValue="bodyType"></s:select>



                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Height</label>
                                                    <div class="controlsData">

                                                    <s:select  name="contact.heightString" value="%{contact.height}" headerKey="0" headerValue="--Select Height--" list="heightList" listValue="baseValue"  listKey="baseId"></s:select>

                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Weight(Kg)</label>
                                                    <div class="controlsData">

                                                        <input type="text" value="${contact.bodyWeight==0.0?'':contact.bodyWeight}" name="contact.bodyWeight"> 
                                                </div>
                                            </div>


                                            <div class="formDATA">
                                                <label>Food Habits</label>
                                                <div class="controlsData">


                                                    <s:select  name="contact.dietId" value="%{contact.dietId}" headerKey="0" headerValue="--Select Food Habits--" list="dietList" listValue="dietType"  listKey="dietId"></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Zodiac Sign</label>
                                                    <div class="controlsData">
                                                    <s:select listKey="zodiacId" listValue="zodiacName" list="zodiacList" headerKey="0" headerValue="-- Select Zodiac Sign--" name="contact.zodiacId"></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Manglik</label>
                                                    <div class="controlsData">

                                                        <select name="contact.manglik" value="${contact.manglik}" >
                                                        <option value="" ${contact.manglik==""?'selected':''}>--Select Manglik--</option>
                                                        <option value="Don't Know" ${contact.manglik=="Don't Know"?'selected':''}>Don't Know</option>
                                                        <option value="Yes" ${contact.manglik=="Yes"?'selected':''}>Yes</option>
                                                        <option value="No" ${contact.manglik=="No"?'selected':''}>No</option>
                                                        <option value="Anshik" ${contact.manglik=="Anshik"?'selected':''}>Anshik</option>
                                                    </select>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Education</label>
                                                    <div class="controlsData">
                                                        <s:select list="educationList" listKey="educationId" listValue="educationName" value="contact.educationId" name="contact.educationId" headerKey="0" headerValue="--Select Education--"></s:select>
                                                        </div>
                                                    </div>
                                                    <div class="formDATA">
                                                        <label>About Me</label>
                                                        <div class="controlsData">
                                                            <textarea id="ckeducation" class="form-control ckeditor"    name="contact.aboutMeHtml" rows="6">${contact.aboutMeHtml}</textarea>
                                                    </div>
                                                </div>
                                        </section>
                                    </div><!--EDIT INTRODUCTORY ENDS-->
                                </form>
                                <!--EDUCATION Starts-->



                                <div class="col-lg-12" id="displayEducation">
                                    <div id="education" class="scrollanchor"></div>
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/educationIcon.png" alt="Icon"/><span>Education</span></div>
                                        <div class="formEdit"><a href="#!" onclick="editEducation()">Edit</a></div>



                                    </div>
                                    <c:if test="${contactEducationList.size()!=0}">


                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                            <tr>
                                                <th> Degree
                                                </th>
                                                <th>   Location
                                                </th>
                                                <th>College
                                                </th>
                                                <th> year
                                                </th>
                                            </tr>
                                            <c:forEach items="${contactEducationList}" var="contactEducationListId">
                                                <tr>
                                                    <td>${contactEducationListId.graduation}</td>
                                                    <td>${contactEducationListId.location}</td>
                                                    <td>${contactEducationListId.college}</td>
                                                    <td>${contactEducationListId.year}</td>

                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </c:if>
                                    <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                    <br/>
                                    <div class="formDATA">
                                        <label style="width: 24% !important;">Additional Information</label>
                                        <div class="controlsData" id="aboutEducationsection">
                                            ${contact.education}
                                        </div>
                                    </div>
                                    <section class="formFull" id="aboutEducationsection1"></section>
                                </div>
                                <!--EDUCATION ENDS-->

                                <!--EDUCATION Starts edit-->
                                <div id="editEducation" style="display:none;">
                                    <form action="saveEducation" method="post">

                                        <div  class="col-lg-12"  >
                                            <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/educationIcon.png" alt="Icon"/><span>Education</span></div>
                                                <div class="formEdit"><input value="Save" class="btn btn-primary saveBtn" type="submit" onclick="return checkEducation()"><br/><br/><a class="addRow" onclick="addEducation()"><i class="fa fa-plus"></i> Add More</a>
                                                    <!--<a class="addRow" onclick="removeEducation()">Remove</a>-->
                                                </div>
                                            </div>

                                        </div>
                                        <!--                                        <section class="formThree">
                                                                                    <div class="formDATA">
                                        
                                                                                        <label>College</label>
                                        
                                                                                        <div class="controlsData">
                                                                                            <input type="text">
                                                                                        </div>
                                                                                    </div>
                                        
                                                                                </section>-->
                                        <section class="formFull">
                                            <div class="formDATA">
                                                <table id="contactEducationTable" cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                    <tr>
                                                        <th> Degree
                                                        </th>
                                                        <th>   Location
                                                        </th>
                                                        <th>College
                                                        </th>
                                                        <th> Year
                                                        </th>
                                                        <th> Action
                                                        </th>
                                                    </tr>

                                                    <c:forEach items="${contactEducationList}" var="contactEducationListId" varStatus="loop">
                                                        <tr>
<!--                                                            <td id="graduation${loop.index}">

                                                                <select name="contactEducation.graduationTypeArray">
                                                                    <option  ${contactEducationListId.graduationType==""?'selected':''} value="">--Select--</option>
                                                                    <option ${contactEducationListId.graduationType=="1"?'selected':''} value="1">Major Degree/Specialization</option>
                                                                    <option  ${contactEducationListId.graduationType=="2"?'selected':''}  value="2">Post Graduation</option>
                                                                    <option  ${contactEducationListId.graduationType=="3"?'selected':''} value="3">Graduation</option>
                                                                    <option  ${contactEducationListId.graduationType=="4"?'selected':''} value="4">Class 12th</option>
                                                                    <option  ${contactEducationListId.graduationType=="5"?'selected':''}  value="5">Class 10th</option>
                                                                </select>
                                                            </td>-->
                                                            <td id="graduation${loop.index}"><div class="controlsData controlWidth"><input type="text"   name="contactEducation.graduationTypeArray" maxlength="40" value="${contactEducationListId.graduationType}" ></div></td>
                                                            <td id="location${loop.index}"><div class="controlsData controlWidth"><input type="text" name="contactEducation.locationArray" value="${contactEducationListId.location}" ></div></td>
                                                            <td id="college${loop.index}"><div class="controlsData controlWidth"><input type="text" name="contactEducation.collegeArray" value="${contactEducationListId.college}" ></div></td>
                                                            <td id="year${loop.index}"><div class="controlsData controlWidth"><input type="text"  maxlength="12" name="contactEducation.yearArray" value="${contactEducationListId.year}" ></div></td>
                                                            <td ><div class="controlsData controlWidth"><a href="#!" onclick="removeEducation(${loop.index})">Delete</a></div></td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </section>
                                        <section class="formFull" id="aboutEducationsection" >
                                            <h3 class="popupheads">Additional Information</h3>
                                            <textarea id="ckeducation" class="form-control ckeditor"    name="contact.education" rows="6">${contact.education}</textarea>
                                        </section>
                                        <section class="formFull" id="aboutEducationsection1"></section>

                                    </form>


                                </div>
                                <!--EDUCATION ENDS-->
                                <div id="business" class="scrollanchor"></div>
                                <div class="col-lg-12"  id="displayBusinessForm" >




                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Business / Profession</span></div>
                                        <div class="formEdit"><a href="#!" id="edit12" onclick="editBusiness()">Edit</a>
                                            <!--updateFamilyBusiness-->


                                        </div>
                                    </div>

                                    <section class="formFull">
                                        <div class="formDATA">
                                            <label >Firm Name</label>

                                            <div class="controlsData">
                                                ${contact.firmName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Nature Of Business</label>
                                            <div class="controlsData">
                                                ${contact.natureOfBusiness}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Occupation</label>
                                            <div class="controlsData">
                                                ${contact.occupationName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Business Details</label>
                                            <div class="controlsData">
                                                ${contact.businessDescription}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Business Turnover</label>

                                            <div class="controlsData">
                                                ${contact.income} lac
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Address & Contact Detail</label>

                                            <div class="controlsData">
                                                ${contact.contactDetail}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Tel</label>

                                            <div class="controlsData">
                                                ${contact.telForBusiness}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Email/Website</label>

                                            <div class="controlsData">
                                                ${contact.emailForBusiness}
                                            </div>
                                        </div>
<!--                                        <div class="formDATA">   commented by vineet on 25-01-2017 they dont want
                                            <label >Family Business</label>

                                            <div class="controlsData">
                                                {contact.aboutFamilyBisinessHtml}
                                            </div>
                                        </div>-->
                                    </section><!--form half left - family business ends-->

                                    <section class="formHalf">

                                    </section>

                                </div> <!--BUSINESS / PROFESSION ENDS-->
                                <!--EDIT BUSINESS / PROFESSION STARTS-->
                                <div class="col-lg-12" id="editBusinessForm" style="display:none;">
                                    <form id="businessForm" action="saveBusiness" method="post" onclick="return saveBusiness()">



                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Business / Profession</span></div>
                                            <div class="formEdit"><input type="submit" class="btn btn-primary saveBtn" value="save">
                                                <!--updateFamilyBusiness-->


                                            </div>
                                        </div>

                                        <section class="formFull">

                                            <div class="formDATA">
                                                <label >Firm Name</label>
                                                <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                <div class="controlsData">
                                                    <input type="text" name="contact.firmName" value="${contact.firmName}">
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Nature Of Business</label>
                                                <div class="controlsData">
                                                    <select name="contact.natureOfBusiness" value="${contact.natureOfBusiness}">
                                                        <option value="">Select</option>
                                                        <option ${contact.natureOfBusiness=='Self-Owned'?'selected':''}  value="Self-Owned">Self-Owned</option>
                                                        <option ${contact.natureOfBusiness=='Joint With Family'?'selected':''}  value="Joint With Family">Joint With Family</option>
                                                        <option ${contact.natureOfBusiness=='Partnership with others'?'selected':''}  value="Partnership with others">Partnership with others</option>
                                                        <option ${contact.natureOfBusiness=='Salaried'?'selected':''}  value="Salaried">Salaried</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Occupation</label>
                                                <div class="controlsData">
                                                    <s:select id="occupationId" listKey="workId" listValue="workName" list="workList" headerKey="0" headerValue="--Select Work--" name="contact.occupationId1"  value="%{contact.occupationId1}" ></s:select>


                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label >Business Details</label>
                                                    <div class="controlsData">
                                                        <section class="formFull" id="aboutEducationsection" >
                                                            <textarea  class="form-control ckeditor"    name="contact.businessDescription" rows="6">${contact.businessDescription}</textarea>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Business Turnover</label>

                                                <div class="controlsData" style="width:20%!important;display:inline-block!important;">
                                                    <input type="text" value="${contact.income}" id="income" name="contact.income" style="display:inline-block; width:78%; margin-right:10px">in lac
                                                    <label id="validateIncome" style="display:none;color: red;">Please enter valid income </label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Address & Contact Detail</label>
                                                <div class="controlsData">
                                                    <textarea  id="contactDetail" name="contact.contactDetail">${contact.contactDetail}</textarea>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Tel</label>
                                                <div class="controlsData">
                                                    <input type="text"  id="telForBusiness" name="contact.telForBusiness" value="${contact.telForBusiness}"/>
                                                    <label id="validateTelForBis" style="display:none;color: red;">Please enter valid Tel </label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Email/Website</label>
                                                <div class="controlsData">
                                                    <input type="text"  id="emailForBusiness" name="contact.emailForBusiness" value="${contact.emailForBusiness}">
                                                    <label id="validateEmailForBus" style="display:none;color: red;">Please enter valid Email </label>
                                                </div>
                                            </div>
                                        </section><!--form half left - family business ends-->

                                        <section class="formHalf">
                                            <!--                                        <div class="formDATA">
                                                                                        <label >Full Address</label>
                                            
                                                                                        <div class="controlsData">
                                                                                            Aashna Group of Companies
                                                                                            301, Satkar Complex, Off. C.G. Road, Near Lal Bungalow
                                                                                            Ahemdabad 380 066
                                                                                        </div>
                                                                                    </div>-->
                                            <!--                                        <div class="formDATA">
                                                                                        <label >Tel</label>
                                            
                                                                                        <div class="controlsData">
                                                                                              <input type="text">
                                                                                        </div>
                                                                                    </div>-->
                                            <!--                                        <div class="formDATA">
                                                                                        <label >Business Turnover</label>
                                            
                                                                                        <div class="controlsData">  
                                                                                            <input type="text">
                                                                                        </div>
                                                                                    </div>-->
                                        </section>

                                    </form>
                                </div> <!--BUSINESS / PROFESSION ENDS-->
                                <div id="family" class="scrollanchor"></div>
                                <!--FAMILy Starts-->
                                <div class="col-lg-12"  id="displayFamilyDiv">

                                    <div class="formHEADDiv whiteBG"  >
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/familyIcon.png" alt="Icon"/><span>Family</span></div>
                                        <div class="formEdit"><a href="#!" onclick="editFamily()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <!--<h:outputLabel value="Father's Name" />-->
                                            <label>Father's Name</label>
                                            <div class="controlsData">
                                                ${contact.father}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Father's Work</label>
                                            <div class="controlsData">
                                                ${contact.fatherWork}

                                            </div>
                                        </div>

                                        <div class="formDATA">

                                            <label>Father's Education</label>
                                            <div class="controlsData">
                                                ${contact.fatherEducation}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Father Detail</label>
                                            <div class="controlsData">
                                                ${contact.fatherDetail}
                                            </div>
                                        </div>     
                                    </section>

                                    <section class="formHalf">
                                        <div class="formDATA">

                                            <label>Mother's Name</label>
                                            <div class="controlsData">
                                                ${contact.mother}

                                            </div>
                                        </div>
                                        <div class="formDATA">


                                            <label>Mother's Work</label>
                                            <div class="controlsData">

                                                ${contact.motherWork}


                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Mother's Education</label>
                                            <div class="controlsData">
                                                ${contact.motherEducation}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Mother Detail</label>
                                            <div class="controlsData">
                                                ${contact.motherDetail}
                                            </div>
                                        </div>

                                    </section>



                                    <section class="formFull">
                                        <div class="formDATA">
                                            <c:if test="${brotherList.size()>0}">
                                                <label>Brother (Sibling)</label>
                                                <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Elder / Younger</th>
                                                        <th>Education</th>
                                                        <th>Occupation</th>
                                                        <th>Married To</th>
                                                        <th>D/O.</th>
                                                        <th>Place</th>
                                                        <th>Detail</th>
                                                    </tr>
                                                    <c:forEach items="${brotherList}" var="contact">
                                                        <tr>
                                                            <td>${contact.siblingName}</td>
                                                            <td>${contact.elder}</td>
                                                            <td>${contact.relationEducation}</td>
                                                            <td>${contact.siblingWork}</td>
                                                            <td>${contact.toWhom}</td>
                                                            <td>${contact.relationDob}</td>
                                                            <td>${contact.relationPlace}</td> 
                                                            <td>${contact.businessDescription}</td>                                                                                                                                                                       
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </c:if>
                                        </div>

                                        <div class="formDATA">
                                            <c:if test="${sisterList.size()>0}">    
                                                <label>Sister (Sibling)</label>
                                                <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Elder / Younger</th>
                                                        <th>Education</th>
                                                        <th>Occupation</th>
                                                        <th>Married To</th>
                                                        <th>S/O.</th>
                                                        <th>Place</th>
                                                        <th>Detail</th>
                                                    </tr>
                                                    <c:forEach items="${sisterList}" var="contact">
                                                        <tr>

                                                            <td>${contact.siblingName}</td>
                                                            <td>${contact.elder}</td>
                                                            <td>${contact.relationEducation}</td>
                                                            <td>${contact.siblingWork}</td>
                                                            <td>${contact.toWhom}</td>
                                                            <td>${contact.relationDob}</td>
                                                            <td>${contact.relationPlace}</td>                                                                                                                                                                       
                                                            <td>${contact.businessDescription}</td> 
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </c:if>
                                        </div>
                                    </section>
                                </div><!--FAMILY ENDS-->

                                <!--FAMILy Starts-->
                                <form action="saveFamilyDetails" method="post">
                                    <div class="col-lg-12" style="display:none;" id="editFamilyDiv">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span>Family</span></div>
                                            <div class="formEdit">
                                                <input value="save" class="btn btn-primary saveBtn" type="submit" onclick="return checkFamilyDetails()">

                                            </div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <!--<h:outputLabel value="Father's Name" />-->
                                                <label>Father's Name</label>
                                                <div class="controlsData">
                                                    <input id="father" type="text" value="${contact.father}" name="contact.father">
                                                    <label id="validatefather" style="display:none;color:red;width:100%;">Please enter Father's Name</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label>Father's Work</label>
                                                <div class="controlsData">

                                                    <select name="contact.fatherWork" value="${contact.fatherWork}" >
                                                        <option value="" ${contact.fatherWork==""?'selected':''}>--Select--</option>

                                                        <option value="Business" ${contact.fatherWork=="Business"?'selected':''}>Business</option>
                                                        <option value="Salaried" ${contact.fatherWork=="Salaried"?'selected':''}>Salaried</option>
                                                        <option value="Retired" ${contact.fatherWork=="Retired"?'selected':''}>Retired</option>
                                                        <option value="Late" ${contact.fatherWork=="Late"?'selected':''}>Late</option>
                                                    </select>


                                                </div>
                                            </div>

                                            <div class="formDATA">

                                                <label>Father's Education</label>
                                                <div class="controlsData"> 
                                                    <input id="fatherEducation" type="text" value="${contact.fatherEducation}" name="contact.fatherEducation" >
                                                    <label id="validatefatherEducation" style="display:none;color:red;width:100%;">Please enter Father's Education</label>
                                                </div>

                                            </div>

                                            <div class="formDATA">
                                                <label>Father Detail</label>
                                                <div class="controlsData"> 
                                                    <textarea id="fatherDetail" type="text"  name="contact.fatherDetail" >${contact.fatherDetail}</textarea>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="formHalf">
                                            <div class="formDATA">

                                                <label>Mother's Name</label>
                                                <div class="controlsData">

                                                    <input id="mother" type="text" value="${contact.mother}" name="contact.mother">
                                                    <label id="validatemother" style="display:none;color:red;width:100%;">Please enter Mother's Name</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">


                                                <label>Mother's Work</label>
                                                <div class="controlsData">

                                                    <select name="contact.motherWork" value="${contact.motherWork}  " >
                                                        <option value="" ${contact.motherWork==""?'selected':''}>--Select--</option>

                                                        <option value="House Wife" ${contact.motherWork=="House Wife"?'selected':''}>House Wife</option>
                                                        <option value="Business" ${contact.motherWork=="Business"?'selected':''}>Business</option>
                                                        <option value="Salaried" ${contact.motherWork=="Salaried"?'selected':''}>Salaried</option>
                                                        <option value="Retired" ${contact.motherWork=="Retired"?'selected':''}>Retired</option>
                                                        <option value="Late" ${contact.motherWork=="Late"?'selected':''}>Late</option>
                                                    </select>


                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label>Mother's Education</label>
                                                <div class="controlsData">
                                                    <input id="motherEducation" type="text" value="${contact.motherEducation}" name="contact.motherEducation">
                                                    <label id="validatemotherEducation" style="display:none;color:red;width:100%;">Please enter Mother's Education</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Mother Detail</label>
                                                <div class="controlsData"> 
                                                    <textarea id="motherDetail" type="text"  name="contact.motherDetail" >${contact.motherDetail}</textarea>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="formFull">

                                            <div class="formDATA">
                                                <label>Brother (Sibling)</label><a class="addRow" onclick="addBrother()" id="addBrotherLink"><i class="fa fa-plus"></i> Add More</a>
                                                <!--<a class="addRow" onclick="removeBrother()">Remove</a>-->
                                                <table cellpadding="0" cellspacing="0" border="" class="commonTable" id="brotherTable">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Elder / Younger</th>
                                                        <th>Education</th>
                                                        <th>Occupation</th>
                                                        <th>Married To</th>
                                                        <th>D/O.</th>
                                                        <th>Place</th>
                                                        <th>Detail</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <c:forEach items="${brotherList}" var="contact" varStatus="loop">
                                                        <tr>
                                                            <td id="name${loop.index}">  <div class="controlsData controlWidth"><input type="text" value="${contact.siblingName}" name="contact.siblingNameArray" ></div></td>
                                                            <td id="elder${loop.index}"> 
                                                                <div class="controlsData controlWidth"> 
                                                                    <select name="contact.siblingElderArray" value="${contact.elder}">
                                                                        <option value="" ${contact.elder==""?'selected':''}>--Select--</option>
                                                                        <option value="Elder" ${contact.elder=="Elder"?'selected':''}>Elder</option>
                                                                        <option value="Younger" ${contact.elder=="Younger"?'selected':''}>Younger</option>
                                                                        <option value="Twin" ${contact.elder=="Twin"?'selected':''}>Twin</option>                                                   
                                                                    </select>
                                                                </div></td>
                                                            <td id="education${loop.index}"> <div class="controlsData controlWidth"><input type="text" value="${contact.relationEducation}" name="contact.siblingEducationArray"></div></td>
                                                            <td id="work${loop.index}"> <div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray"></div></td>
                                                            <td id="marriedTo${loop.index}">  <div class="controlsData controlWidth"><input  type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray"></div></td>
                                                            <td id="dob${loop.index}">   <div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray" ></div></td>
                                                            <td id="place${loop.index}">   <div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray"></div></td> 
                                                            <td id="brotherDetail${loop.index}">   <div class="controlsData controlWidth"><textarea name="contact.businessDescriptions">${contact.businessDescription}</textarea></div></td> 
                                                            <td id="place${loop.index}">   <div class="controlsData controlWidth"><a href="#!" onclick="removeBrother(${loop.index})">Delete</a></div></td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>


                                            <div class="formDATA">
                                                <input type="hidden" value="${contact.contactId}"  name="contact.contactId">
                                                <label>Sister (Sibling)</label><a class="addRow" onclick="addSister()()" id="addSisterLink"><i class="fa fa-plus"></i> Add More</a>
                                                <table cellpadding="0" cellspacing="0" border="" id="sisterTable" class="commonTable">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Elder / Younger</th>
                                                        <th>Education</th>
                                                        <th>Occupation</th>
                                                        <th>Married To</th>
                                                        <th>S/O.</th>
                                                        <th>Place</th>
                                                        <th>Detail</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    <c:forEach items="${sisterList}" var="contact" varStatus="loop">
                                                        <tr>

                                                            <td id="sname${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.siblingName}" name="contact.siblingNameArray1"></div></td>
                                                            <td id="selder${loop.index}">
                                                                <div class="controlsData controlWidth">

                                                                    <select name="contact.siblingElderArray1" value="${contact.elder}">
                                                                        <option value="" ${contact.elder==""?'selected':''}>--Select--</option>
                                                                        <option value="Younger" ${contact.elder=="Elder"?'selected':''} >Younger</option>
                                                                        <option value="Elder" ${contact.elder=="Elder"?'selected':''} >Elder</option>
                                                                        <option value="Younger" ${contact.elder=="Younger"?'selected':''}>Younger</option>
                                                                        <option value="Twin" ${contact.elder=="Twin"?'selected':''}>Twin</option>                                                   
                                                                    </select>
                                                                </div></td>
                                                            <td id="seducation${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationEducation}" name="contact.siblingEducationArray1"></div></td>
                                                            <td id="swork${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray1"></div></td>
                                                            <td id="smarriedTo${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray1"></div></td>
                                                            <td id="sdob${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray1" ></div></td>
                                                            <td id="splace${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray1"></div></td>
                                                            <td id="sisterDetail${loop.index}"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions1">${contact.businessDescription}</textarea></div></td>
                                                            <td id="place${loop.index}">   <div class="controlsData controlWidth"><a href="#!" onclick="removeSister(${loop.index})">Delete</a></div></td>
                                                        </tr>
                                                    </c:forEach>

                                                </table>
                                            </div>
                                        </section>


                                    </div><!--Edit FAMILY ENDS-->
                                </form>
                                <!--Paternal Side Starts-->
                                <div class="col-lg-12" id="paternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Paternal Side</span></div>
                                        <div class="formEdit"><a href="#!" onclick="displayPaternal()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Grandfather's Name (Dadaji) </label>
                                            <div class="controlsData">
                                                <s:if test="contact.grandFatherWork.equals('Late')">
                                                <span id="grandFatherNameLabel">Late ${contact.grandFatherName}</span>
                                                </s:if>
                                                <s:else>
                                                    <span id="grandFatherNameLabel">${contact.grandFatherName}</span>
                                                </s:else>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Grandfather Detail (Dadaji) </label>
                                            <div class="controlsData">
                                                <span>${contact.grandFatherPDetail}</span>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Grandmother's Name(Dadiji)</label>
                                            <div class="controlsData">
                                                <s:if test="contact.grandMotherWork.equals('Late')">
                                                    <span id="grandMotherNameLabel">Late ${contact.grandMotherName}</span></s:if>
                                                    <s:else><span id="grandMotherNameLabel">${contact.grandMotherName}</span></s:else>
                                                        
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Grandmother Detail (Dadiji)</label>
                                            <div class="controlsData">
                                                <span>${contact.grandMotherPDetail}</span>
                                            </div>
                                        </div>
                                    </section>

                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Uncle (Chacha)</span></div>
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
                                                    <c:if test="${uncleList.size()>0}">
                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th> 
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>D/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                            </tr>

                                                            <c:forEach items="${uncleList}" var="contact">
                                                                <tr>

                                                                    <td>${contact.siblingName}</td>                                                       
                                                                    <td>${contact.location}</td>
                                                                    <td>${contact.siblingWork}</td>
                                                                    <td>${contact.toWhom}</td>
                                                                    <td>${contact.relationDob}</td>
                                                                    <td>${contact.relationPlace}</td>                                                                                                                                                                       
                                                                    <td>${contact.businessDescription}</td> 
                                                                </tr>
                                                            </c:forEach>

                                                        </table>
                                                    </c:if>
                                                </div>

                                            </section>
                                        </div>
                                    </section>

                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Aunty (Bua)</span></div>
                                            <!--                                            <div class="formEdit"><a href="#!">Edit</a>
                                            
                                                                                        </div>-->
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
                                                    <c:if test="${buaList.size()>0}">
                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>S/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                            </tr>
                                                            <c:forEach items="${buaList}" var="contact">
                                                                <tr>

                                                                    <td>${contact.siblingName}</td>
                                                                    <td>${contact.location}</td>                                                 
                                                                    <td>${contact.siblingWork}</td>
                                                                    <td>${contact.toWhom}</td>
                                                                    <td>${contact.relationDob}</td>
                                                                    <td>${contact.relationPlace}</td>                                                                                                                                                                       
                                                                    <td>${contact.businessDescription}</td>    
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </c:if>
                                                </div>

                                            </section>
                                        </div>
                                    </section>
                                </div><!--PATERNAL SIDE ENDS-->
                                <!--Edit Paternal Side Starts-->

                                <div class="col-lg-12" id="paternalDivEdit" style="display:none;">
                                    <form action="savePaternalDetails" method="post">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Paternal Side</span></div>
                                            <div class="formEdit"><a href="#!"><input value="save" class="btn btn-primary saveBtn" type="submit" onclick="return checkPaternalDetails()"></a>

                                            </div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Grandfather's Name (Dadaji) </label>
                                                <div class="controlsData">
                                                    <span id="grandFatherNameLabel"> 
                                                        <input id="grandFatherName" type="text" value="${contact.grandFatherName}" name="contact.grandFatherName" />
                                                        <label id="validategrandFatherName" style="display:none;width:100%;color:red;">Please enter proper Name</label>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Grandfather Detail (Dadaji) </label>
                                                <div class="controlsData">
                                                    <span> 
                                                        <textarea id="grandFatherPDetail"  name="contact.grandFatherPDetail" >${contact.grandFatherPDetail}</textarea>
                                                    </span>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Grandmother's Name(Dadiji)</label>
                                                <div class="controlsData">
                                                    <span id="grandMotherNameLabel">
                                                        <input id="grandMotherName" type="text" value="${contact.grandMotherName}" name="contact.grandMotherName" />
                                                        <label id="validategrandMotherName" style="display:none;width:100%;color:red;">Please enter proper Name</label>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Grandmother Detail (Dadiji)</label>
                                                <div class="controlsData">
                                                    <span>
                                                        <textarea id="grandMotherPDetail"  name="contact.grandMotherPDetail" >${contact.grandMotherPDetail}</textarea>
                                                    </span>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="formFull">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"><span class="smsubHEAD">Uncle (Chacha)</span></div>
                                                <div class="formEdit"><a class="addRow" onclick="addChacha()"><i class="fa fa-plus"></i> Add More</a>

                                                </div>
                                            </div>
                                            <div >
                                                <section class="formFull">
                                                    <input type="hidden" value="${contact.contactId}"  name="contact.contactId">
                                                    <!--                                                    <label>Sister (Sibling)</label>-->
                                                    <div class="formDATA">

                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable" id="chachaTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>D/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                                <th>Action</th>
                                                            </tr>

                                                            <c:forEach items="${uncleList}" var="contact" varStatus="loop">
                                                                <tr>

                                                                    <td id="cname${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.siblingName}" name="contact.siblingNameArray"></div></td>
                                                                    <td id="clocation${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.location}" name="contact.siblingLocationArray"></div></td>
                                                                    <td id="cwork${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray"></div></td>
                                                                    <td id="cmarriedTo${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray"></div></td>
                                                                    <td id="cdob${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray" ></div></td>
                                                                    <td id="cplace${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray"></div></td>
                                                                    <td id="chachaDetail${loop.index}"><div class="controlsData controlWidth"><textarea name="contact.businessDescriptions">${contact.businessDescription}</textarea></div></td>
                                                                    <td ><div class="controlsData controlWidth"><a onclick="removeChacha(${loop.index})" href="#!">Delete</a></div></td>
                                                                </tr>
                                                            </c:forEach>

                                                        </table>

                                                    </div>

                                                </section>
                                            </div>
                                        </section>

                                        <section class="formFull">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"><span class="smsubHEAD">Aunty (Bua)</span></div>
                                                <div class="formEdit"><a class="addRow" onclick="addBua()"><i class="fa fa-plus"></i> Add More</a>

                                                </div>
                                            </div>
                                            <div >
                                                <section class="formFull">
                                                    <div class="formDATA">
                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable" id="buaTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>S/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            <c:forEach items="${buaList}" var="contact" varStatus="loop">


                                                                <tr>

                                                                    <td id="bname${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.siblingName}" name="contact.siblingNameArray1"></div></td>                                                                
                                                                    <td id="blocation${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.location}" name="contact.siblingLocationArray1"></div></td>
                                                                    <td id="bwork${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray1"></div></td>
                                                                    <td id="bmarriedTo${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray1"></div></td>
                                                                    <td id="bdob${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray1" ></div></td>
                                                                    <td id="bplace${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray1"></div></td>                                                                                                                                                                       
                                                                    <td id="buaDetail${loop.index}"><div class="controlsData controlWidth"><textarea name="contact.businessDescriptions1">${contact.businessDescription}</textarea></div></td>
                                                                    <td ><div class="controlsData controlWidth"><a onclick="removeBua(${loop.index})" href="#!">Delete</a></div></td>
                                                                </tr>                                                                                                                                                                      


                                                            </c:forEach>

                                                        </table>
                                                    </div>

                                                </section>
                                            </div>
                                        </section>
                                    </form>
                                </div><!--Edit PATERNAL SIDE ENDS-->
                                <!-- Maternal SIDE Starts-->
                                <div class="col-lg-12" id="maternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Maternal Side</span></div>
                                        <div class="formEdit"><a href="#!" onclick="showMaternalEdit()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label >Grandfather's Name (Nanaji)</label>
                                            <div class="controlsData"> 
                                                  <s:if test="contact.grandFatherMWork.equals('Late')">
                                                <label>Late ${contact.mgrandFatherName}</label></s:if>
                                                <s:else>
                                                   <label> ${contact.mgrandFatherName}</label>  
                                                </s:else>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Grandfather Detail (Nanaji)</label>
                                            <div class="controlsData"> 
                                                <label>${contact.grandFatherMDetail}</label>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label >Grandmother's Name (Naniji)</label>
                                            <div class="controlsData">
                                               <s:if test="contact.grandMotherMWork.equals('Late')">
                                                   <label>Late ${contact.mgrandMotherName}</label></s:if>
                                                   <s:else><label>${contact.mgrandMotherName}</label></s:else>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Grandmother Detail (Naniji)</label>
                                            <div class="controlsData"> 
                                                <label>${contact.grandMotherMDetail}</label>
                                            </div>
                                        </div>
                                    </section>

                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Uncle (Mama)</span></div>
                                            <div class="formEdit"><a href="#!"></a>

                                            </div>
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
                                                    <c:if test="${mamaList.size()>0}">
                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>D/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                            </tr>

                                                            <c:forEach items="${mamaList}" var="contact">
                                                                <tr>

                                                                    <td>${contact.siblingName}</td>
                                                                    <td>${contact.location}</td>                                                 
                                                                    <td>${contact.siblingWork}</td>
                                                                    <td>${contact.toWhom}</td>
                                                                    <td>${contact.relationDob}</td>
                                                                    <td>${contact.relationPlace}</td>                                                                                                                                                                       
                                                                    <td>${contact.businessDescription}</td>      
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </c:if>
                                                </div>

                                            </section>
                                        </div>
                                    </section>
                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Aunty (Mausi)</span></div>
                                            <div class="formEdit"><a href="#!"></a>

                                            </div>
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
                                                    <c:if test="${mausiList.size()>0}">
                                                        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>S/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                            </tr>
                                                            <c:forEach items="${mausiList}" var="contact">
                                                                <tr>

                                                                    <td>${contact.siblingName}</td>
                                                                    <td>${contact.location}</td>                                                 
                                                                    <td>${contact.siblingWork}</td>
                                                                    <td>${contact.toWhom}</td>
                                                                    <td>${contact.relationDob}</td>
                                                                    <td>${contact.relationPlace}</td>                                                                                                                                                                       
                                                                    <td>${contact.businessDescription}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </c:if>
                                                </div>

                                            </section>
                                        </div>
                                    </section>
                                </div><!--MATERNAL SIDE ENDS-->
                                <!-- ABOUT FAMILY Starts-->
                                <div class="col-lg-12" id="aboutFamilyDiv">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>About Family</span></div>
                                        <div class="formEdit"><a href="#!"  onclick="showAboutFamilyDiv()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formFull">
                                        <div class="formDATA">
                                            <label >About Family</label>
                                            <div class="controlsData"> 
                                                <label>${contact.aboutFamilyHtml}</label>
                                            </div>
                                        </div>
                                    </section>
                                </div><!-- ABOUT FAMILY  ENDS-->
                                <form action="saveAboutFamily" method="post">
                                    <div class="col-lg-12" id="aboutFamilyDivEdit" style="display:none;">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>About Family</span></div>
                                            <div class="formEdit"><input value="save" class="btn btn-primary saveBtn" type="submit" >

                                            </div>
                                        </div>
                                        <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                        <section class="formFull">
                                            <div class="formDATA">
                                                <label >About Family</label>
                                                <div class="controlsData"> 
                                                    <section class="formFull" id="aboutEducationsection" >
                                                        <textarea class="form-control ckeditor" name="contact.aboutFamilyHtml" >${contact.aboutFamilyHtml}</textarea>                              
                                                    </section>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                                </form>
                                <!-- ABOUT FAMILY  ENDS-->
                                <!-- Edit Maternal SIDE Starts-->
                                <form action="saveMaternalDetails" method="post">
                                    <div class="col-lg-12" id="maternalDivEdit" style="display:none;">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Maternal Side</span></div>
                                            <div class="formEdit"><input value="save" class="btn btn-primary saveBtn" type="submit" onclick="return checkMaternalDetails()">

                                            </div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label >Grandfather's Name (Nanaji)</label>
                                                <div class="controlsData"> 
                                                    <input type="hidden" value="${contact.contactId}"  name="contact.contactId">
                                                    <input type="text" id="grandFatherNana" value="${contact.mgrandFatherName}" name="contact.mgrandFatherName">
                                                    <label id="validategrandFatherNameNana" style="display:none;width:100%;color:red;">Please enter proper Name</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Grandfather Detail (Nanaji)</label>
                                                <div class="controlsData"> 
                                                    <textarea id="grandFatherMDetail" name="contact.grandFatherMDetail">${contact.grandFatherMDetail}</textarea>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label >Grandmother's Name (Naniji)</label>
                                                <div class="controlsData">
                                                    <input type="text" id="grandMotherNani" name="contact.mgrandMotherName" value="${contact.mgrandMotherName}" >
                                                    <label id="validategrandMotherNameNani" style="display:none;width:100%;color:red;">Please enter proper Name</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Grandmother Detail (Naniji)</label>
                                                <div class="controlsData">
                                                    <textarea id="grandMotherMDetail" name="contact.grandMotherMDetail">${contact.grandMotherMDetail}</textarea>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="formFull">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"><span class="smsubHEAD">Uncle (Mama)</span></div>
                                                <div class="formEdit"><a class="addRow" onclick="addMama()"><i class="fa fa-plus"></i> Add More</a>

                                                </div>
                                            </div>
                                            <div >
                                                <section class="formFull">
                                                    <div class="formDATA">
                                                        <table cellpadding="0" id="mamaTable" cellspacing="0" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>D/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                                <th>Action</th>
                                                            </tr>

                                                            <c:forEach items="${mamaList}" var="contact" varStatus="loop">
                                                                <tr>

                                                                    <td id="mname${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.siblingName}" name="contact.siblingNameArray"></div></td>
                                                                    <td id="mlocation${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.location}" name="contact.siblingLocationArray"></div></td>
                                                                    <td id="mwork${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray"></div></td>
                                                                    <td id="mmarriedTo${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray"></div></td>
                                                                    <td id="mdob${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray" ></div></td>
                                                                    <td id="mplace${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray"></div></td>                                                                                                                                                                                                       
                                                                    <td id="mamaDetail${loop.index}"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions">${contact.businessDescription}</textarea></div></td>                                                                                                                                                                                                       
                                                                    <td ><div class="controlsData controlWidth"><a onclick="removeMama(${loop.index})" href="#!">Delete</a></div></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>

                                                </section>
                                            </div>
                                        </section>
                                        <section class="formFull">
                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"><span class="smsubHEAD">Aunty (Mausi)</span></div>
                                                <div class="formEdit"><a class="addRow" onclick="addMausi()"><i class="fa fa-plus"></i> Add More</a>

                                                </div>
                                            </div>
                                            <div >
                                                <section class="formFull">
                                                    <div class="formDATA">
                                                        <table cellpadding="0" cellspacing="0" id="mausiTable" border="" class="commonTable">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Location</th>
                                                                <th>Occupation</th>
                                                                <th>Married To</th>
                                                                <th>S/O.</th>
                                                                <th>Place</th>
                                                                <th>Detail</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            <c:forEach items="${mausiList}" var="contact" varStatus="loop">
                                                                <tr>

                                                                    <td id="maname${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.siblingName}" name="contact.siblingNameArray1"></div></td>                                                                
                                                                    <td id="malocation${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.location}" name="contact.siblingLocationArray1"></div></td>
                                                                    <td id="mawork${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.siblingWork}" name="contact.siblingOccupationArray1"></div></td>
                                                                    <td id="mamarriedTo${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.toWhom}" name="contact.siblingMarriedToArray1"></div></td>
                                                                    <td id="madob${loop.index}"><div class="controlsData controlWidth"><input  type="text" value="${contact.relationDob}" name="contact.siblingDobArray1" ></div></td>
                                                                    <td id="maplace${loop.index}"><div class="controlsData controlWidth"><input type="text" value="${contact.relationPlace}" name="contact.siblingPlaceArray1"></div></td>                                                                                                                                                                  
                                                                    <td id="mausiDetail${loop.index}"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions1">${contact.businessDescription}</textarea></div></td>                                                                                                                                                                                                       
                                                                    <td ><div class="controlsData controlWidth"><a onclick="removeMausi(${loop.index})" href="#!">Delete</a></div></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>

                                                </section>
                                            </div>
                                        </section>
                                    </div><!--Edit MATERNAL SIDE ENDS-->
                                </form>


                                <!--EDIT BUSINESS / PROFESSION STARTS-->


                                <!--Family Business Start Here By Vineet-->

                                <!--EDIT Family BUSINESS / PROFESSION STARTS-->
                                <div class="col-lg-12" id="editFamilyBusinessForm" style="display:none;">
                                    <form id="familyBusinessForm" action="saveFamilyBusiness" method="post" onclick="return saveFamilyBusiness()">



                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Family Business / Profession</span></div>
                                            <div class="formEdit"><input type="submit" class="btn btn-primary saveBtn" value="save">
                                                <!--updateFamilyBusiness-->


                                            </div>
                                        </div>

                                        <section class="formFull">

                                            <div class="formDATA">
                                                <label >Firm Name</label>
                                                <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                <div class="controlsData">
                                                    <input type="text" name="contact.familyFirmName" value="${contact.familyFirmName}">
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Nature Of Business</label>
                                                <div class="controlsData">
                                                    <select name="contact.natureOfFamilyBusiness" value="${contact.natureOfFamilyBusiness}">
                                                        <option value="">Select</option>
                                                        <option ${contact.natureOfFamilyBusiness=='Self-Owned'?'selected':''}  value="Self-Owned">Self-Owned</option>
                                                        <option ${contact.natureOfFamilyBusiness=='Joint With Family'?'selected':''}  value="Joint With Family">Joint With Family</option>
                                                        <option ${contact.natureOfFamilyBusiness=='Partnership with others'?'selected':''}  value="Partnership with others">Partnership with others</option>
                                                        <option ${contact.natureOfFamilyBusiness=='Salaried'?'selected':''}  value="Salaried">Salaried</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Occupation</label>
                                                <div class="controlsData">
                                                    <s:select id="occupationId" listKey="workId" listValue="workName" list="workList" headerKey="0" headerValue="--Select Work--" name="contact.familyOccupationId"  value="%{contact.familyOccupationId}" ></s:select>


                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label >Business Details</label>
                                                    <div class="controlsData">
                                                        <section class="formFull" id="aboutEducationsection" >
                                                            <textarea  class="form-control ckeditor"    name="contact.familyBusinessDescription" rows="6">${contact.familyBusinessDescription}</textarea>
                                                    </section>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Business Turnover</label>

                                                <div class="controlsData" style="width:20%!important;display:inline-block!important;">
                                                    <input type="text" value="${contact.familyIncome}" id="familyincome" name="contact.familyIncome" style="display:inline-block; width:78%; margin-right:10px">in lac
                                                    <label id="validateFamilyIncome" style="display:none;color: red;">Please enter valid income </label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Address & Contact Detail</label>
                                                <div class="controlsData">
                                                    <textarea  id="contactDetail" name="contact.contactDetailForFamilyBusiness">${contact.contactDetailForFamilyBusiness}</textarea>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Tel</label>
                                                <div class="controlsData">
                                                    <input type="text"  id="telForFamilyBusiness" name="contact.telForFamilyBusiness" value="${contact.telForFamilyBusiness}"/>
                                                    <label id="validateTelForFamilyBis" style="display:none;color: red;">Please enter valid Tel </label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Email/Website</label>
                                                <div class="controlsData">
                                                    <input type="text"  id="emailForBusiness" name="contact.emailForFamilyBusiness" value="${contact.emailForFamilyBusiness}">
                                                    <label id="validateEmailForFamilyBus" style="display:none;color: red;">Please enter valid Email </label>
                                                </div>
                                            </div>
                                        </section><!--form half left - family business ends-->

                                        <section class="formHalf">

                                        </section>

                                    </form>
                                </div> <!--UPdate BUSINESS / PROFESSION ENDS-->


                                <!--Lable Start Here-->
                                <div id="familybusiness" class="scrollanchor"></div>
                                <div class="col-lg-12"  id="displayFamilyBusinessForm" >
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span> Family Business / Profession</span></div>
                                        <div class="formEdit"><a href="#!" id="edit12" onclick="editFamilyBusiness()">Edit</a>
                                            <!--updateFamilyBusiness-->


                                        </div>
                                    </div>

                                    <section class="formFull">
                                        <div class="formDATA">
                                            <label >Firm Name</label>

                                            <div class="controlsData">
                                                ${contact.familyFirmName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Nature Of Business</label>
                                            <div class="controlsData">
                                                ${contact.natureOfFamilyBusiness}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Occupation</label>
                                            <div class="controlsData">
                                                ${contact.familyOccupationName}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Business Details</label>
                                            <div class="controlsData">
                                                ${contact.familyBusinessDescription}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Business Turnover</label>

                                            <div class="controlsData">
                                                ${contact.familyIncome} lac
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Address & Contact Detail</label>

                                            <div class="controlsData">
                                                ${contact.contactDetailForFamilyBusiness}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Tel</label>

                                            <div class="controlsData">
                                                ${contact.telForFamilyBusiness}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Email/Website</label>

                                            <div class="controlsData">
                                                ${contact.emailForFamilyBusiness}
                                            </div>
                                        </div>
                                        <!--                                        <div class="formDATA">
                                                                                    <label >Family Business</label>
                                        
                                                                                    <div class="controlsData">
                                        {contact.aboutFamilyBisinessHtml}
                                    </div>
                                </div>-->
                                    </section><!--form half left - family business ends-->

                                    <section class="formHalf">

                                    </section>

                                </div>

                                <!--Family Business End-->



                                <div id="medical" class="scrollanchor"></div>
                                <div class="col-lg-12" id="displayMedicalHistory">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Medical History</span></div>
                                        <div class="formEdit"><a href="#!" onclick="displayMedicalHistory()">Edit</a></div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label >Using Spectacles</label>
                                            <div class="controlsData">
                                                ${contact.usingSpectacles}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label >If yes, Power Detail</label>
                                            <div class="controlsData">
                                                ${contact.powerDetails}
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Blood Group</label>
                                            <div class="controlsData">
                                                ${contact.bloodBank}</div>
                                        </div>
                                        <div class="formDATA">

                                            <label >Any Other Issues</label>
                                            <div class="controlsData">
                                                ${contact.otherIssues}
                                            </div>
                                        </div>
                                    </section>
                                </div> <!-- MEDICAL HISTORY ENDS-->
                                <!--edit MEDICAL HISTORY start-->

                                <div class="col-lg-12" id="editMedicalHistory" style="display:none;">
                                    <form action="saveMedicalHistory" method="post" >
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Medical History</span></div>
                                            <div class="formEdit"><a href="#!"><input value="save" class="btn btn-primary saveBtn" type="submit" onclick="return saveMedicalHistory()"></a></div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">

                                                <label >Using Spectacles</label>
                                                <div class="controlsData">
                                                    <input type="hidden" name="contact.contactId" value="${contact.contactId}">
                                                    <select name="contact.usingSpectacles" value="${contact.usingSpectacles}" >
                                                        <option ${contact.usingSpectacles==""?'selected':''} value="" >--Select--</option>
                                                        <option ${contact.usingSpectacles=="Yes"?'selected':''} value="Yes"  >Yes</option>
                                                        <option ${contact.usingSpectacles=="No"?'selected':''} value="No"  >No</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label >If yes, Power Detail</label>
                                                <div class="controlsData">
                                                    <input id="powerDetails" type="text" name="contact.powerDetails" value="${contact.powerDetails}">
                                                    <label id="validatepowerDetails" style="color:red;width:100%;display:none;">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label >Blood Group</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.bloodBank" value="${contact.bloodBank}">
                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label >Any Other Issues</label>
                                                <div class="controlsData">
                                                    <input id="otherIssues" type="text" name="contact.otherIssues"  value="${contact.otherIssues}">
                                                    <label id="validateotherIssues" style="color:red;width:100%;display:none;">Please enter valid details</label>
                                                </div>
                                            </div>
                                        </section>
                                    </form>
                                </div> <!--MEDICAL HISTORY ENDS-->
                                <!--CONTACT DETAIL STARTS-->
                                <div class="col-lg-12" style="display:none;" id="editContactdetails">
                                    <form action="saveContactDetailsSL" method="post">

                                        <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Contact Details</span></div>
                                            <div class="formEdit"> <input type="submit" class="btn btn-primary saveBtn" value="save" onclick="return saveContactDetails()"></div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Address</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.contactAddress"  value="${contact.contactAddress}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Telephone</label>
                                                <div class="controlsData"> 
                                                    <input id="telephone" type="text" name="contact.telephone"  value="${contact.telephone}">
                                                    <label id="validateTelephone" style="display:none;color:red;width:100%;">Please enter valid telephone number</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Email</label>
                                                <div class="controlsData"> 
                                                    <input id="contactEmail" type="email" name="contact.email"  value="${contact.email}">
                                                    <label id="validateEmail" style="display:none;color:red;width:100%;">Please enter valid email</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Location</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.contactPersonSlLocation"  value="${contact.contactPersonSlLocation}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8" style="height:100px">
                                            <div class="formDATA">
                                                <label></label>
                                                <div class="controlsData"> 

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">

                                                <label>Contact Person 1</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.contactPersonSl"  value="${contact.contactPersonSl}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">

                                                <label>Contact Person 2</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.contactPersonS2"  value="${contact.contactPersonS2}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">

                                                <label>Contact Person 3</label>
                                                <div class="controlsData"> 
                                                    <input type="text" name="contact.contactPersonS3"  value="${contact.contactPersonS3}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Relation 1</label>
                                                <div class="controlsData"> 
                                                    <select name="contact.contactPersonSlRelation" >
                                                        <option value="">Select</option>
                                                        <option value="Self" ${contact.contactPersonSlRelation=="Self"?'selected':''}>Self</option>
                                                        <option value="Parent/Guardian" ${contact.contactPersonSlRelation=="Parent/Guardian"?'selected':''}>Parent/Guardian</option>
                                                        <option value="Sibling" ${contact.contactPersonSlRelation=="Sibling"?'selected':''}>Sibling</option>
                                                        <option value="Friend" ${contact.contactPersonSlRelation=="Friend"?'selected':''}>Friend</option>
                                                        <option value="Other" ${contact.contactPersonSlRelation=="Other"?'selected':''}>Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Relation 2</label>
                                                <div class="controlsData"> 
                                                    <select name="contact.contactPersonS2Relation" >
                                                        <option value="">Select</option>
                                                        <option value="Self" ${contact.contactPersonS2Relation=="Self"?'selected':''}>Self</option>
                                                        <option value="Parent/Guardian" ${contact.contactPersonS2Relation=="Parent/Guardian"?'selected':''}>Parent/Guardian</option>
                                                        <option value="Sibling" ${contact.contactPersonS2Relation=="Sibling"?'selected':''}>Sibling</option>
                                                        <option value="Friend" ${contact.contactPersonS2Relation=="Friend"?'selected':''}>Friend</option>
                                                        <option value="Other" ${contact.contactPersonS2Relation=="Other"?'selected':''}>Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Relation 3</label>
                                                <div class="controlsData"> 
                                                    <select name="contact.contactPersonS3Relation" >
                                                        <option value="">Select</option>
                                                        <option value="Self" ${contact.contactPersonS3Relation=="Self"?'selected':''}>Self</option>
                                                        <option value="Parent/Guardian" ${contact.contactPersonS3Relation=="Parent/Guardian"?'selected':''}>Parent/Guardian</option>
                                                        <option value="Sibling" ${contact.contactPersonS3Relation=="Sibling"?'selected':''}>Sibling</option>
                                                        <option value="Friend" ${contact.contactPersonS3Relation=="Friend"?'selected':''}>Friend</option>
                                                        <option value="Other" ${contact.contactPersonS3Relation=="Other"?'selected':''}>Other</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Tel 1</label>
                                                <div class="controlsData"> 
                                                    <input type="text" id="tel" name="contact.telephoneSubhlagan"  value="${contact.telephoneSubhlagan}">
                                                    <label id="validateTel" style="display:none;color:red;width:100%;">Please enter valid telephone number</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Tel 2</label>

                                                <div class="controlsData">
                                                    <input type="text" id="tel2" name="contact.telephoneSubhlagan2"  value="${contact.telephoneSubhlagan2}">
                                                    <label id="validateTel2" style="display:none;color:red;width:100%;">Please enter valid telephone number</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Tel 3</label>

                                                <div class="controlsData">
                                                    <input type="text" id="tel3" name="contact.telephoneSubhlagan3"  value="${contact.telephoneSubhlagan3}">
                                                    <label id="validateTel3" style="display:none;color:red;width:100%;">Please enter valid telephone number</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Email 1</label>

                                                <div class="controlsData">
                                                    <input type="email" id="emailSubhlagan" name="contact.emailSubhlagan"  value="${contact.emailSubhlagan}">
                                                    <label id="validateEmailSubhlagan" style="display:none;color:red;width:100%;">Please enter valid email</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Email 2</label>

                                                <div class="controlsData">
                                                    <input type="email" id="emailSubhlagan2" name="contact.emailSubhlagan2"  value="${contact.emailSubhlagan2}">
                                                    <label id="validateEmailSubhlagan2" style="display:none;color:red;width:100%;">Please enter valid email</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Email 3</label>

                                                <div class="controlsData">
                                                    <input type="email" id="emailSubhlagan3" name="contact.emailSubhlagan3"  value="${contact.emailSubhlagan3}">
                                                    <label id="validateEmailSubhlagan3" style="display:none;color:red;width:100%;">Please enter valid email</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Primary </label>

                                                <div class="controlsData">
                                                    <input type="checkbox" id="contactCkBox" value="1"<s:if test="contact.contactFlag1==1">checked</s:if> name="contact.contactFlag1" />
                                                        <!--<label id="validateEmailSubhlagan3" style="display:none;color:red;width:100%;">Please enter valid email</label>-->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="formDATA">
                                                    <label>Primary</label>

                                                    <div class="controlsData">
                                                        <input type="checkbox" id="contactCkBox" value="1"<s:if test="contact.contactFlag2==1">checked</s:if>  name="contact.contactFlag2" />
                                                        <!--<label id="validateEmailSubhlagan3" style="display:none;color:red;width:100%;">Please enter valid email</label>-->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="formDATA">
                                                    <label>Primary</label>

                                                    <div class="controlsData">
                                                        <input type="checkbox" id="contactCkBox" value="1"<s:if test="contact.contactFlag3==1">checked</s:if>  name="contact.contactFlag3" />
                                                        <!--                                                    <label id="validateEmailSubhlagan3" style="display:none;color:red;width:100%;">Please enter valid email</label>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div id="contactdetail" class="scrollanchor"></div>
                                    <div class="col-lg-12" id="displayContactdetails">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Contact Details</span></div>
                                            <div class="formEdit"><a href="#!" onclick="displayContactdetails()">Edit</a></div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Address </label>

                                                <div class="controlsData"> 
                                                ${contact.contactAddress}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Telephone</label>
                                            <div class="controlsData"> 
                                                ${contact.telephone}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Email</label>
                                            <div class="controlsData"> 
                                                ${contact.email}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Location</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonSlLocation}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9"  style="height:44px">
                                        <div class="formDATA">
                                            <label></label>
                                            <div class="controlsData"> 

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Contact Person 1</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonSl}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Contact Person 2</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonS2}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Contact Person 3</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonS3}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Relation 1</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonSlRelation}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Relation 2</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonS2Relation}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Relation 3</label>
                                            <div class="controlsData"> 
                                                ${contact.contactPersonS3Relation}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Tel 1</label>
                                            <div class="controlsData">
                                                ${contact.telephoneSubhlagan}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Tel 2</label>
                                            <div class="controlsData">
                                                ${contact.telephoneSubhlagan2}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Tel 3</label>
                                            <div class="controlsData">
                                                ${contact.telephoneSubhlagan3}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Email 1</label>
                                            <div class="controlsData">
                                                ${contact.emailSubhlagan}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Email 2</label>
                                            <div class="controlsData">
                                                ${contact.emailSubhlagan2}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Email 3</label>
                                            <div class="controlsData">
                                                ${contact.emailSubhlagan3}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="formDATA">
                                            <label>Primary</label>
                                            <div class="controlsData">
                                                <s:if test="contact.contactFlag1==1">Call</s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Primary</label>
                                                <div class="controlsData">
                                                <s:if test="contact.contactFlag2==1">Call </s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Primary</label>
                                                <div class="controlsData">
                                                <s:if test="contact.contactFlag3==1">Call</s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>


                                    </div>


                                    <!--CONTACT DETAIL ENDS
        
                                    <!--PREFERENCES STARTS-->

                                    <div class="col-lg-12" id="preferencesEdit" style="display:none;">
                                        <form action="saveDesiredPartnerDetails" method="post" > 

                                            <div class="formHEADDiv whiteBG">
                                                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Preferences <span class="smSpantext">(What you are looking for - about the prospective match)</span> </span></div>
                                                <div class="formEdit">
                                                    <input class="btn btn-primary saveBtn" value="save" type="submit">
                                                </div>
                                            </div>
                                            <section class="formHalf">
                                                <div class="formDATA">
                                                    <label>Height</label>
                                                    <div class="controlsData">
                                                        <input value="${contact.contactId}" type="hidden" name="contact.contactId">
                                                    <select  tabindex="5" name="contact.desiredPartnersHeight"  style="width:40%!important;display: inline-block;vertical-align: top;">
                                                        <option value="">--Select height1--</option>
                                                        <s:iterator value="heightList" id="heightListId" >                                                                                                            
                                                            <option  ${contact.desiredPartnersHeight==heightListId.baseId?'selected':''} value="${heightListId.baseId}">${heightListId.baseValue}</option>
                                                        </s:iterator>   
                                                    </select>
                                                    <select   name="contact.desiredPartnersHeight2" tabindex="5"  style="width:40%!important;display: inline-block;vertical-align: top;">
                                                        <option value="">--Select height2--</option>
                                                        <s:iterator value="heightList" id="heightListId" >
                                                            <option  ${contact.desiredPartnersHeight2==heightListId.baseId?'selected':''} value="${heightListId.baseId}">${heightListId.baseValue}</option>
                                                        </s:iterator>   
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label> Education</label>
                                                <div class="controlsData"> 


                                                    <div class="commonChecklist">
                                                        <s:checkboxlist value="%{contact.desiredPartnersEducationArray}" name="contact.desiredPartnersEducation"   listKey="educationId" listValue="educationName" list="educationList"></s:checkboxlist>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Please mention, if international academic exposure is preferred</label>
                                                    <div class="controlsData"> 

                                                    <s:select listKey="commonId" listValue="commonName" list="pgotraList" name="contact.internationalExposure" value="contact.internationalExposure"></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Working</label>
                                                    <div class="controlsData">
                                                        <div class="commonChecklist"><s:checkboxlist name="contact.desiredPartnersWorkString" value="%{contact.desiredPartnersWork}" list="workList"   listKey="workId" listValue="workName"       /></div>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Same Gotra</label>
                                                <div class="controlsData">

                                                    <s:select listKey="commonId" listValue="commonName" list="pgotraList" name="contact.gotra" value="contact.gotra"></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label/>Location</label>
                                                    <div class="controlsData"> 

                                                        <div class="commonChecklist"><s:checkboxlist name="contact.desiredPartnersLocationString" value="%{contact.desiredPartnersSmoke}" list="locationList" listKey="locationId" listValue="locationName" /></div>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Age</label>
                                                <div class="controlsData">
                                                    <select name=contact.desiredPartnersAge1 tabindex="1"  id="hourId" style="width:40%!important;display: inline-block;vertical-align: top;">   
                                                        <option value="" >--Select Age1--</option>
                                                        <option value="18" ${contact.desiredPartnersAge1=="18"?'selected':''}>18</option>
                                                        <option value="19" ${contact.desiredPartnersAge1=="19"?'selected':''}>19</option>
                                                        <option value="20" ${contact.desiredPartnersAge1=="20"?'selected':''}>20</option>
                                                        <option value="21" ${contact.desiredPartnersAge1=="21"?'selected':''}>21</option>
                                                        <option value="22" ${contact.desiredPartnersAge1=="22"?'selected':''}>22</option>
                                                        <option value="23" ${contact.desiredPartnersAge1=="23"?'selected':''}>23</option>
                                                        <option value="24" ${contact.desiredPartnersAge1=="24"?'selected':''}>24</option>
                                                        <option value="25" ${contact.desiredPartnersAge1=="25"?'selected':''}>25</option>
                                                        <option value="26" ${contact.desiredPartnersAge1=="26"?'selected':''}>26</option>
                                                        <option value="27" ${contact.desiredPartnersAge1=="27"?'selected':''}>27</option>
                                                        <option value="28" ${contact.desiredPartnersAge1=="28"?'selected':''}>28</option>
                                                        <option value="29" ${contact.desiredPartnersAge1=="29"?'selected':''}>29</option>
                                                        <option value="30" ${contact.desiredPartnersAge1=="30"?'selected':''}>30</option>
                                                        <option value="31" ${contact.desiredPartnersAge1=="31"?'selected':''}>31</option>
                                                        <option value="32" ${contact.desiredPartnersAge1=="32"?'selected':''}>32</option>
                                                        <option value="33" ${contact.desiredPartnersAge1=="33"?'selected':''}>33</option>
                                                        <option value="34" ${contact.desiredPartnersAge1=="34"?'selected':''}>34</option>
                                                        <option value="35" ${contact.desiredPartnersAge1=="35"?'selected':''}>35</option>
                                                        <option value="36" ${contact.desiredPartnersAge1=="36"?'selected':''}>36</option>
                                                        <option value="37" ${contact.desiredPartnersAge1=="37"?'selected':''}>37</option>
                                                        <option value="38" ${contact.desiredPartnersAge1=="38"?'selected':''}>38</option>
                                                        <option value="39" ${contact.desiredPartnersAge1=="39"?'selected':''}>39</option>
                                                        <option value="40" ${contact.desiredPartnersAge1=="40"?'selected':''}>40</option>
                                                        <option value="41" ${contact.desiredPartnersAge1=="41"?'selected':''}>41</option>
                                                        <option value="42" ${contact.desiredPartnersAge1=="42"?'selected':''}>42</option>
                                                        <option value="43" ${contact.desiredPartnersAge1=="43"?'selected':''}>43</option>
                                                        <option value="44" ${contact.desiredPartnersAge1=="44"?'selected':''}>44</option>
                                                        <option value="45" ${contact.desiredPartnersAge1=="45"?'selected':''}>45</option>
                                                        <option value="46" ${contact.desiredPartnersAge1=="46"?'selected':''}>46</option>
                                                        <option value="47" ${contact.desiredPartnersAge1=="47"?'selected':''}>47</option>
                                                        <option value="48" ${contact.desiredPartnersAge1=="48"?'selected':''}>48</option>
                                                        <option value="49" ${contact.desiredPartnersAge1=="49"?'selected':''}>49</option>
                                                        <option value="50" ${contact.desiredPartnersAge1=="50"?'selected':''}>50</option>
                                                        <option value="51" ${contact.desiredPartnersAge1=="51"?'selected':''}>51</option>
                                                        <option value="52" ${contact.desiredPartnersAge1=="52"?'selected':''}>52</option>
                                                        <option value="53" ${contact.desiredPartnersAge1=="53"?'selected':''}>53</option>
                                                        <option value="54" ${contact.desiredPartnersAge1=="54"?'selected':''}>54</option>
                                                        <option value="55" ${contact.desiredPartnersAge1=="55"?'selected':''}>55</option>
                                                        <option value="56" ${contact.desiredPartnersAge1=="56"?'selected':''}>56</option>
                                                        <option value="57" ${contact.desiredPartnersAge1=="57"?'selected':''}>57</option>
                                                        <option value="58" ${contact.desiredPartnersAge1=="58"?'selected':''}>58</option>
                                                        <option value="59" ${contact.desiredPartnersAge1=="59"?'selected':''}>59</option>
                                                        <option value="60" ${contact.desiredPartnersAge1=="60"?'selected':''}>60</option>
                                                        <option value="61" ${contact.desiredPartnersAge1=="61"?'selected':''}>61</option>
                                                        <option value="62" ${contact.desiredPartnersAge1=="62"?'selected':''}>62</option>
                                                        <option value="63" ${contact.desiredPartnersAge1=="63"?'selected':''}>63</option>
                                                        <option value="64" ${contact.desiredPartnersAge1=="64"?'selected':''}>64</option>
                                                        <option value="65" ${contact.desiredPartnersAge1=="65"?'selected':''} >65</option>
                                                    </select>
                                                    <select name="contact.desiredPartnersAge2" tabindex="1"   style="width:40%!important;display: inline-block;vertical-align: top;">  
                                                        <option value="">--Select Age2--</option>
                                                        <option value="18" ${contact.desiredPartnersAge2=="18"?'selected':''}>18</option>
                                                        <option value="19" ${contact.desiredPartnersAge2=="19"?'selected':''}>19</option>
                                                        <option value="20" ${contact.desiredPartnersAge2=="20"?'selected':''}>20</option>
                                                        <option value="21" ${contact.desiredPartnersAge2=="21"?'selected':''}>21</option>
                                                        <option value="22" ${contact.desiredPartnersAge2=="22"?'selected':''}>22</option>
                                                        <option value="23" ${contact.desiredPartnersAge2=="23"?'selected':''}>23</option>
                                                        <option value="24" ${contact.desiredPartnersAge2=="24"?'selected':''}>24</option>
                                                        <option value="25" ${contact.desiredPartnersAge2=="25"?'selected':''}>25</option>
                                                        <option value="26" ${contact.desiredPartnersAge2=="26"?'selected':''}>26</option>
                                                        <option value="27" ${contact.desiredPartnersAge2=="27"?'selected':''}>27</option>
                                                        <option value="28" ${contact.desiredPartnersAge2=="28"?'selected':''}>28</option>
                                                        <option value="29" ${contact.desiredPartnersAge2=="29"?'selected':''}>29</option>
                                                        <option value="30" ${contact.desiredPartnersAge2=="30"?'selected':''}>30</option>
                                                        <option value="31" ${contact.desiredPartnersAge2=="31"?'selected':''}>31</option>
                                                        <option value="32" ${contact.desiredPartnersAge2=="32"?'selected':''}>32</option>
                                                        <option value="33" ${contact.desiredPartnersAge2=="33"?'selected':''}>33</option>
                                                        <option value="34" ${contact.desiredPartnersAge2=="34"?'selected':''}>34</option>
                                                        <option value="35" ${contact.desiredPartnersAge2=="35"?'selected':''}>35</option>
                                                        <option value="36" ${contact.desiredPartnersAge2=="36"?'selected':''}>36</option>
                                                        <option value="37" ${contact.desiredPartnersAge2=="37"?'selected':''}>37</option>
                                                        <option value="38" ${contact.desiredPartnersAge2=="38"?'selected':''}>38</option>
                                                        <option value="39" ${contact.desiredPartnersAge2=="39"?'selected':''}>39</option>
                                                        <option value="40" ${contact.desiredPartnersAge2=="40"?'selected':''}>40</option>
                                                        <option value="41" ${contact.desiredPartnersAge2=="41"?'selected':''}>41</option>
                                                        <option value="42" ${contact.desiredPartnersAge2=="42"?'selected':''}>42</option>
                                                        <option value="43" ${contact.desiredPartnersAge2=="43"?'selected':''}>43</option>
                                                        <option value="44" ${contact.desiredPartnersAge2=="44"?'selected':''}>44</option>
                                                        <option value="45" ${contact.desiredPartnersAge2=="45"?'selected':''}>45</option>
                                                        <option value="46" ${contact.desiredPartnersAge2=="46"?'selected':''}>46</option>
                                                        <option value="47" ${contact.desiredPartnersAge2=="47"?'selected':''}>47</option>
                                                        <option value="48" ${contact.desiredPartnersAge2=="48"?'selected':''}>48</option>
                                                        <option value="49" ${contact.desiredPartnersAge2=="49"?'selected':''}>49</option>
                                                        <option value="50" ${contact.desiredPartnersAge2=="50"?'selected':''}>50</option>
                                                        <option value="51" ${contact.desiredPartnersAge2=="51"?'selected':''}>51</option>
                                                        <option value="52" ${contact.desiredPartnersAge2=="52"?'selected':''}>52</option>
                                                        <option value="53" ${contact.desiredPartnersAge2=="53"?'selected':''}>53</option>
                                                        <option value="54" ${contact.desiredPartnersAge2=="54"?'selected':''}>54</option>
                                                        <option value="55" ${contact.desiredPartnersAge2=="55"?'selected':''}>55</option>
                                                        <option value="56" ${contact.desiredPartnersAge2=="56"?'selected':''}>56</option>
                                                        <option value="57" ${contact.desiredPartnersAge2=="57"?'selected':''}>57</option>
                                                        <option value="58" ${contact.desiredPartnersAge2=="58"?'selected':''}>58</option>
                                                        <option value="59" ${contact.desiredPartnersAge2=="59"?'selected':''}>59</option>
                                                        <option value="60" ${contact.desiredPartnersAge2=="60"?'selected':''}>60</option>
                                                        <option value="61" ${contact.desiredPartnersAge2=="61"?'selected':''}>61</option>
                                                        <option value="62" ${contact.desiredPartnersAge2=="62"?'selected':''}>62</option>
                                                        <option value="63" ${contact.desiredPartnersAge2=="63"?'selected':''}>63</option>
                                                        <option value="64" ${contact.desiredPartnersAge2=="64"?'selected':''}>64</option>
                                                        <option value="65" ${contact.desiredPartnersAge2=="65"?'selected':''} >65</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>                                                    
                                                    Complexion
                                                </label>
                                                <div class="controlsData">
                                                    <div class="commonChecklist"><s:checkboxlist  name="contact.desiredPartnersComplexionString" value="%{contact.desiredPartnersComplexion}" list="skinToneList"   listKey="complexionId" listValue="complexionType"       /></div>

                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Community</label>
                                                <div class="controlsData">                                                    
                                                    <div class="commonChecklist"><s:checkboxlist  list="communityList"  name="contact.desiredPartnersCommunityString" listKey="communityId" listValue="communityName"   value="%{contact.desiredPartnersCommunityIds}"    /></div>

                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Kundali Matter </label>
                                                <div class="controlsData"> 

                                                    <s:select listKey="commonId" listValue="commonName" name="contact.kundaliMatter" list="pgotraList"  value="%{contact.kundaliMatter}"></s:select>
                                                    </div>
                                                </div>
                                                <div class="formDATA">
                                                    <label>Manglik</label>
                                                    <div class="controlsData"> 
                                                        <select name="contact.pmanglik" value="${contact.manglik}" >
                                                        <option value="" ${contact.pmanglik==""?'selected':''}>--Select--</option>
                                                        <option value="Don't Know" ${contact.pmanglik=="Don't Know"?'selected':''}>Don't Know</option>
                                                        <option value="Yes" ${contact.pmanglik=="Yes"?'selected':''}>Yes</option>
                                                        <option value="No" ${contact.pmanglik=="No"?'selected':''}>No</option>
                                                        <option value="Anshik" ${contact.pmanglik=="Anshik"?'selected':''}>Anshik</option>
                                                    </select>
                                                    <%--<s:select  list="pgotraList" listKey="commonId" listValue="commonName" name="contact.pmanglik" value="%{contact.pmanglik}"></s:select>--%>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Food Habits</label>
                                                <div class="controlsData">

                                                    <div class="commonChecklist"><s:checkboxlist name="contact.desiredPartnersDietString" value="%{contact.pdietIds}" list="dietList" listKey="dietId" listValue="dietType" /></div>
                                                </div>
                                            </div>

                                        </section>

                                    </form>
                                </div><!--PREFERENCES ENDS-->


                                <!---Preferences display-->

                                <div id="prefer" class="scrollanchor"></div>
                                <div class="col-lg-12" id="preferencesDisplay" >

                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Preferences <span class="smSpantext">(What you are looking for - about the prospective match)</span> </span></div>
                                        <div class="formEdit"><a href="#!" onclick="displayPreferencesEdit()">Edit</a>

                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Height</label>
                                            <div class="controlsData">

                                                <span> ${contact.desPartnersHeight1} TO  ${contact.desPartnersHeight2}</span>


                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label> Education</label>
                                            <div class="controlsData"> ${contact.desiredPartnersEducation}


                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Please mention, if international academic exposure is preferred</label>
                                            <div class="controlsData"> 
                                                ${contact.internationalExposure}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Working</label>
                                            <div class="controlsData">
                                                ${contact.desiredPartnersWorkString}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Same Gotra</label>
                                            <div class="controlsData">
                                                ${contact.gotra}

                                            </div>
                                        </div>
                                    </section>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Age</label>
                                            <div class="controlsData">
                                                <span>${contact.desiredPartnersAge1} TO ${contact.desiredPartnersAge2}</span>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>                                                    
                                                Complexion
                                            </label>
                                            <div class="controlsData">
                                                ${contact.desiredPartnersComplexionString}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Community</label>
                                            <div class="controlsData">     
                                                ${contact.community}


                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Kundali Matter </label>
                                            <div class="controlsData"> 
                                                ${contact.kundaliMatter}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Mangalik</label>
                                            <div class="controlsData"> 
                                                ${contact.pmanglik}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Food Habits</label>
                                            <div class="controlsData">
                                                ${contact.desiredPartnersDietString}

                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label/>Location</label>
                                            <div class="controlsData"> 
                                                ${contact.desiredPartnersLocationString}

                                            </div>
                                        </div>
                                    </section>

                                </div><!--PREFERENCES ENDS-->
                                <form action="saveMaritalStatus">
                                    <div id="specialcase" class="scrollanchor"></div>
                                    <div class="col-lg-12">



                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/educationIcon.png" alt="Icon"/><span>Special Case</span></div>
                                            <div class="formEdit">
                                                <div class="formEdit"><input class="btn btn-primary" value="save" type="submit" ></div>
                                            </div>
                                        </div>


                                        <div class="col-lg-12 specialCaseDiv">
                                            <input  type="hidden" value="${contact.contactId}" name="contact.contactId" />
                                            <input  type="hidden" value="${contact.maritalStatus}" id="maritalStatus"/>


                                            <select name="contact.maritalStatus" onchange="showDivyangOrDivorce(this.value)">
                                                <option value="Never Married"  ${contact.maritalStatus=="Never Married"?'selected':''}>Never Married</option>
                                                <option value="Divorced"  ${contact.maritalStatus=="Divorced"?'selected':''}>Divorced</option>
                                                <option value="Widowed"  ${contact.maritalStatus=="Widowed"?'selected':''}>Widow/Widower</option>
                                            </select>
                                        </div>
                                        <!--                                        <div class="col-lg-12 specialCaseDiv">
                                        
                                                                                    <input type="checkbox" id="divyangCkBox" value="1" name="contact.divyangFlag" onclick="showDivyangSection(this.id)"/>    Divyang                             
                                        
                                                                                </div>-->
                                    </div><!--SPECIAL CASE ENDS-->
                                </form>
                                <!--Divorcee/Widow/Widower Starts-->
                                <div class="col-lg-12" id="displayDivorce" style="display:none;">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divorcee/Widow/Widower Only</span></div>
                                        <div class="formEdit"><a href="#!" onclick="editDivorce()">Edit</a></div>

                                    </div>
                                    <section class="formFull">
                                        <div class="formDATA">

                                            <label>About Yourself</label>
                                            <div class="controlsData">

                                                ${contact.aboutwidow}


                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Living alone since - Please mention month &amp; year</label>
                                            <div class="controlsData">
                                                ${contact.livingalonewidow}
                                            </div>
                                        </div>
                                        <div class="formDATA">

                                            <label>Children Detail</label>

                                            <table cellpadding="0" cellspacing="0" border="" class="commonTable" id="buajiTable" >
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Gender</th>
                                                    <th>Age</th>
                                                    <th>Living With</th>
                                                </tr>

                                                <c:forEach items="${childrenList}" var="childrenListId">
                                                    <tr>
                                                        <td>${childrenListId.childName}</td>
                                                        <td>${childrenListId.gender}</td>
                                                        <td>${childrenListId.age}</td>
                                                        <td>${childrenListId.livingWith}</td>

                                                    </tr>

                                                </c:forEach>

                                            </table>
                                        </div>
                                        <div class="formDATA">
                                            <label>Special Preferences, if any</label>
                                            <div class="controlsData">
                                                ${contact.specialpreferencew}
                                            </div>
                                        </div>
                                    </section>
                                </div><!--Divorcee/Widow/Widower ENDS-->
                                <!--Divorcee/Widow/Widower edit Starts-->
                                <div class="col-lg-12" style="display: none;" id="editDivorce">
                                    <form method="post" action="saveChidren">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divorcee/Widow/Widower Only</span></div>
                                            <div class="formEdit"><input class="btn btn-primary" value="save" type="submit" onclick="return checkDivorcee()"></div>

                                        </div>
                                        <section class="formFull">
                                            <div class="formDATA">

                                                <label>About Yourself</label>
                                                <div class="controlsData">
                                                    <input id="aboutwidow" type="text" value="${contact.aboutwidow}" name="contact.aboutwidow">
                                                    <label style="display:none;color:red;width:100%;" id="validateaboutwidow">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label>Living alone since - Please mention month &amp; year</label>
                                                <div class="controlsData">
                                                    <input   id="livingalonewidow" type="text" value="${contact.livingalonewidow}" name="contact.livingalonewidow">
                                                    <label style="display:none;color:red;width:100%;" id="validatelivingalonewidow">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">

                                                <label>Children Detail</label>
                                                <div class="formEdit"><a class="addRow" onclick="addChildren()"><i class="fa fa-plus"></i> Add More</a></div>

                                                <table cellpadding="0" cellspacing="0" border="" class="commonTable" id="childTable" >
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Gender</th>
                                                        <th>Age</th>
                                                        <th>Living With</th>
                                                    </tr>
                                                    <input type="hidden" name="contact.contactId" value="${contact.contactId}">
                                                    <c:forEach items="${childrenList}" var="childrenListId" varStatus="loop">

                                                        <tr>
                                                            <td id="childName${loop.index}"><div class="controlsData"><input type="text" name="children.childNameArray" value="${childrenListId.childName}" ></div></td>
                                                            <td id="childGender${loop.index}"><select  name="children.genderArray">
                                                                    <option ${childrenListId.gender==""?'selected':''} value="">--Select--</option>
                                                                    <option ${childrenListId.gender=="Male"?'selected':''} value="Male">Male</option>
                                                                    <option ${childrenListId.gender=="Female"?'selected':''} value="Female">Female</option>
                                                                </select></td>
                                                            <td id="childAge${loop.index}"><div class="controlsData"><input type="text" name="children.ageArray" value="${childrenListId.age}" ></div></td>
                                                            <td id="childLivingWith${loop.index}"><div class="controlsData"><input name="children.livingWithArray" type="text" value="${childrenListId.livingWith}" ></div></td>

                                                        </tr>
                                                    </c:forEach>

                                                </table>
                                            </div>
                                            <div class="formDATA">
                                                <label>Special Preferences, if any</label>
                                                <div class="controlsData">
                                                    <input  id="specialpreferencew" type="text" value="${contact.specialpreferencew}" name="contact.specialpreferencew">
                                                    <label style="display:none;color:red;width:100%;" id="validatespecialpreferencew">Please enter valid details</label>
                                                </div>
                                            </div>
                                        </section>
                                    </form>
                                </div><!--Divorcee/Widow/Widower ENDS-->

                                <!--New Form For Divyang Flag  Added By Vineet-->
                                <form action="saveDivyangFlag">
                                    <div id="specialcase" class="scrollanchor"></div>
                                    <div class="col-lg-12">



                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/><span>Divyang</span></div>
                                            <div class="formEdit">
                                                <div class="formEdit"><input class="btn btn-primary" value="save" type="submit" ></div>
                                            </div>
                                        </div>



                                        <div class="col-lg-12 specialCaseDiv"> 
                                            <input  type="hidden" value="${contact.contactId}" name="contact.contactId" />
                                            <input  type="hidden" value="${contact.divyangFlag}" id="divyangFlag"/>                                           
                                        </div>
                                        <div class="col-lg-12 specialCaseDiv">

                                            <input type="checkbox" id="divyangCkBox" value="1" name="contact.divyangFlag" onclick="showDivyangSection(this.id)"/>    Divyang                             

                                        </div>
                                    </div>

                                </form>
                                <!--Divang flag form End-->


                                <!--Divyank starts-->
                                <div class="col-lg-12" id="displayDivyang" style="display:none;">

                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divyang Only</span></div>
                                        <div class="formEdit"><a href="#!" onclick="displayDivyang()">Edit</a></div>
                                    </div>
                                    <section class="formFull">
                                        <div class="formDATA"> 

                                            <label>About Yourself</label> 
                                            <div class="controlsData">${contact.aboutdivyang}</div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Disability in Detail</label> 
                                            <div class="controlsData">${contact.disability}</div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Since - Please mention month &amp; year</label>    
                                            <div class="controlsData">${contact.divyangsince}</div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Special Preferences, if any</label>   
                                            <div class="controlsData">${contact.specialpreferencediv}</div>
                                        </div>
                                    </section>
                                    <!--                                    <section class="formFull">
                                                                            <span>Important Information</span>
                                                                            <ol>
                                                                                <li>Matter of this part is to be decided by SL Team</li>
                                                                                <li></li>
                                                                                <li></li>
                                                                                <li></li>
                                                                            </ol>
                                                                            <div>
                                                                                We have come to know about Subhlagan via.......................................................<br/>
                                                                                We have read the information  understand that Subhlagan team will take maximum possible
                                                                                care in finding the suitable match  could not be held responsible for future mis happenings,
                                                                                if any. In the process, they are allowed to share our bio-data details fully or partial as per
                                                                                the requirement. We have also got details of both, Subhlagan Registration  Success Fee structure
                                                                                abide to pay the same as  when applicable.
                                    
                                                                            </div>
                                                                        </section>-->

                                </div><!--Divyank ENDS-->

                                <!--Divyank edit starts-->

                                <div class="col-lg-12" id="editDivyang" style="display:none;">
                                    <form  action="saveDivyang"method="post" >

                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img  src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divyang Only</span></div>
                                            <div class="formEdit"><input class="btn btn-primary saveBtn" type="submit" value="save" onclick="return saveDivyang()"></div>
                                        </div>
                                        <section class="formFull">
                                            <div class="formDATA">
                                                <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                <label>About Yourself</label> 
                                                <div class="controlsData">
                                                    <input id="aboutdivyang" type="text" value="${contact.aboutdivyang}" name="contact.aboutdivyang">
                                                    <label id="validateaboutdivyang" style="display:none;width:100%;color:red;">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Disability in Detail</label> 
                                                <div class="controlsData">
                                                    <input id="disability" type="text" value="${contact.disability}" name="contact.disability">
                                                    <label id="validatedisability" style="display:none;width:100%;color:red;">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Since - Please mention month &amp; year</label>    
                                                <div class="controlsData">
                                                    <input id="divyangsince" type="text" id="divyangsince" value="${contact.divyangsince}" name="contact.divyangsince">
                                                    <label id="validatedivyangsince" style="display:none;width:100%;color:red;">Please enter valid details</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Special Preferences, if any</label>   
                                                <div class="controlsData">
                                                    <input id="specialpreferencediv" type="text" value="${contact.specialpreferencediv}" name="contact.specialpreferencediv">
                                                    <label id="validatespecialpreferencediv" style="display:none;width:100%;color:red;">Please enter valid details</label>
                                                </div>
                                            </div>
                                        </section>
                                    </form>
                                </div><!--Divyank edit ENDS-->

                                <!---Restricted Profile display-->

                                <div id="restrictedProfle" class="scrollanchor"></div>
                                <div class="col-lg-12" id="restrictedProfleDisplay" >

                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Restricted Profile </span></div>
                                        <div class="formEdit"><a href="#!" onclick="displayRestrictedProfileEdit()">Edit</a></div>
                                    </div>
                                    <div class="formDATA">
                                        <label>Restricted Profile</label>
                                        <div class="controlsData">
                                            <span> ${contact.sameFamily}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" id="restrictedProfileEdit" style="display:none;">
                                    <form action="saveRestrictedProfile" method="post" > 
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Restricted Profile</span></div>
                                            <div class="formEdit">
                                                <input class="btn btn-primary saveBtn" value="save" type="submit">
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>                                                    
                                                Restricted Profile
                                            </label>
                                            <div class="controlsData">
                                                <input type="hidden" value="${contact.contactId}" name="contact.contactId"/>
                                                <input style="display: inline-block;width: 33%!important;" type="text" id="restrictedProfileAutoComplete"  class="input_text" /><button class="btn btn-primary" onclick="return check()"> Add</button>
                                                <textarea style="display: inline-block;width: 57%;height: 100px!important;" readonly=""  id="contactList" name="contact.sameFamily" rows="10" cols="10">${contact.sameFamily}</textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!--Restricted Profile ENDS-->
                                <div class="col-lg-12" id="officeUse">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Office Use Only</span></div>
                                        <div class="formEdit"><a href="#!" onclick="officeUseOnly()">Edit</a>
                                        </div>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Budget / Range </label>
                                            <div class="controlsData">
                                                <span id="grandFatherNameLabel">${contact.budget}</span>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Family (income or Salary) </label>
                                            <div class="controlsData">
                                                <span>${contact.familySalary}</span>
                                            </div>
                                        </div>
                                        <c:if test="${contact.maritalStatus=='Divorced'}">
                                            <div class="formDATA">
                                                <label>Reason of Divorce</label>
                                                <div class="controlsData">
                                                    <span>${contact.reasonOfDivorce}</span>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="formDATA">
                                            <label>Reference given by</label>
                                            <div class="controlsData">
                                                <span>${contact.referenceGivenBy}</span>
                                            </div>
                                        </div>
                                    </section>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Preference</label>
                                            <div class="controlsData">
                                                <span id="grandMotherNameLabel">${contact.preference}</span>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Property Of Ownership</label>
                                            <div class="controlsData">
                                                <span>${contact.propertyOfOwnership}</span>
                                            </div>
                                        </div>
                                        <c:if test="${contact.maritalStatus=='Divorced'}">
                                            <div class="formDATA">
                                                <label>whether divorce is settled</label>
                                                <div class="controlsData">
                                                    <span>${contact.divorcedOrSettled}</span>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="formDATA">
                                            <label>Family Background </label>
                                            <div class="controlsData">
                                                <span>${contact.familyBackground}</span>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-lg-12" id="officeUseEdit" style="display:none;">
                                    <form action="saveOfficeUseDetail" method="post">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Office Use</span></div>
                                            <div class="formEdit"><a href="#!"><input value="save" class="btn btn-primary saveBtn" type="submit" ></a>

                                            </div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Budget / Range </label>
                                                <div class="controlsData">
                                                    <span id="grandFatherNameLabel"> 
                                                        <input id="budget" type="text" value="${contact.budget}" name="contact.budget" />
                                                        <input type="hidden" value="${contact.contactId}" name="contact.contactId"/>
                                                        <label id="validateBudget" style="display:none;width:100%;color:red;">Please enter proper Budget</label>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Family (income or Salary) </label>
                                                <div class="controlsData">
                                                    <span> 
                                                        <input id="familySalary" type="text" value="${contact.familySalary}" name="contact.familySalary" />
                                                        <label id="validateFamilySalary" style="display:none;width:100%;color:red;">Please enter proper Salary</label>
                                                    </span>
                                                </div>
                                            </div>
                                            <c:if test="${contact.maritalStatus=='Divorced'}">
                                                <div class="formDATA">
                                                    <label>Reason of Divorce </label>
                                                    <div class="controlsData">
                                                        <span id="grandFatherNameLabel"> 
                                                            <input id="reasonOfDivorce" type="text" value="${contact.reasonOfDivorce}" name="contact.reasonOfDivorce" />
                                                            <label id="validateReasonOfDivorce" style="display:none;width:100%;color:red;">Please enter proper Reason</label>
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="formDATA">
                                                <label>Reference given by </label>
                                                <div class="controlsData">
                                                    <span> 
                                                        <input id="referenceGivenBy" type="text" value="${contact.referenceGivenBy}" name="contact.referenceGivenBy" />
                                                        <label id="validategrandFatherName" style="display:none;width:100%;color:red;">Please enter proper Name</label>
                                                    </span>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Preference</label>
                                                <div class="controlsData">
                                                    <span id="grandMotherNameLabel">
                                                        <textarea id="preference"  name="contact.preference" >${contact.preference}</textarea>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Property Of Ownership  </label>
                                                <div class="controlsData">
                                                    <span>
                                                        <textarea id="propertyOfOwnership"  name="contact.propertyOfOwnership" >${contact.propertyOfOwnership}</textarea>
                                                    </span>
                                                </div>
                                            </div>
                                            <c:if test="${contact.maritalStatus=='Divorced'}">
                                                <div class="formDATA">
                                                    <label>Whether divorce is settled</label>
                                                    <div class="controlsData">
                                                        <span >
                                                            <select id="divorcedOrSettled" name="contact.divorcedOrSettled">
                                                                <option ${contact.divorcedOrSettled=="Yes"?'selected':''} value="Yes">Yes</option>
                                                                <option ${contact.divorcedOrSettled=="No"?'selected':''} value="No">No</option>
                                                            </select>
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="formDATA">
                                                <label>Family Background </label>
                                                <div class="controlsData">
                                                    <span>
                                                        <textarea id="familyBackground"  name="contact.familyBackground" >${contact.familyBackground}</textarea>
                                                    </span>
                                                </div>
                                            </div>
                                        </section>
                                    </form>


                                </div>
                                <form>
                                    <c:if test="${contact.movedStatus=='Active' && (userSession.deptId!=9 && userSession.deptId!=15 && userSession.deptId!=16  && userSession.deptId!=18)}">
                                        <div class="otherInfoDivheaderRight" style="margin-right: 10px;">
                                            <div class="otherLinksDiv">
                                                <!--Vineet change Here Tomorrow-->
                                                <div  class="btn btn-primary" onclick="confirmLost()" >Lost opportunity</div>
                                                <div  class="btn btn-primary" onclick="confirmDelete()">Delete</div>
                                                <div  class="btn btn-primary1"  style="display:none" ><a id="lostOp" href="chengeMovedStatus?movedFlag=2&contactId=${contact.contactId}"  >Lost opportunity</a></div>
                                                <div  class="btn btn-primary1"  style="display:none"><a id="deleteC" href="chengeMovedStatus?movedFlag=3&contactId=${contact.contactId}"  >Delete</a></div>
                                            </div>

                                        </div>


                                    </c:if>      
                                </form>
                                <c:if test="${contact.movedStatus!='Active' && (userSession.deptId!=9 && userSession.deptId!=15 && userSession.deptId!=16  && userSession.deptId!=18)}">
                                    <div class="formEdit btnMarginRight"><div   class="btn btn-primary" ><a href="chengeMovedStatus?movedFlag=0&contactId=${contact.contactId}"  >Active</a></div></div>
                                </c:if>
                                <!--Edit PATERNAL SIDE ENDS-->
                                <div id="image" class="modal fade authenticationDiv" role="dialog">
                                    <div class="modal-dialog" style="width:30%">
                                        <form action="uploadImage" method="post" enctype="multipart/form-data">                                                                                                              
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Upload Image </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="contact.profilePictureNumber" id="imageNumber">
                                                    <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                    <input type="file"   name="contact.imageAttachment"  id="logo" />
                                                    <br/>
                                                    <input type="submit" class="btn btn-primary" value="upload" style="margin-left: 40%;">
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>                                                            
                                        </form>
                                    </div>
                                </div>
                                <!--short ends-->
                                <!--short starts-->
                                <div id="image1" class="modal fade authenticationDiv" role="dialog">
                                    <div class="modal-dialog" style="width:30%">
                                        <form action="deleteImage" method="post" enctype="multipart/form-data">                                                                                                              
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Delete Image </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="contact.profilePictureNumber" id="imageNumber1">
                                                    <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                    <input type="submit" value="Delete" class="btn btn-primary" style="margin-left: 40%;">
                                                </div>
                                                <div class="modal-footer">
                                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                                </div>
                                            </div>                                                            
                                        </form>
                                    </div>
                                </div>
                                <!--short ends-->
                                <!--short starts-->
                                <div id="biodata" class="modal fade authenticationDiv" role="dialog">
                                    <div class="modal-dialog" style="width:30%">
                                        <form action="uploadBioData" method="post" enctype="multipart/form-data">                                                                                                              
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Upload Biodata</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                                    <input type="file"   name="contact.imageAttachment"  id="documentUploadForBioData" />
                                                    <br/>
                                                    <input value="Upload" type="submit" onclick="return restrictUpload()" class="btn btn-primary" style="margin-left: 40%;">
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>                                                            
                                        </form>
                                    </div>
                                </div>
                                <!--short ends-->
                                <!--copy from here-->
                            </div>
                        </div>
                </section>
            </section>
        </section>
        <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top topbtnStyle" role="button" title="Top" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->


        <!--FOR PROFILE BIGGER IMAGE-->
        <!--image1-->
        <div id="bigImage1" class="modal fade authenticationDiv" role="dialog">

            <div class="modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="height:38px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body modalPadding">
                            <!--<img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1 }" style="width:100%"/>-->
                            <img src="${profileimgPath}${contact.image1 }" style="width:100%"/>
                        </div>
                    </div>  
                </div>
            </div>

        </div>
        <!--For image 2-->
        <div id="bigImage2" class="modal fade authenticationDiv" role="dialog">

            <div class="modal-dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="height:38px">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body modalPadding">
<!--                            <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2 }" style="width:100%"/>-->
                            <img src="${profileimgPath}${contact.image2 }" style="width:100%"/>
                        </div>
                    </div>  
                </div>
            </div>

        </div>
        <!--For image 3-->
        <div id="bigImage3" class="modal fade authenticationDiv" role="dialog">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="height:38px">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modalPadding">
<!--                        <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3 }" style="width:100%"/>-->
                        <img src="${profileimgPath}${contact.image3 }" style="width:100%"/>
                    </div>
                </div>  
            </div>

        </div>

        <!--For image 4-->
        <div id="bigImage4" class="modal fade authenticationDiv" role="dialog">

            <div class="modal-dialog">                                                                                                             
                <div class="modal-content">
                    <div class="modal-header" style="height:38px">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body modalPadding">
                        <!--<img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4 }" style="width:100%"/>-->
                        <img src="${profileimgPath}${contact.image4 }" style="width:100%"/>
                    </div>
                </div>                                                                  
            </div>

        </div>
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
        <!--Ended Big image Modal-->
        <script src="../js/bootstrap.min.js"></script>

        <!-- nice scroll -->
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/scripts.js"></script>
        <script type="text/javascript">

                                                        // When the document is ready
                                                        $(document).ready(function () {
                                                            $('#dob').datepicker({
                                                                format: "dd/mm/yyyy",
                                                            });
                                                            $('#livingalonewidow').datepicker({
                                                                format: "dd/mm/yyyy",
                                                            });
                                                            $('#divyangsince').datepicker({
                                                                format: "dd/mm/yyyy",
                                                            });
                                                            var maritalStatus = document.getElementById('maritalStatus').value;
                                                            var divyangFlag = document.getElementById('divyangFlag').value;
                                                            if (maritalStatus === 'Never Married')
                                                            {
                                                                document.getElementById("displayDivorce").style.display = "none";
                                                            } else if (maritalStatus === 'Divorced' || maritalStatus === 'Widowed')
                                                            {
                                                                document.getElementById("displayDivorce").style.display = "block";
                                                            }
                                                            if (divyangFlag === "1")
                                                            {
                                                                document.getElementById("divyangCkBox").click();
                                                                document.getElementById("displayDivyang").style.display = "block";
                                                            }

                                                            $(window).scroll(function () {
                                                                if ($(this).scrollTop() > 50) {
                                                                    $('#back-to-top').fadeIn();
                                                                } else {
                                                                    $('#back-to-top').fadeOut();
                                                                }
                                                            });
                                                            // scroll body to 0px on click
                                                            $('#back-to-top').click(function () {
                                                                $('#back-to-top').tooltip('hide');
                                                                $('body,html').animate({
                                                                    scrollTop: 400
                                                                }, 800);
                                                                return false;
                                                            });

                                                            $('#back-to-top').tooltip('show');
                                                        });
        </script>
        <script src="../js/bootstrap-datepicker.js"></script>
        <script src="../js/jquery.magnific-popup.js"></script> <!-- For image pop up -->
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">




                                                        $(document).ready(function ($) {
                                                            $(".scroll").click(function (event) {
                                                                event.preventDefault();
                                                                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                                            });
                                                            document.getElementById('txtAutoCompleteHeader').style.display = "block";
                                                        });



                                                        //                                Testing Script Hetal mam
                                                        $(document).ready(function () {
                                                            $('.popup-gallery').magnificPopup({
                                                                delegate: '.candidateIMGDiv a',
                                                                type: 'image',
                                                                tLoading: 'Loading image #%curr%...',
                                                                //                                                                tLoading: 'Loading image #%curr%...',
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


        </script>

    </body>
</html>
