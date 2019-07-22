<%-- 
    Document   : MatchReport
    Created on : 26 Jul, 2016, 9:34:48 AM
    Author     : OpenSpace
--%>
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page buffer = "500kb" %>
        <s:set name="theme" value="'simple'" scope="page" />
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
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
           <!--<script src="../js/jquery.autocomplete.js"></script>-->
        <script type="text/javascript">
            jQuery(function () {
                $("#txtAutoComplete1,#txtAutoComplete").autocomplete("List.jsp");
            });
            $('#txtAutoComplete1').on('change', function () {
                $('#tagsname').html('You selected: ' + this.value);
            }).change();
        </script>

        <script type="text/javascript">
            function resendMailMatchReport(type)
            {
                var id = "";
                var intMailBy = document.getElementById('intMailBy').value;
                var mailTo = document.getElementById('mailTo').value;
                var emails = document.getElementById('emails').value;
                var mailNote = document.getElementById('mailNote').value;
                var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var contactId = document.getElementById('contactId').value;
                if (emails.indexOf(',') > -1)
                {
                    var member_split = emails.split(',');
                    for (var n = 0; n < member_split.length; n++) {
                        if (!regEmail.test(member_split[n]))
                        {
                            alert("Please check email");
                            return false;
                        }
                    }
                } else {
                    if (emails !== "")
                    {
                        if (!regEmail.test(emails))
                        {
                            alert("Please check email");
                            return false;
                        }
                    }

                }
                $("input:checkbox[class=chk]").each(function () {
                    if ($(this).is(":checked") === true)
                    {
                        id = id + ',' + $(this).val();
                    }
                });
                if (type === 1)
                {
                    if (id === '')
                    {
                        alert("Please select atleast one contact");
                        return false;
                    } else {
                        document.getElementById("loading").style.display = "block";
                        $('#mailType').val(type);
                        $('#emailForShortList').val(intMailBy);
                        $.ajax({
                            type: "post",
                            url: "emailBioData",
                            data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + id,
                            success: function (html)
                            {
                                document.getElementById('closeModal4').click();
                                document.getElementById("loading").style.display = "none";
                                alert("Mail Sent successfully");
                                document.getElementById('searchMatchReport').click();
                            }
                        });
                        return true;
                    }
                }
                if (type === 2)
                {
                    if (id === '')
                    {
                        alert("Please select atleast one contact");
                        return false;
                    } else {
                        $('#mailType').val(type);
                        $('#emailForShortList').val(intMailBy);
                        document.getElementById("loading").style.display = "block";
                        $.ajax({
                            type: "post",
                            url: "emailBioData",
                            data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + id,
                            success: function (html)
                            {
                                document.getElementById("loading").style.display = "none";
                                document.getElementById('closeModal4').click();
                                alert("Mail Sent successfully");
                                document.getElementById('searchMatchReport').click();
                            }
                        });
                        return true;
                    }
                }
                if (type === 5)
                {
                    if (id === '')
                    {
                        alert("Please select atleast one contact");
                        return false;
                    } else {
                        $('#mailType').val(type);
                        $('#emailForShortList').val(intMailBy);
                        document.getElementById("loading").style.display = "block";
                        $.ajax({
                            type: "post",
                            url: "emailBioData",
                            data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + id,
                            success: function (html)
                            {
                                document.getElementById("loading").style.display = "none";
                                document.getElementById('closeModal4').click();
                                alert("Mail Sent successfully");
                                document.getElementById('searchMatchReport').click();
                            }
                        });
                        return true;
                    }
                }
            }

            function fetchDataForMatchReportResend(contactId, batchId)
            {
                $('#loading-image').show();
                $.ajax({
                    type: "post",
                    url: "getDoBiodataOutBox",
                    data: "contactId=" + contactId + "&batchId=" + batchId,
                    success: function (html) {
                        $('#loading-image').hide();
                        $('#outBoxSection').html(html);
                        document.getElementById('mailTo').value = $('#emailRefHidden').val();
                        document.getElementById('contactId').value = contactId;
                    }
                });
            }
            function selectAll(id)
            {
                var all = document.getElementById(id).checked;
                if (all === true)
                {
                    $('.chk').each(function () { //loop through each checkbox
                        this.checked = true;  //select all checkboxes with class "checkbox1"               
                    });
                } else {
                    $('.chk').each(function () { //loop through each checkbox
                        this.checked = false; //deselect all checkboxes with class "checkbox1"                       
                    });
                }
            }
            function clearData()
            {
                //            $('#fromDate').val("");
                //            $('#toDate').val("");
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

    </head>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP ">
                            <!--copy till here-->
                            <h4 class="candidateName">Match Report</h4>
                            <form action="searchMatchList" method="post"> 

                                <div class="col-lg-3 paddingNone">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <s:select headerKey="0" headerValue="--- Select User ---" cssClass="input_box" cssStyle="width:100%" id="userListId"
                                                      list="userList" listKey="userId"  listValue="userName" 
                                                      name="matchBean.userId" value="%{matchBean.userId}" />                                                  
                                        </div>
                                    </div>
                                </div>  

                                <div class="col-lg-3">
                                    <div class="formDATA">                                       
                                        <div class="controlsData controlWidth">
                                            <select name="matchBean.mailBy" id="mailBy" style="width:100%">
                                                <option value="0" ${matchBean.mailBy=="0"?'selected':''}>--Mail By--</option>
                                                <option value="1" ${matchBean.mailBy=="1"?'selected':''}>Email</option>
                                                <option value="2" ${matchBean.mailBy=="2"?'selected':''}>By Hand</option></select>                                           
                                        </div>
                                    </div>
                                </div>

                                <!--                                <div class="col-lg-3">
                                                                    <div class="formDATA">
                                                                        <div class="controlsData controlWidth">
                                                                            <input type="text" name="matchBean.shortName" value="{matchBean.shortName}" placeholder="Posted By"/>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                <div class="col-lg-3">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">    
                                           <input type="text" id="txtAutoComplete" class="searchInput"  name="matchBean.search"  placeholder="Posted To" />
                                          

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 paddingNone" >
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">    
                                            <input type="text"  class="searchInput" id="txtAutoComplete" name="matchBean.search1"  placeholder="Posted For" />
                                       
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 paddingNone">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="matchBean.fromDate" value="${matchBean.fromDate}" placeholder="From Date" id="fromDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="matchBean.toDate" value="${matchBean.toDate}" placeholder="To Date" id="toDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="matchBean.batchId"  placeholder="Batch No" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="formDATA"><button value="search" class="btn btn-primary" id="searchMatchReport" onclick="clearData()">Search</button></div>  </div>     


                            </form>



                            <div class="loading" style="top: 50% !important;">
                                <img src="../img/loader1.gif" id="loading-image"  style="display:none;">
                            </div>

                        </div>

                    </div>
                    <c:if test="${count!='0'}">
                        <div class="searchBatcheCount" >
                            <b> ${count} Mail Sent</b>
                        </div>
                    </c:if>

                    <div class="row">

                        <div class="col-lg-12">

                            <display:table name="matchList"  id="matchListId" pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" export="true" >                                                                                             
                                <display:column  property="batchId" title="BatchNo"/>  
                                <display:column  property="shortName" title="Posted By" sortable="true" style="width:4%;text-align:left"/>  
                                <display:column title="Posted To" sortable="true"   style="width:50%;text-align:left" media="html">
                                    <a href="getContactDetail?contactId=${matchListId.contactId}"> ${matchListId.fullContactName} </a>                                                                    
                                </display:column> 
                                <display:column title="Posted To" property="fullContactName" media="csv"/>
                                <display:column title="Posted To" property="fullContactName" media="excel"/>
                                <display:column title="Posted For" sortable="true" style="width:50%;text-align:left" media="html">
                                    <a href="getContactDetail?contactId=${matchListId.matchId}"> ${matchListId.fullMatchName} </a>                                                                    
                                </display:column>
                                <display:column title="Posted For" property="fullMatchName" media="csv"/>
                                <display:column title="Posted For" property="fullMatchName" media="excel"/>
                                <display:column property="mailTo"  title="Email To/By Hand" />
                                <display:column title="Date" sortable="true" property="date"/>
                                <display:column title="Status" sortable="true" property="sentStatus"/>
                                <display:column title="Resend" sortable="true" media="html">
                                    <a data-toggle="modal" data-target="#myModal3" href="#" onclick="fetchDataForMatchReportResend(${matchListId.contactId},${matchListId.batchIdInt})">${matchListId.resend}</a>
                                </display:column>                             
                                <display:setProperty name="paging.banner.placement" value="both"/>
                                <display:setProperty name="export.csv.include_header" value="true" />
                                <display:setProperty name="export.csv" value="true" />
                                <display:setProperty name="export.csv.filename" value="matchreport.csv"/>
                                <display:setProperty name="export.excel.filename" value="matchreport.xls"/>
                                <display:setProperty name="export.excel" value="true" />           
                                <display:setProperty name="export.xml" value="false" />
                                <display:setProperty name="export.xml.filename" value="product_master.xml"/> 
                            </display:table>
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
                                    <h4 id=matchReportHeading" class="modal-title">Outbox </h4>
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
                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <!--<script src="../js/jquery.js"></script>-->
        <script src="../js/jquery.autocomplete.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <!--        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>-->
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>
        <script>
                                        $(function ()
                                        {
                                            $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                                            $("#toDate").datepicker({format: 'dd/mm/yyyy'});
                                            $('#fromDate').val("");
                                            $('#toDate').val("");
//                                            $('#loading-image').bind('ajaxStart', function () {
//                                                document.getElementById("loading-image").style.display = "block";
//                                            }).bind('ajaxStop', function () {
//                                                document.getElementById("loading-image").style.display = "none";
//                                            });
                                        });

        </script>
        <script src="../js/scripts.js"></script>
          
    </body>
</html>


