<%-- 
    Document   : addNewMember
    Created on : 17 Mar, 2016, 4:33:05 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page language="java" import="com.crm.bean.Contact"%>
        <%@page language="java" import="java.util.List"%> 
        <%@page language="java" import="com.crm.manager.ProfileManager"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ page buffer = "100kb" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
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
        <script src="../js/statusmatchreport.js"></script>
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <!--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>-->
        <script src="../js/jquery.autocomplete.js"></script>


        <script src="../js/jquery-ui.js"></script>
        <script type="text/javascript">

            jQuery(function () {

                $("#country").autocomplete("List.jsp");

            });
            $('#country').on('change', function () {
                $('#tagsname').html('You selected: ' + this.value);
            }).change();

            function additionalInfoListIndividual(contactId)
            {
                $.ajax({
                    type: "post",
                    url: "feedbackNewHorizontal",
                    data: "contactId=" + contactId,
                    success: function (html) {
                        var temp = html.split("___");
                        document.getElementById("additionalInfoListHorizontalDiv").innerHTML = temp[0];
                        document.getElementById("budgetDivHorizontal").innerHTML = temp[1];
                        document.getElementById("preferenceDivHorizontal").innerHTML = temp[2];
                        document.getElementById("familySalaryDivHorizontal").innerHTML = temp[3];
                        document.getElementById("propertyOfOwnershipDivHorizontal").innerHTML = temp[4];
                        document.getElementById("reasonOfDivorceDivHorizontal").innerHTML = temp[5];
                        document.getElementById("divorcedOrSettledDivHorizontal").innerHTML = temp[6];
                        document.getElementById("referenceGivenByDivHorizontal").innerHTML = temp[7];
                        document.getElementById("familyBackgroundDivHorizontal").innerHTML = temp[8];
                    }
                });
                $.ajax({
                    type: "post",
                    url: "getHeading",
                    data: "contactId=" + contactId,
                    success: function (html) {
                        document.getElementById("additionalInfoListHorizontalHeading").innerHTML = "Additional Information " + html;
                    }
                });

            }


            function StatusListIndividual(contactId)
            {
                $.ajax({
                    type: "post",
                    url: "fetchStatusListIndividualFromMovedMember",
                    data: "contactId=" + contactId,
                    success: function (html)
                    {
                        document.getElementById("statusListIndividualListDiv").innerHTML = html;
                    }

                });
                $.ajax({
                    type: "post",
                    url: "getHeading",
                    data: "contactId=" + contactId,
                    success: function (html) {
                        document.getElementById("statusListHorizontalHeading").innerHTML = "Status List For " + html;
                    }
                });
            }


            function clearData()
            {
                $('#fromDate').val("");
                $('#toDate').val("");
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

        <!-- For media - TAB autosearch -->
        <script src="../js/DatalistPolyfill.js"></script>
    </head>
    <body onload="clearData();">
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP">
                            <h4 class="candidateName">Moved BioData List</h4>

                            <form action="movedBioDataList" method="post">  
                                <div class="row">
                                    <div class="nameSearch" id="searchDivMatchList">
                                        <div class="nameSearchInner" style="margin-top: 6px;position: relative;top: 2px !important;margin-left:14px">
                                            <input type="text" id="searchBy" class="ui-autocomplete-input" list="searchName" name="masterBean.search"  placeholder="Search by Name " /><!--your input textbox-->
                                            <!--<input type="submit" value="" id="searchBy" class="searchButton" onclick="searchMatchList()">-->
                                        </div>
                                    </div>

                                    <!--                                <div class="col-lg-2">
                                                                        <div class="formDATA">
                                                                            <div class="controlsData controlWidth">
                                                                                <input  type="text" id="country" name="masterBean.search" class="input_text" Placeholder="Name"/>
                                                                                <div id="tagsname"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>-->
                                    <div class="col-lg-3">
                                        <div class="formDATA">
                                            <div class="controlsData controlWidth">
                                                <select id="Status" name="masterBean.status">
                                                    <option ${masterBean.status=="0"?'selected':''} value="0">Status</option>
                                                    <option ${masterBean.status=="1"?'selected':''} value="1">Success</option>
                                                    <option ${masterBean.status=="2"?'selected':''} value="2">Lost Opportunity</option>
                                                    <option ${masterBean.status=="3"?'selected':''} value="3">Delete</option> 
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="formDATA">
                                            <div class="controlsData controlWidth">
                                                <s:select list="userList" headerKey="0" headerValue="SELECT RM" listKey="userId" listValue="name" name="masterBean.userId" value="%{masterBean.userId}"></s:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="formDATA">
                                                <div class="controlsData controlWidth">
                                                    <input type="text" name="masterBean.fromDate" value="${masterBean.fromDate}" placeholder="From Date" id="fromDate"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="formDATA">
                                            <div class="controlsData controlWidth">
                                                <input type="text" name="masterBean.toDate" value="${masterBean.toDate}" placeholder="To Date" id="toDate"/>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- ## 16-4-2019 Search filter for moved by ## -->
                                    <div class="col-lg-3" >
                                        <div class="formDATA">
                                            <s:select list="userList" headerKey="0" headerValue="SELECT MOVED BY" listKey="userId" listValue="name" name="masterBean.movedBy" value="%{masterBean.userId}"></s:select>
                                        </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="formDATA" style="position: relative;margin-top: 9px !important;"><button value="search" id="reset-date" class="btn btn-primary"  >Search</button></div> 
                                        </div> 
                                    </div>


                                </form>
                                <div class="row">
                                    <div class="col-lg-12" >


                                    <display:table   name="movedBioDataList"  id="movedBioDataListId" pagesize="15" export="true"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" >  
                                        <display:column  sortable="true"  media="html" title="">
                                            <div class="img-place">
                                                <!--<img class="img-circle" style="width: 55px;height: 55px;" alt="Photo" src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${movedBioDataListId.image1}">-->
                                                <img class="img-circle" style="width: 55px;height: 55px;" alt="Photo" src="${profileimgPath}${movedBioDataListId.image1}">
                                            </div>
                                            <a  href="#!" data-toggle="modal" data-target="#additionalInfoListIndividual" class="reportAction feedbackreportAction displayInline"  title="Additional Information" onclick="additionalInfoListIndividual(${movedBioDataListId.contactId})"></a>   
                                            <a href="#" data-toggle="modal" data-target="#statusListIndividual" onclick="return StatusListIndividual(${movedBioDataListId.contactId})" class="reportActionDivstatusicon statusreportIcon" title="Status Report"></a>
                                        </display:column>
                                        <%--<display:column  sortable="true"  title="Name" style="width:100px;" property="firstName" />--%>  
                                        <display:column  sortable="true"  title="Name" style="width:100px;"  sortProperty="firstName" media="html" >
                                            <a href="getContactDetail?contactId=${movedBioDataListId.contactId}">${movedBioDataListId.firstName} ${movedBioDataListId.middleName} ${movedBioDataListId.lastName}    ${movedBioDataListId.category}${movedBioDataListId.profileId}  (${movedBioDataListId.shortName}) ${movedBioDataListId.assignedToArm}</a>
                                        </display:column>
                                        <!--For csv Excel-->
                                        <display:column  sortable="true"  title="Name" style="width:100px;"  sortProperty="firstName" media="csv" >
                                            ${movedBioDataListId.firstName} ${movedBioDataListId.middleName} ${movedBioDataListId.lastName}    ${movedBioDataListId.category}${movedBioDataListId.profileId}  (${movedBioDataListId.shortName}) ${movedBioDataListId.assignedToArm}

                                        </display:column>
                                        <display:column  sortable="true"  title="Name" style="width:100px;"  sortProperty="firstName" media="excel" >
                                            ${movedBioDataListId.firstName} ${movedBioDataListId.middleName} ${movedBioDataListId.lastName}    ${movedBioDataListId.category}${movedBioDataListId.profileId}  (${movedBioDataListId.shortName}) ${movedBioDataListId.assignedToArm}
                                        </display:column>
                                        <display:column  title="Email" sortable="true" property="emailId" />

                                        <display:column  sortProperty="age" title="D.O.B" sortable="true"  paramProperty="dobString">
                                            ${movedBioDataListId.dobString}/${movedBioDataListId.age}
                                        </display:column>
                                        <display:column  title="Height" sortable="true" sortProperty="height">
                                            ${movedBioDataListId.heightFeet}'${movedBioDataListId.heightInch}in-${movedBioDataListId.height}cm
                                        </display:column>
                                        <display:column  title="Education" sortable="true">
                                            ${movedBioDataListId.education}
                                        </display:column>
                                        <display:column  title="City" sortable="true">
                                            ${movedBioDataListId.cityName}
                                        </display:column>
                                        <display:column  title="Community" sortable="true" >
                                            ${movedBioDataListId.community}
                                        </display:column>                                                                                
                                        <display:column  title="Reg.Date" sortable="true" >
                                            ${movedBioDataListId.regDateString}  
                                        </display:column>

                                        <display:column  title="Moved Date" sortable="true" property="movedDate"/>

                                        <display:column  title="Gotra" sortable="true" >
                                            ${movedBioDataListId.gotra}  
                                        </display:column>
                                        <display:column  title="Native Place" sortable="true" >
                                            ${movedBioDataListId.nativeData}  

                                        </display:column>
                                        <display:column title="Reason" property="reason" sortable="true"/>
                                        <display:column title="Moved By" property="userName" sortable="true"/>

                                        <display:setProperty name="paging.banner.placement" value="bottom"/>
                                        <display:setProperty name="export.csv.include_header" value="true" />
                                        <display:setProperty name="export.csv" value="true" />
                                        <display:setProperty name="export.csv.filename" value="Moved_BioData.csv"/>
                                        <display:setProperty name="export.excel.filename" value="Moved_BioData.xls"/>
                                        <display:setProperty name="export.excel" value="true" />
                                        <%--<display:setProperty name="export.pdf" value="true" />--%>
                                        <%--<display:setProperty name="export.pdf.class" value="org.displaytag.export.DefaultPdfExportView" />--%>
                                        <%--<display:setProperty name="export.pdf.filename" value="Moved_BioData.pdf"/>--%>
                                        <display:setProperty name="export.xml" value="false" />
                                        <display:setProperty name="export.xml.filename" value="Moved_BioData.xml"/> 
                                    </display:table>
                                </div>
                            </div>
                        </div></div>


                </section>

            </section>
        </section><!--MAIN CONTENT ENDS-->
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

        <!--For Status List-->
        <div id="statusListIndividual" class="modal fade" role="dialog" >
            <div class="modal-dialog" style="overflow-y: initial !important">

                <!-- Modal content-->
                <div class="modal-content"  >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="statusListHorizontalHeading">Status List</h4>
                    </div>                 
                    <div class="tab-content" >
                        <div class="tab-pane fade in active" id="additionalInfoListHorizontalDiv">
                            <div id="statusListIndividualListDiv" class="statusListIndividualListDivmodalBody" style="padding-top: 20px;" >

                            </div>
                        </div>

                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <!-- -->
        </div>

        <!--FOR EMAIL-->      
        <datalist id="searchName" >
            <s:iterator value="contactListTest" var="contactListAllId">
                <option value="${contactListAllId.firstName} ${contactListAllId.middleName} ${contactListAllId.lastName} ${contactListAllId.profileId}"> </option>

            </s:iterator>

        </datalist>
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
            </div></div>

        <!--EAMAIL END-->
        <!--For follow-Up-->

        <div id="armFollowup" class="modal fade" role="dialog">
            <div class="modal-dialog ">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" >Follow-Up</h4>
                    </div>
                    <div class="modal-body paddingNone whiteBG">

                        <div id="profileFollowupDiv">

                        </div>

                        <!--</div>-->
                    </div>
                    <div class="modal-footer" style="display:none;">

                        <button type="button" class="btn btn-default" data-dismiss="modal" id="exchangeModal">Close</button>
                    </div>
                </div>
            </div></div>


        <!--Follow_up End-->


    </section><!--Section Ends - Page ends-->
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
    <s:include value="/includes/footer.jsp" />
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.scrollTo.min.js"></script>
    <script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../js/scripts.js"></script>
    <script type="text/javascript" src="../js/nicEdit-latest.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
                                                $(function ()
                                                {
                                                    $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                                                    $('#fromDate').on('changeDate', function (ev) {
                                                        $(this).datepicker('hide');
                                                    });

                                                    $("#toDate").datepicker({format: 'dd/mm/yyyy'});
                                                    $('#toDate').on('changeDate', function (ev) {
                                                        $(this).datepicker('hide');
                                                    });

                                                    $("#reset-date").click(function () {


                                                    });
                                                });

                                                $(document).ready(function () {
                                                    document.getElementById('searchBy').addEventListener('input', function () {

                                                        var val = document.getElementById("searchBy").value;
                                                        var data = val.split(" ");
                                                        if (data.length > 3)
                                                        {
                                                            $('.searchButton').click();
                                                        }
                                                    });
                                                });


    </script>
</body>
</html>
