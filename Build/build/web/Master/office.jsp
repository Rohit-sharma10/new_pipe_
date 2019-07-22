<%-- 
    Document   : astroCity
    Created on : 13 Aug, 2016, 12:10:07 PM
    Author     : OpenSpace
--%>

<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page buffer = "100kb" %>
        <s:set name="theme" value="'simple'" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
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

        <script>

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

                            <h4 class="candidateName">Office List</h4>
                      
                            <div class="text-center" style="float: right;"><a href="addOffice" ><button value="add" class="btn btn-primary" >Add</button></a> </div>

                            <!--<div class="col-lg-2"><div class="formDATA" style="float: right;"><a href="addOffice" ><button value="add" class="btn btn-primary" >Add</button></a></div>-->                        
                            <div class="row">
                                <div class="col-lg-12" >

                                    <display:table   name="officeList"  id="officeListId" pagesize="15"   requestURI="" class="borderNoneTable tableBG uiTable postedTable" >                                                                                                    
                                        <display:column title="Office Name" property="officeName" sortable="true"/>
                                        <display:column title="Contact Person" property="contactPerson" sortable="true"/>
                                        <display:column title="Email" property="email" sortable="true"/> 
                                        <display:column title="Mobile" property="mobile" sortable="true"/>
                                        <display:column title="Telephone" property="telephone" sortable="true"/>
                                        <display:column title="Address" property="address" sortable="true"/>
                                        <display:column title="City" property="cityName" sortable="true"/>
                                        <display:column title="State" property="stateName" sortable="true"/>
                                        <display:column title="Country" property="countryName" sortable="true"/> 
                                        <display:column title="Edit" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="editOffice?officeId=${officeListId.officeId}">
                                                <img src="../img/graphics_pen_black.png" title="Edit"/></a>
                                            </display:column>

                                        <display:column title="Delete" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="deleteOffice?officeId=${officeListId.officeId}">
                                        <img src="../img/newdel.png"  title="Delete"/></a>
                                        </display:column>
                                        <%--<display:setProperty name="paging.banner.placement" value="bottom"/>--%>
                                        <%--<display:setProperty name="export.csv.include_header" value="true" />--%>
                                        <%--<display:setProperty name="export.csv" value="true" />--%>
                                        <%--<display:setProperty name="export.csv.filename" value="OfficeList.csv"/>--%>
                                        <%--<display:setProperty name="export.excel.filename" value="OfficeList.xls"/>--%>
                                        <%--<display:setProperty name="export.excel" value="true" />--%>     
                                        <%--<display:setProperty name="export.xml" value="false" />--%>
                                        <%--<display:setProperty name="export.xml.filename" value="OfficeList.xml"/>--%> 
                                    </display:table>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <script src="../js/jquery.js"></script>
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
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
    $(function ()
    {
//                $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
//                $("#toDate").datepicker({format: 'dd/mm/yyyy'});
    });
        </script>
    </body>
</html>
