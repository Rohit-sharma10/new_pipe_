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
                            <h4 class="candidateName">Login Access Report</h4>
                            <label style="color:red!important;width:100%!important; text-align: center">${message}</label>
                            <form action="searchLoginAccess" method="post">

                                <div class="col-lg-2 paddingNone col-select-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <s:select headerKey="0" headerValue="--- Select User ---" cssClass="input_box" id="userListId"
                                                      list="userList" listKey="userId"  listValue="userName" 
                                                      name="loginBean.userId" value="%{loginBean.userId}"/>                                             
                                        </div>
                                    </div>
                                </div>                               
                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="loginBean.ipAddress" value="${loginBean.ipAddress}" placeholder="IP Address"/> 
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="loginBean.fromDate" value="${loginBean.fromDate}" placeholder="From Date" id="fromDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-input-width">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="loginBean.toDate" value="${loginBean.toDate}" placeholder="To Date" id="toDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="formDATA"><button value="search" class="btn btn-primary" >Search</button></div>  </div>                            
                            </form>



                            <display:table export="true" name="loginList"  id="loginListId"  pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable postedTable"  >                                                                                             
                                <display:column  property="name" title="Contact Name" sortable="true" style="width:4%;text-align:left"/>                                                                     
                                <display:column title="IPAdress" property="ipAddress" sortable="true" style="width:50%;text-align:left"/>                                                             
                                <display:column title="Description" property="description" sortable="true" style="width:50%;text-align:left"/>                                
                                <display:column title="Date" sortable="true" property="date"/>
                                <display:setProperty name="paging.banner.placement" value="both"/>      
                                <display:setProperty name="export.csv.include_header" value="true" />
                                <display:setProperty name="export.csv" value="true" />
                                <display:setProperty name="export.csv.filename" value="loginReport.csv"/>
                                <display:setProperty name="export.excel.filename" value="loginReport.xls"/>
                                <display:setProperty name="export.excel" value="true" />
                                <display:setProperty name="export.xml" value="false" />
                                <display:setProperty name="export.xml.filename" value="product_master.xml"/> 
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
                $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                $("#toDate").datepicker({format: 'dd/mm/yyyy'});
                  $('#fromDate').val("");
                                            $('#toDate').val("");
            });

        </script>
        <script src="../js/scripts.js"></script>
    </body>
</html>


