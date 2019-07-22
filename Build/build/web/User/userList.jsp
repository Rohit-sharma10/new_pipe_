<%-- 
    Document   : profileList
    Created on : 12 Mar, 2016, 12:53:44 PM
    Author     : OpenSpace004
--%>
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <form action="../User/userList" method="post">                                                             
                                <div class="col-lg-2 paddingNone">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="userMaster.name"  placeholder="Name"/>
                                        </div>
                                    </div>
                                </div> <div class="col-lg-2">                          
                                    <div class="formDATA"><button value="search" class="btn btn-primary" >Search</button></div>  </div>                            
                            </form>
                            <div class="col-lg-2"><div class="formDATA"><a href="addUser" ><button value="search" class="btn btn-primary" >Add User</button></a></div></div>
                             <div class="loading1">
                                <img src="../img/loader1.gif" id="loading1" style="display:none;" >
                            </div>
                            <div class="col-lg-2"><div class="formDATA"><a href="#" ><button value="reset" class="btn btn-primary" onclick="resetConfirm()" >Reset Password</button></a></div></div>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <display:table   name="userList"  id="userListId" pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable" >                                       
                                        <display:column  sortable="true"  title="Name" style="width:100px;" property="name" />                                        

                                        <display:column  property="mobile" title="Mobile" sortable="true" />                                       

                                        <display:column  title="DepartMent" sortable="true" property="designation"/>                                         

                                        <display:column  title="User Name" sortable="" property="userName"/>                                                                                     
                                        <display:column  title="Office" sortable="" property="officeAddress"/>  
                                        <display:column title="Edit" sortable="" style="width:5%;text-align:left" >
                                            <a href="editUserList?userId=${userListId.userId}">
                                                <img src="../img/graphics_pen_black.png" title="Edit"/></a>
                                            </display:column>

                                        <display:column title="Delete" sortable="" style="width:5%;text-align:left" >
                                            <a href="deleteUserList?userId=${userListId.userId}">
                                                <img src="../img/newdel.png"  title="Delete"/></a>
                                            </display:column>
                                            <display:setProperty name="paging.banner.placement" value="bottom"/>

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
                                function resetConfirm()
                                {
                                    if (confirm("Are you sure ,you want to Reset password?"))
                                    {
                                         document.getElementById('loading1').style.display = "block";
                                        $.ajax({
                                            type: "post",
                                            url: "resetPasswordForAllUser",
                                            success: function (html)
                                            {
                                                document.getElementById('loading1').style.display = "none";
                                                alert("Password Updated Successfully And Mail Sent to Senior RM");

                                            }, error: function ()
                                            {
//                alert("Please try later");
                                            }
                                        });
                                    }
                                }
//            $(function () {
//                /* #txt is display table id & employee_search_ class is field id which you want to filter */
//                var oTable = $('#userListId').dataTable({
//                    "bPaginate": false,
//                    "bLengthChange": false,
//                    "bFilter": true,
//                    "bSort": false,
//                    "bInfo": false,
//                    "bAutoWidth": false,
//                    "bStateSave": false
//                });
//                $("thead input").keyup(function () {
//                    oTable.fnFilter(this.value, $("thead input").index(this));
//                });
//
//                $("thead input").focus(function () {
//                    if (this.className == "employee_search_") {
//                        this.className = "";
//                        this.value = "";
//                    }
//                });
//
//                $("thead input").blur(function (i) {
//                    if (this.value == "") {
//                        this.className = "employee_search_";
//                        this.value = asInitVals[$("thead input").index(this)];
//                    }
//                }); 
//            });  auto search box commented by vineet on 
        </script>
    </body>
</html>
