<%-- 
    Document   : LoginAccess
    Created on : 25 Jul, 2016, 11:18:43 AM
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
                            <h4 class="candidateName">Short Access Report</h4>
                            <label style="color:red!important;width:100%!important; text-align: center">${message}</label>
<!--                            <form action="searchLoginAccess" method="post">

                                <div class="col-lg-2 paddingNone col-select-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                                                                  
                                        </div>
                                    </div>
                                </div>                               
                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                          
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="formDATA"><button value="search" class="btn btn-primary" >Search</button></div>  </div>                            
                            </form>-->



                            <display:table name="shortList"  id="shortListId" pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" export="true"  >                                                            
                                <display:column  property="shortName" title="Posted By" sortable="true" style="width:4%;text-align:left"/>                                   

                                <display:column title="Posted To" property="fullContactName" sortable="true" style="width:50%;text-align:left">
                                    <a href="getContactDetail?contactId=${shortListId.shortContactId}">  ${shortListId.fullContactName}</a>                                                                    
                                </display:column>     
                                <display:column title="Posted For" property="fullMatchName" sortable="true" style="width:50%;text-align:left">
                                    <a href="getContactDetail?contactId=${shortListId.matchContactId}">  ${shortListId.fullMatchName}</a>                                                                    
                                </display:column>
                                <display:column title="Date" sortable="true" property="date"/>
                                <%--<display:column title="Delete" media="html" sortable="" style="width:10%;text-align:left" >--%>
<!--                                    <a href="deleteShortList?shortId=${shortListId.shortId}">
                                        <img src="../img/newdel.png"  title="Delete"/></a>-->
                                    <%--</display:column>--%>
                                    <display:setProperty name="paging.banner.placement" value="both"/>   
                                    <display:setProperty name="export.csv.include_header" value="true" />
                                    <display:setProperty name="export.csv" value="true" />
                                    <display:setProperty name="export.csv.filename" value="shortList.csv"/>
                                    <display:setProperty name="export.excel.filename" value="shortList.xls"/>
                                    <display:setProperty name="export.excel" value="true" />

                            </display:table>
                            <div id="email" class="modal fade" role="dialog" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Email</h4>
                                        </div>
                                        <div class="tab-subject">

                                        </div>
                                        <div class="tab-content">

                                        </div>
                                    </div>
                                </div>
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
        <script>
//            $(".content").on('click', function () {
//                var emailId = $(this).attr('email');
//                $.ajax({
//                    type: "post",
//                    url: "getEmailContent",
//                    data: "emailId=" + emailId,
//                    success: function (html)
//                    {
//                        if (html)
//                            var splithtml = html.split("___");
//                        $('.tab-subject').html("  Subject : " + splithtml[0] + "<br><br>");
//                        $('.tab-content').html("   Message : " + splithtml[1]);
//                    }
//                });
//            });

            $(function ()
            {
                $("#fromDate").datepicker({dateformat: 'dd/mm/yy'});
                $("#toDate").datepicker({datepicker: 'dd/mm/yy'});
            });

        </script>
        <script src="../js/scripts.js"></script>
    </body>
</html>


