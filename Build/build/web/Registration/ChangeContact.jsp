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
        <meta charset="utf-8"/>
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
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" />



    </head>
    <script type="text/javascript">
        $(function () {
            $("#restrictedProfileAutoComplete").autocomplete("List.jsp");

        });
        $(function () {
            $("#birthcity").autocomplete("AstroCityAutoComplete.jsp");

        });
        $(function () {
            $("#grewUpCityId").autocomplete("CityAutocomplete.jsp");

        });
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
                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1}" title="Image 1"><img  src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1}" class="popup-image"/></a>
                                                                        <!--<a href="${profileimgPath}${contact.image1}" title="Image 1"><img  src="${profileimgPath}${contact.image1}" class="popup-image"/></a>-->
                                                                        </c:if>
                                                                </div>
                                                                <c:if test="${contact.flagForImage1>0}">
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="updateImage1Change?contactId=${contact.contactId}">UPDATE</a> </span>
                                                                </div></c:if>
                                                            </div> 
                                                            <div class="candidatePHOTOContent" id="divimage2">
                                                                <div class="candidateIMGDiv">

                                                                    <c:if test="${contact.image2!='' && contact.image2!=null}">
                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2}" title="Image 2"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2}"/></a>
                                                                        <!--<a href="${profileimgPath}${contact.image2}" title="Image 2"> <img src="${profileimgPath}${contact.image2}"/></a>-->
                                                                        </c:if>
                                                                </div>
                                                                <c:if test="${contact.flagForImage2 >0 }">
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="updateImage2Change?contactId=${contact.contactId}">UPDATE</a>
                                                                    </span>
                                                                </div></c:if>
                                                            </div> 
                                                            <div class="candidatePHOTOContent" id="divimage3">
                                                                <div class="candidateIMGDiv">
                                                                    <c:if test="${contact.image3!='' && contact.image3!=null}">
                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3}" title="Image 3"><img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3}"/></a>
                                                                        <!--<a href="${profileimgPath}${contact.image3}" title="Image 3"><img src="${profileimgPath}${contact.image3}"/></a>-->
                                                                        </c:if>
                                                                </div>
                                                                <c:if test="${contact.flagForImage3>0}">
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="updateImage3Change?contactId=${contact.contactId}">UPDATE</a></span>                                                                 
                                                                </div></c:if>
                                                            </div> 

                                                            <div class="candidatePHOTOContent" id="divimage4">
                                                                <div class="candidateIMGDiv">
                                                                    <c:if test="${contact.image4!='' && contact.image4!=null}">
                                                                        <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4 }" title="Image 4"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4 }"/></a>
                                                                        <!--<a href="${profileimgPath}${contact.image4 }" title="Image 4"> <img src="${profileimgPath}${contact.image4 }"/></a>-->
                                                                        </c:if>
                                                                </div>
                                                                <c:if test="${contact.flagForImage4>0}">
                                                                <div class="candidateActionDiv">
                                                                    <span><a href="updateImage4Change?contactId=${contact.contactId}">UPDATE</a></span>
                                                                   
                                                                </div></c:if>
                                                            </div>

                                                            <div class="importantNoteCandidate">

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div><!--PHOTO ALBUM ENDS-->                                               
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
                                                ${contact.siblings}
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
                                        <c:if test="${contact.flagForIntroductory >0}">
                                        <div class="formEdit"><a href="updateIntroductoryChange?contactId=${contact.contactId}" >Update</a> </div> </c:if>                                                                        
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

                                            </div>
                                        </div>

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
                                                ${contact.bodyWeight}
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
                                <!--EDUCATION Starts-->



                                <div class="col-lg-12" id="displayEducation">
                                    <div id="education" class="scrollanchor"></div>
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/educationIcon.png" alt="Icon"/><span>Education</span></div>
                                        <c:if test="${contact.flagForEducation> 0}">
                                        <div class="formEdit"><a href="updateEducationChange?contactId=${contact.contactId}">Update</a></div>
                                        </c:if>
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

                                <div id="family" class="scrollanchor"></div>
                                <!--FAMILy Starts-->
                                <div class="col-lg-12"  id="displayFamilyDiv">

                                    <div class="formHEADDiv whiteBG"  >
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/familyIcon.png" alt="Icon"/><span>Family</span></div>
                                        <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                        <c:if test="${contact.flagForFamily>0}">
                                        <div class="formEdit"><a href="updateFamilyChange?contactId=${contact.contactId}">Update </a> </div>
                                        </c:if>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
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
                                </div>
                                <div class="col-lg-12"  id="displayFamilyDiv">
                                    <div class="formHEADDiv whiteBG"  >
                                        <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/familyIcon.png" alt="Icon"/><span>Siblings</span></div>
                                        <input type="hidden" value="${contact.contactId}" name="contact.contactId">
                                        <c:if test="${contact.flagForBrother>0}">
                                        <div class="formEdit"><a href="updateSiblingChange?contactId=${contact.contactId}">Update </a> </div>
                                        </c:if>
                                    </div>
                                    <section class="formFull">
                                        <div class="formDATA">
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

                                        </div>

                                        <div class="formDATA">
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
                                        </div>
                                    </section>
                                </div><!--FAMILY ENDS-->

                                <!--Paternal Side Starts-->
                                <div class="col-lg-12" id="paternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Paternal Side</span></div>
                                        <c:if test="${contact.flagForPaternal >0}">
                                        <div class="formEdit"><a href="updatePaternalChange?contactId=${contact.contactId}">Update</a></div> </c:if>                                                                           
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Grandfather's Name (Dadaji) </label>
                                            <div class="controlsData">
                                                <span id="grandFatherNameLabel">${contact.grandFatherName}</span>
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
                                                <span id="grandMotherNameLabel">${contact.grandMotherName}</span>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Grandmother Detail (Dadiji)</label>
                                            <div class="controlsData">
                                                <span>${contact.grandMotherPDetail}</span>
                                            </div>
                                        </div>
                                    </section>
                                </div>

                                <div class="col-lg-12" id="paternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Uncle/Aunty</span></div>
                                        <c:if test="${contact.flagForUncle>0}">
                                        <div class="formEdit"><a href="updateUncleChange?contactId=${contact.contactId}">Update</a> </div> </c:if>                                                                         
                                    </div>
                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Uncle (Chacha)</span></div>
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
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
                                                </div>

                                            </section>
                                        </div>
                                    </section>

                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Aunty (Bua)</span></div>                                          
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
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
                                                </div>

                                            </section>
                                        </div>
                                    </section>
                                </div><!--PATERNAL SIDE ENDS-->

                                <!-- Maternal SIDE Starts-->
                                <div class="col-lg-12" id="maternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Maternal Side</span></div>
                                        <c:if test="${contact.flagForMaternal>0}">
                                        <div class="formEdit"><a href="updateMaternalChange?contactId=${contact.contactId}" >Update</a></div>  </c:if>
                                        
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label >Grandfather's Name (Nanaji)</label>
                                            <div class="controlsData"> 
                                                <label>${contact.mgrandFatherName}</label>
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
                                                <label>${contact.mgrandMotherName}</label>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label >Grandmother Detail (Naniji)</label>
                                            <div class="controlsData"> 
                                                <label>${contact.grandMotherMDetail}</label>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                            
                                <div class="col-lg-12" id="maternalDivDisplay">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Mama/Mausi</span></div>
                                        <c:if test="${contact.flagForMama>0}">
                                        <div class="formEdit"><a href="updateMamaChange?contactId=${contact.contactId}" >Update</a></div></c:if>                                                                            
                                    </div>
                                    <section class="formFull">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span class="smsubHEAD">Uncle (Mama)</span></div>
                                            <div class="formEdit"><a href="#!"></a>

                                            </div>
                                        </div>
                                        <div >
                                            <section class="formFull">
                                                <div class="formDATA">
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
                                                </div>

                                            </section>
                                        </div>
                                    </section>
                                </div><!--MATERNAL SIDE ENDS-->
                                <!-- ABOUT FAMILY Starts-->
                                <div class="col-lg-12" id="aboutFamilyDiv">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>About Family</span></div>
                                        <c:if test="${contact.flagForAboutFamily>0}">
                                        <div class="formEdit"><a href="updateAboutFamilyChange?contactId=${contact.contactId}" id="edit12">Update</a> </div>
                                    </c:if>
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

                                <!--EDIT BUSINESS / PROFESSION STARTS-->
                                <div id="business" class="scrollanchor"></div>
                                <div class="col-lg-12"  id="displayBusinessForm" >




                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Business / Profession</span></div>
                                        <c:if test="${contact.flagForBusiness>0}">
                                        <div class="formEdit"><a href="updateBusinessChange?contactId=${contact.contactId}" id="edit12">Update</a>   </div>                                         
                                    </c:if>
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
                                        <div class="formDATA">
                                            <label >Family Business</label>

                                            <div class="controlsData">
                                                ${contact.aboutFamilyBisinessHtml}
                                            </div>
                                        </div>
                                    </section><!--form half left - family business ends-->

                                    <section class="formHalf">

                                    </section>

                                </div> <!--BUSINESS / PROFESSION ENDS-->

                                <!--Family Business Start Here By Vineet-->                               
                                <div id="familybusiness" class="scrollanchor"></div>
                                <div class="col-lg-12"  id="displayFamilyBusinessForm" >
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span> Family Business / Profession</span></div>
                                        <c:if test="${contact.flagForFamilyBusiness>0}">
                                        <div class="formEdit"><a href="updateFamilyBusinessChange?contactId=${contact.contactId}" id="edit12">Update</a>                   
                                        </div> </c:if>                                   
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

                                    </section><!--form half left - family business ends-->

                                    <section class="formHalf">    </section>
                                </div>

                                <!--Family Business End-->
                                <div id="medical" class="scrollanchor"></div>
                                <div class="col-lg-12" id="displayMedicalHistory">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Medical History</span></div>
                                        <c:if test="${contact.flagForMedical>0}">
                                        <div class="formEdit"><a href="updateMedicalChange?contactId=${contact.contactId}">Update</a></div>
                                    </c:if>
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

                                <div id="contactdetail" class="scrollanchor"></div>
                                <div class="col-lg-12" id="displayContactdetails">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Contact Details</span></div>
                                        <c:if test="${contact.flagForContactDetails>0}">
                                        <div class="formEdit"><a href="updateContactDetailChange?contactId=${contact.contactId}">Update</a></div>
                                        </c:if>
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
                                            <label>Primary </label>
                                            <div class="controlsData">
                                                <s:if test="%{contact.contactFlag1>0}">Call</s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Primary</label>
                                                <div class="controlsData">
                                                <s:if test="%{contact.contactFlag2>0}">Call </s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Primary</label>
                                                <div class="controlsData">
                                                <s:if test="%{contact.contactFlag3>0}">Call</s:if>
                                                <s:else>Don't Call</s:else>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--CONTACT DETAIL ENDS
        
                                    <!--PREFERENCES STARTS-->                                   

                                    <div id="prefer" class="scrollanchor"></div>
                                    <div class="col-lg-12" id="preferencesDisplay" >

                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Preferences <span class="smSpantext">(What you are looking for - about the prospective match)</span> </span></div>
                                        <c:if test="${contact.flagForPreference>0}">
                                            <div class="formEdit"><a href="updatePreferencesChange?contactId=${contact.contactId}">Update</a>
                                            </div></c:if>
                                    </div>
                                    <section class="formHalf">
                                        <div class="formDATA">
                                            <label>Height</label>
                                            <div class="controlsData">
                                                <span> ${contact.desiredPartnersHeight} TO  ${contact.desiredPartnersHeight2}</span>
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
                                <!--Divorcee/Widow/Widower Starts-->
                                <div class="col-lg-12" id="displayDivorce">
                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divorcee/Widow/Widower Only</span></div>
                                        <c:if test="${contact.flagForDivorce>0}">
                                        <div class="formEdit"><a href="updateDivorceChange?contactId=${contact.contactId}">Update</a></div></c:if>
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
                           

                                <!--Divyank starts-->
                                <div class="col-lg-12" id="displayDivyang">

                                    <div class="formHEADDiv whiteBG">
                                        <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Divyang Only</span></div>
                                        <c:if test="${contact.flagForDivyang>0}">
                                        <div class="formEdit"><a href="updateDivyangChange?contactId=${contact.contactId}">Update</a></div></c:if>
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
                                </div><!--Divyank ENDS-->                            
                            </div>
                        </div>
                </section>
            </section>
        </section>
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
<!--                            <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1 }" style="width:100%"/>-->
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
        <!--Ended Big image Modal-->
        <script src="../js/bootstrap.min.js"></script>

        <!-- nice scroll -->
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/scripts.js"></script>
        <script src="../js/bootstrap-datepicker.js"></script>
        <script src="../js/jquery.magnific-popup.js"></script> <!-- For image pop up -->
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
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
