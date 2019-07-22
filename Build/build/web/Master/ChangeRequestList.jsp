<%-- 
    Document   : ShortProfileList
    Created on : 21 Jul, 2016, 4:57:32 PM
    Author     : OpenSpace
--%>
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page buffer = "100kb" %>
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
        <script src="../js/profileList.js"></script>
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <script src="../js/jquery.autocomplete.js"></script>
        <script type="text/javascript">
            jQuery(function () {
                $("#txtAutoComplete1,#txtAutoComplete").autocomplete("List.jsp");
//                 $("#txtAutoComplete").autocomplete("List.jsp");

            });
            $('#txtAutoComplete1').on('change', function () {
                $('#tagsname').html('You selected: ' + this.value);
            }).change();
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
                        <div class="col-lg-12 marginTOP">
                            <!--copy till here-->
                            <h4 class="candidateName">Change Request List</h4>                          
                            <div style="height: 20px"></div>
                            <display:table name="changeRequestList"  id="changeRequestListId" pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" export="true"  >   

                                <display:column title="Name" sortable="true" style="width:50%;text-align:left" media="html">                                  
                                    <a href="getContactDetailForChange?contactId=${changeRequestListId.contactId}" target="_blank">${changeRequestListId.firstName} ${changeRequestListId.middleName} ${changeRequestListId.lastName} ${changeRequestListId.category} ${changeRequestListId.profileId}(${changeRequestListId.assignedToString}/${changeRequestListId.assignedToArm})</a>
                                </display:column>
                                    <!--For export in csv Excel-->
                                    <display:column title="Name" sortable="true" style="width:50%;text-align:left" media="excel">                                  
                                    ${changeRequestListId.firstName} ${changeRequestListId.middleName} ${changeRequestListId.lastName} ${changeRequestListId.category} ${changeRequestListId.profileId}
                                </display:column>
                                    <display:column title="Name" sortable="true" style="width:50%;text-align:left" media="csv">                                  
                                    ${changeRequestListId.firstName} ${changeRequestListId.middleName} ${changeRequestListId.lastName} ${changeRequestListId.category} ${changeRequestListId.profileId}
                                </display:column>  
                                    <!--Export column-->
                                <display:column title="DOB" sortable="true" property="dobString"/>
                                <display:column title="Height" sortable="true" property="heightString"/>
                                <display:column title="Education" sortable="true" property="education"/>
                                <display:column title="City" sortable="true" property="city"/>
                                <display:column title="Community" sortable="true" property="community"/>
                                <%--<display:column title="Reg.Date" sortable="true" property="regDateString"/>--%>
                                <display:column title="Request Date" sortable="true" property="modDate"/>
                                <display:column title="Gotra" sortable="true" property="gotra"/>
                                <display:column title="Native Place" sortable="true" property="nativeData"/>
                                <display:column title="Added By" sortable="true" property="profileCreatedBy"/>
                                <display:column title="Approved" sortable="true" property="approvedChangeRequest"/>
                                <display:setProperty name="paging.banner.placement" value="both"/>
                                <display:setProperty name="export.csv.include_header" value="true" />
                                <display:setProperty name="export.csv" value="true" />
                                <display:setProperty name="export.csv.filename" value="ChangeRequestList.csv"/>
                                <display:setProperty name="export.excel.filename" value="ChangeRequestList.xls"/>
                                <display:setProperty name="export.excel" value="true" />
                                <display:setProperty name="export.xml" value="false" />
                                <display:setProperty name="export.xml.filename" value="ChangeRequestList.xml"/> 

                            </display:table>                           
                            <!--copy from here-->
                        </div>
                    </div>
                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <!--<script src="../js/jquery.js"></script>-->
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script type="text/javascript" src="../js/nicEdit-latest.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>
        <script>

            $(function ()
            {
                $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                $("#toDate").datepicker({format: 'dd/mm/yyyy'});
            });

        </script>
        <script src="../js/scripts.js"></script>
    </body>
</html>

