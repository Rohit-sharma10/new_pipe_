<%-- 
    Document   : rmReport
    Created on : 16 Jun, 2016, 6:43:55 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>Subhlagan</title>-->
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ page buffer = "100kb" %>
        <s:set name="theme" value="'simple'" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
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
        <script src="../js/rmReport.js"></script>
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
                            <form action="generateReport">
                                <table class="reportTable">
                                    <tr>
                                        <th>
                                            Date From
                                        </th>
                                        <th>
                                            Date To
                                        </th>
                                        <th colspan="3">
                                            User Id 
                                        </th>

                                    </tr>
                                    <tr>

                                        <td>
                                            <input  type="text" id="from" name="profileFollowup.dateFrom" placeholder="From" value="${dateFrom}"/>

                                        </td>

                                        <td>
                                            <input type="text" id="to" name="profileFollowup.dateTo" placeholder="To" value="${dateTo}"/>

                                        </td>
                                        <td>
                                            <s:select  style="height:58px!important;"  id="userId" list="userList" listKey="userId" multiple="true" listValue="name" name="profileFollowup.userIdArr"></s:select>

                                        </td>
                                       
                                        <td>
                                            <select name="profileFollowup.callYes" >
                                                 <option value="0" ${callYes=="0"?'selected':''}>SELECT</option>
                                                <option value="Y" ${callYes=="Yes"?'selected':''}>Yes</option>
                                                <option value="N" ${callYes=="No"?'selected':''}>No</option>
                                            </select>
                                        </td>
                                       <input type="hidden" name="profileFollowup.searchFlag" value="1">
                                         <td>
                                            <input class="btn btn-advanceSearch" type="submit" value="Search" />
                                        </td>
                                        </tr>

                                    </table>
                                </form>
                                            
                                            <!--<div class="headSM">-->                
                                            <div class="activeDataDiv"> Unique Count <b>${uniqCount[0]}</b> FollowUp <b>${uniqCount[1]}</b>
                                    </div>
                                <!--</div>-->
                                </br></br>
                                            
                                <div id="reportListDiv">

                                <display:table   name="profileFollowupList"  id="profileFollowupListId"  export="true" pagesize="25"  requestURI="" class="borderNoneTable tableBG uiTable rmFollowupTable" >
                                    <display:column  title="Date" property="followupDateString" >
                                    </display:column>
                                    <display:column title="User" property="userName" >
                                    </display:column>
                                    <display:column title="Posted To" property="contactName">
                                    </display:column>
                                    <display:column title="Number" property="contactNumber">
                                    </display:column>
                                    <display:column title="Posted For" property="matchName">
                                    </display:column>
                                    <display:column title="Feedback" property="remark">
                                    </display:column>
                                    <display:column title="Short's" property="shortcode">
                                    </display:column>
                                    <display:column title="DC or F" property="dailyOrFollowup">
                                    </display:column>
                                    <display:column title="Yes/No" property="callYes">
                                    </display:column>
                                    <display:setProperty name="paging.banner.placement" value="bottom"/>
                                    <display:setProperty name="export.csv.include_header" value="true" />
                                    <display:setProperty name="export.csv" value="true" />
                                    <display:setProperty name="export.csv.filename" value="product_master.csv"/>
                                    <display:setProperty name="export.excel.filename" value="product_master.xls"/>
                                    <display:setProperty name="export.excel" value="true" />
                                    <display:setProperty name="export.pdf" value="true" />
                                    <display:setProperty name="export.pdf.class" value="org.displaytag.export.DefaultPdfExportView" />
                                    <display:setProperty name="export.pdf.filename" value="product_master.pdf"/>
                                    <display:setProperty name="export.xml" value="true" />
                                    <display:setProperty name="export.xml.filename" value="product_master.xml"/> 
                                </display:table>

                            </div>

                            <!--copy from here-->
                        </div>
                    </div>

                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>

        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>

        <script type="text/javascript"></script>
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
                $('#from').datepicker({
                    format: "dd/mm/yyyy",
                });
                $('#to').datepicker({
                    format: "dd/mm/yyyy",
                });
            });
        </script>
    </body>
</html>
